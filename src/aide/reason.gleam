import aide/json_rpc
import gleam/dict
import gleam/dynamic/decode
import gleam/list
import gleam/string
import oas/generator/utils

pub fn method_not_available(method) {
  json_rpc.ErrorObject(
    code: -32_601,
    message: "Method unavailable: " <> method,
    data: utils.Object(dict.from_list([#("method", utils.String(method))])),
  )
}

/// Used for unknown and unavailable
pub fn unknown_tool(tool) {
  json_rpc.ErrorObject(
    code: -32_602,
    message: "Unknown tool: " <> tool,
    data: utils.Object(dict.from_list([#("tool", utils.String(tool))])),
  )
}

pub fn unknown_prompt(prompt) {
  json_rpc.ErrorObject(
    code: -32_602,
    message: "Unknown prompt: " <> prompt,
    data: utils.Object(dict.from_list([#("prompt", utils.String(prompt))])),
  )
}

pub fn invalid_log_level(level) {
  json_rpc.ErrorObject(
    code: -32_602,
    message: "Invalid log level: " <> level,
    data: utils.Object(dict.from_list([#("level", utils.String(level))])),
  )
}

pub fn invalid_arguments(tool, decode) {
  let reason =
    list.map(decode, fn(error) {
      let decode.DecodeError(expected:, found:, path:) = error
      utils.Object(
        dict.from_list([
          #("expected", utils.String(expected)),
          #("found", utils.String(found)),
          #("path", utils.String(string.join(path, "."))),
        ]),
      )
    })
    |> utils.Array
  json_rpc.ErrorObject(
    code: -32_602,
    message: "Invalid arguments for tool: " <> tool,
    data: utils.Object(
      dict.from_list([#("tool", utils.String(tool)), #("reason", reason)]),
    ),
  )
}

pub fn resource_not_found(uri) {
  json_rpc.ErrorObject(
    code: -32_002,
    message: "Resource not found",
    data: utils.Object(dict.from_list([#("uri", utils.String(uri))])),
  )
}
