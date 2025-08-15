import gleam/dict
import gleam/dynamic/decode
import gleam/json
import gleam/string
import oas/generator
import oas/json_schema
import simplifile

pub fn main() {
  let decoder =
    decode.field(
      "definitions",
      decode.dict(decode.string, json_schema.decoder()),
      decode.success,
    )

  let assert Ok(content) = simplifile.read("./priv/2025-06-18/schema.json")

  // TODO extract the constant value for each request type
  let assert Ok(definitions) = json.parse(content, decoder)
  let definitions =
    dict.map_values(definitions, fn(key, value) {
      case is_request(key) || is_notification(key) {
        True -> lift_params(value)
        False -> value
      }
    })

  let assert Ok(contents) =
    generator.gen_schema_file(definitions)
    |> generator.run_single_location("#/definitions/")
  let assert Ok(Nil) =
    simplifile.write("./src/aide/mcp/definitions.gleam", contents)
}

fn is_request(key) {
  case string.ends_with(key, "Request"), key {
    _, "ClientRequest" | _, "ServerRequest" | _, "JSONRPCRequest" -> False
    True, _ -> True
    False, _ -> False
  }
}

fn is_notification(key) {
  case string.ends_with(key, "Notification"), key {
    _, "ClientNotification" | _, "ServerNotification" | _, "JSONRPCNotification"
    -> False
    True, _ -> True
    False, _ -> False
  }
}

fn lift_params(value) {
  case value {
    json_schema.Object(properties: p, ..) ->
      case dict.size(p), dict.get(p, "method"), dict.get(p, "params") {
        2,
          Ok(json_schema.Inline(json_schema.String(..))),
          Ok(json_schema.Inline(params))
        -> params
        _, _, _ -> panic as "method and params should be string and object"
      }
    _ -> panic as "Request should be an object"
  }
}
