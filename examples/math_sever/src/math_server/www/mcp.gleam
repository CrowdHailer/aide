import aide
import aide/definitions
import gleam/dynamic/decode
import gleam/http
import gleam/http/request.{Request}
import gleam/json
import gleam/option.{Some}
import gleam/string
import math_server/mcp
import wisp

pub fn handle(request, context) {
  let Request(method:, ..) = request
  case method {
    http.Delete -> wisp.no_content()
    http.Post -> {
      // decode input to a MCP request
      use mcp_request <- decode_json(request, aide.request_decoder())

      // create an mcp server config.
      // In this example the server is the same for all users, but if different tools are required for different users,
      // this is where you would create a user specific server.
      let server = server(context)

      // handle mcp request in the mcp module
      mcp.handle(mcp_request, server)
      // encode the response and return it
      |> option.map(aide.response_encode)
      |> option.map(json.to_string)
      |> option.map(wisp.json_response(_, 200))
      |> option.unwrap(wisp.response(202))
    }
    _ -> wisp.method_not_allowed([http.Post, http.Delete])
  }
}

fn decode_json(request, decoder, then) {
  use data <- wisp.require_json(request)
  case decode.run(data, decoder) {
    Ok(value) -> then(value)
    Error(reason) -> wisp.bad_request(string.inspect(reason))
  }
}

fn server(_context) {
  aide.Server(
    implementation: definitions.Implementation(
      name: "math_server",
      version: "0.1.0",
      title: Some("Math Server"),
    ),
    tools: mcp.tools(),
    resources: [],
    resource_templates: [],
    prompts: [],
  )
}
