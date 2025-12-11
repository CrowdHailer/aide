import aide
import aide/definitions
import aide/json_rpc
import gleam/dict
import gleam/dynamic/decode
import gleam/http
import gleam/http/request
import gleam/http/response
import gleam/httpc
import gleam/json
import gleam/list
import gleam/option.{type Option, None, Some}
import midas/node
import oas/generator/utils
import oas/json_schema
import spotless

pub type Connection {
  Connection(
    origin: #(http.Scheme, String, Option(Int)),
    path: String,
    auth: Authentication,
  )
}

pub type Authentication {
  Unprotected
  Token(token: String)
}

fn to_request(connection, request, id) {
  let Connection(origin: #(scheme, host, port), path: path, auth:) = connection
  let request = json_rpc.request(json_rpc.NumberId(id), request)
  let body =
    aide.request_encode(request)
    |> json.to_string
  let request =
    request.new()
    |> request.set_method(http.Post)
    |> request.set_scheme(scheme)
    |> request.set_host(host)
    |> request.set_path(path)
    |> request.set_header("Content-Type", "application/json")
    |> request.set_header("Accept", "application/json, text/event-stream")
    |> request.set_body(body)
  let request = case port {
    Some(port) ->
      request
      |> request.set_port(port)
    None -> request
  }
  case auth {
    Unprotected -> request
    Token(token:) ->
      request.set_header(request, "authorization", "Bearer " <> token)
  }
}

fn send(request, decoder) {
  // echo request
  let request.Request(body:, ..) = request
  // echo json.parse(request.body, decode.new_primitive_decoder("", Ok))
  let assert Ok(response.Response(status: 200, body:, ..) as response) =
    httpc.send(request)

  // echo body
  case response.get_header(response, "content-type") {
    Ok("text/event-stream") ->
      case body {
        "event: message\ndata:" <> rest -> {
          let assert Ok(json_rpc.Response(version:, id:, return:)) =
            json.parse(rest, aide.response_decoder(decoder))
          return
        }
        _ -> todo
      }
    _ -> todo
  }
}

pub fn initialize(endpoint) {
  // client.initialize
  // |> client.initialize_request
  let request =
    definitions.InitializeRequest(
      capabilities: definitions.ClientCapabilities(
        elicitation: None,
        experimental: None,
        roots: None,
        sampling: None,
      ),
      client_info: definitions.Implementation(
        name: "",
        title: None,
        version: "",
      ),
      protocol_version: "2025-06-18",
    )
  let request = aide.Initialize(request)
  let request = to_request(endpoint, request, 0)
  let return = send(request, definitions.initialize_result_decoder())
  let assert Ok(definitions.InitializeResult(
    meta: _meta,
    capabilities: _capabilities,
    instructions: _instructions,
    protocol_version: _protocol_version,
    server_info: _server_info,
  )) = return
}

const token = "Add yours"

pub fn list_tools(endpoint) {
  let request = aide.ListTools(definitions.ListToolsRequest(None))
  let request = to_request(endpoint, request, 0)

  let assert Ok(return) = send(request, definitions.list_tools_result_decoder())
  return
}

pub fn call_tool(endpoint, name, arguments) {
  let request = aide.CallTool(definitions.CallToolRequest(name:, arguments:))
  let request = to_request(endpoint, request, 0)
  let return = send(request, definitions.call_tool_result_decoder())
}

// https://github.com/github/github-mcp-server
pub fn debug_test() {
  let weekly = #(#(http.Https, "gleamweekly.com", None), "/mcp")
  let task = {
    spotless.github(8080, [])
  }
  // erlang open a browser
  // or spotless without a browser to open a.la QR code
  // node.run(task, "")
  let github =
    // "https://api.githubcopilot.com/mcp/"
    Connection(
      #(http.Https, "api.githubcopilot.com", None),
      "/mcp",
      Token(token),
    )
  let tools = list_tools(github).tools

  tools
  |> list.map(fn(tool) {
    let definitions.Tool(name:, input_schema:, ..) = tool
    // input_schema
    // |> json_schema.to_fields
    // |> utils.Object()
    echo name
  })
  let assert Ok(t) =
    list.find(tools, fn(tool) { tool.name == "search_repositories" })
  echo t.input_schema
  echo t.output_schema
  echo call_tool(github, "get_me", Some(dict.new()))
  echo call_tool(
    github,
    "search_repositories",
    Some(dict.from_list([#("query", utils.String("stuff"))])),
  )
}
