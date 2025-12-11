import gleam/dynamic
import gleam/dynamic/decode
import gleam/int
import gleam/json
import gleam/list
import gleam/option.{None, Some}
import oas/decodex
import oas/generator/utils

const jsonrpc = "2.0"

pub type Id {
  StringId(String)
  NumberId(Int)
}

fn id_decoder() {
  decode.one_of(decode.string |> decode.map(StringId), [
    decode.int |> decode.map(NumberId),
  ])
}

fn id_encode(id) {
  case id {
    StringId(string) -> json.string(string)
    NumberId(number) -> json.int(number)
  }
}

pub fn id_to_string(id) {
  case id {
    NumberId(id) -> int.to_string(id)
    StringId(id) -> id
  }
}

// Notifications have no id
pub type Request(r, n) {
  Request(version: String, id: Id, value: r)
  Notification(version: String, value: n)
}

pub fn request(id, value) {
  Request(version: jsonrpc, id:, value:)
}

pub fn notification(value) {
  Notification(version: jsonrpc, value:)
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
          decode.failure(
            Notification(version, zero),
            "missing decoder " <> method,
          )
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
          decode.failure(
            Notification(version, zero),
            "missing decoder " <> method,
          )
      }
  }
}

pub fn request_encode(request, request_encode, notification_encode) {
  case request {
    Request(version:, id:, value:) -> {
      let #(method, params) = request_encode(value)
      json.object([
        #("jsonrpc", json.string(version)),
        #("id", id_encode(id)),
        #("method", json.string(method)),
        ..case params {
          None -> []
          Some(params) -> [
            #("params", params),
          ]
        }
      ])
    }
    Notification(version:, value:) -> {
      let #(method, params) = notification_encode(value)
      json.object([
        #("jsonrpc", json.string(version)),
        #("method", json.string(method)),
        ..case params {
          None -> []
          Some(params) -> [
            #("params", params),
          ]
        }
      ])
    }
  }
}

pub type ErrorObject {
  ErrorObject(code: Int, message: String, data: utils.Any)
}

fn error_object_decoder() {
  use code <- decode.field("code", decode.int)
  use message <- decode.field("message", decode.string)
  use data <- decode.optional_field("data", utils.Null, utils.any_decoder())
  decode.success(ErrorObject(code:, message:, data:))
}

fn error_object_encode(obj) {
  let ErrorObject(code:, message:, data:) = obj
  json.object([
    #("code", json.int(code)),
    #("message", json.string(message)),
    #("data", utils.any_to_json(data)),
  ])
}

pub type Response(t) {
  Response(version: String, id: Id, return: Result(t, ErrorObject))
}

pub fn response(id, result) {
  Response(jsonrpc, id, result)
}

pub fn result(id, result) {
  Response(jsonrpc, id, Ok(result))
}

pub fn response_decoder(return_decoder) {
  use version <- decode.field("jsonrpc", decode.string)
  use id <- decode.field("id", id_decoder())
  use return <- decode.then(
    decode.one_of(
      {
        use value <- decode.field("result", return_decoder)
        decode.success(Ok(value))
      },
      [
        {
          use reason <- decode.field("error", error_object_decoder())
          decode.success(Error(reason))
        },
      ],
    ),
  )
  decode.success(Response(version:, id:, return:))
}

pub fn response_encode(response, return_encode) {
  let Response(version:, id:, return:) = response

  json.object([
    #("jsonrpc", json.string(version)),
    #("id", id_encode(id)),
    case return {
      Ok(value) -> #("result", return_encode(value))
      Error(obj) -> #("error", error_object_encode(obj))
    },
  ])
}
