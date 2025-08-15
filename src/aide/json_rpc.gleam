import gleam/dynamic
import gleam/dynamic/decode
import gleam/json
import gleam/list
import gleam/option.{None, Some}
import oas/decodex
import oas/generator/utils

const jsonrpc = "2.0"

// Notifications have no id
pub type Request(r, n) {
  Request(version: String, id: Id, value: r)
  Notification(version: String, value: n)
}

pub fn notification(value) {
  Notification(version: jsonrpc, value:)
}

pub type ParamsDecoder(t) {
  FromParams(decode.Decoder(t))
  OptionalParams(decode.Decoder(t))
  NoParams(t)
}

pub fn request_decoder(request_decoders, notification_decoders, zero) {
  use version <- decode.field("jsonrpc", decode.string)
  use id <- decodex.optional_field("id", id_decoder())
  use method <- decode.field("method", decode.string)
  case id {
    Some(id) ->
      case list.key_find(request_decoders, method) {
        Ok(decoder) -> {
          use maybe <- decodex.optional_field("params", decodex.any())
          // In mcp there are optional fields
          let params = option.unwrap(maybe, dynamic.properties([]))
          case decode.run(params, decoder) {
            Ok(value) -> decode.success(Request(version:, id:, value:))
            Error(_reason) ->
              decode.failure(Notification(version, zero), "params")
          }
        }
        Error(Nil) ->
          decode.failure(Notification(version, zero), "missing decoder")
      }
    None ->
      case list.key_find(notification_decoders, method) {
        Ok(decoder) -> {
          use maybe <- decodex.optional_field("params", decodex.any())
          // In mcp there are optional fields
          let params = option.unwrap(maybe, dynamic.properties([]))
          case decode.run(params, decoder) {
            Ok(value) -> decode.success(Notification(version:, value:))
            Error(_reason) ->
              decode.failure(Notification(version, zero), "params")
          }
        }
        Error(Nil) ->
          decode.failure(Notification(version, zero), "missing decoder")
      }
  }
}

pub type Id {
  StringId(String)
  NumberId(Int)
}

fn id_decoder() {
  decode.one_of(decode.string |> decode.map(StringId), [
    decode.int |> decode.map(NumberId),
  ])
}

fn encode_id(id) {
  case id {
    StringId(string) -> json.string(string)
    NumberId(number) -> json.int(number)
  }
}

pub type Response(t) {
  Response(version: String, id: Id, return: Result(t, ErrorObject))
}

pub type ErrorObject {
  ErrorObject(code: Int, message: String, data: utils.Any)
}

pub fn encode_response(response, encode_return) {
  let Response(version:, id:, return:) = response

  json.object([
    #("jsonrpc", json.string(version)),
    #("id", encode_id(id)),
    case return {
      Ok(value) -> #("result", encode_return(value))
      Error(ErrorObject(code:, message:, data:)) -> #(
        "error",
        json.object([
          #("code", json.int(code)),
          #("message", json.string(message)),
          #("data", utils.any_to_json(data)),
        ]),
      )
    },
  ])
}

pub fn response(id, return: t) {
  Response(jsonrpc, id, Ok(return))
}
