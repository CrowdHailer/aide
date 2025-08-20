import aide/definitions
import aide/effect
import aide/json_rpc
import gleam/dict
import gleam/dynamic/decode
import gleam/json
import gleam/list
import gleam/option.{None, Some}
import gleam/pair
import gleam/string
import oas/generator/utils

pub fn request_decoder() {
  json_rpc.request_decoder(
    request_decoders(),
    notification_decoders(),
    Initialized(definitions.InitializedNotification(None, dict.new())),
  )
}

pub fn request_encode(request) {
  json_rpc.request_encode(request, do_request_encode, do_notification_encode)
}

fn do_request_encode(request) {
  case request {
    Initialize(request) -> #(
      "initialize",
      Some(definitions.initialize_request_encode(request)),
    )
    Ping(request) -> #("ping", Some(definitions.ping_request_encode(request)))
    ListResources(request) -> #(
      "resources/list",
      Some(definitions.list_resources_request_encode(request)),
    )
    ListResourceTemplates(request) -> #(
      "resources/templates/list",
      Some(definitions.list_resource_templates_request_encode(request)),
    )
    ReadResource(request) -> #(
      "resources/read",
      Some(definitions.read_resource_request_encode(request)),
    )
    Subscribe(request) -> #(
      "resources/subscribe",
      Some(definitions.subscribe_request_encode(request)),
    )
    Unsubscribe(request) -> #(
      "resources/unsubscribe",
      Some(definitions.unsubscribe_request_encode(request)),
    )
    ListPrompts(request) -> #(
      "prompts/list",
      Some(definitions.list_prompts_request_encode(request)),
    )
    GetPrompt(request) -> #(
      "prompts/get",
      Some(definitions.get_prompt_request_encode(request)),
    )
    ListTools(request) -> #(
      "tools/list",
      Some(definitions.list_tools_request_encode(request)),
    )
    CallTool(request) -> #(
      "tools/call",
      Some(definitions.call_tool_request_encode(request)),
    )
    SetLevel(request) -> #(
      "logging/setLevel",
      Some(definitions.set_level_request_encode(request)),
    )
    Complete(request) -> #(
      "completion/complete",
      Some(definitions.complete_request_encode(request)),
    )
  }
}

fn do_notification_encode(notification) {
  case notification {
    Cancelled(notification) -> #(
      "notifications/cancelled",
      Some(definitions.cancelled_notification_encode(notification)),
    )
    Initialized(notification) -> #(
      "notifications/initialized",
      Some(definitions.initialized_notification_encode(notification)),
    )
    Progress(notification) -> #(
      "notifications/progress",
      Some(definitions.progress_notification_encode(notification)),
    )
    RootsListChanged(notification) -> #(
      "notifications/roots/list_changed",
      Some(definitions.roots_list_changed_notification_encode(notification)),
    )
  }
}

fn notification_decoders() {
  [
    #(
      "notifications/cancelled",
      definitions.cancelled_notification_decoder() |> decode.map(Cancelled),
    ),
    #(
      "notifications/initialized",
      definitions.initialized_notification_decoder() |> decode.map(Initialized),
    ),
    #(
      "notifications/progress",
      definitions.progress_notification_decoder() |> decode.map(Progress),
    ),
    #(
      "notifications/roots/list_changed",
      definitions.roots_list_changed_notification_decoder()
        |> decode.map(RootsListChanged),
    ),
  ]
}

fn request_decoders() {
  [
    #(
      "initialize",
      definitions.initialize_request_decoder() |> decode.map(Initialize),
    ),
    #("ping", definitions.ping_request_decoder() |> decode.map(Ping)),
    #(
      "resources/list",
      definitions.list_resources_request_decoder() |> decode.map(ListResources),
    ),
    #(
      "resources/templates/list",
      definitions.list_resource_templates_request_decoder()
        |> decode.map(ListResourceTemplates),
    ),
    #(
      "resources/read",
      definitions.read_resource_request_decoder()
        |> decode.map(ReadResource),
    ),
    #(
      "resources/subscribe",
      definitions.subscribe_request_decoder()
        |> decode.map(Subscribe),
    ),
    #(
      "resources/unsubscribe",
      definitions.unsubscribe_request_decoder()
        |> decode.map(Unsubscribe),
    ),
    #(
      "prompts/list",
      definitions.list_prompts_request_decoder() |> decode.map(ListPrompts),
    ),
    #(
      "prompts/get",
      definitions.get_prompt_request_decoder() |> decode.map(GetPrompt),
    ),
    #(
      "tools/list",
      definitions.list_tools_request_decoder() |> decode.map(ListTools),
    ),
    #(
      "tools/call",
      definitions.call_tool_request_decoder() |> decode.map(CallTool),
    ),
    #(
      "logging/setLevel",
      definitions.set_level_request_decoder() |> decode.map(SetLevel),
    ),
    #(
      "completion/complete",
      definitions.complete_request_decoder() |> decode.map(Complete),
    ),
  ]
}

pub type ClientNotification {
  // Client Notifications
  Cancelled(definitions.CancelledNotification)
  Initialized(definitions.InitializedNotification)
  Progress(definitions.ProgressNotification)
  RootsListChanged(definitions.RootsListChangedNotification)
}

// client Requests
pub type ClientRequest {
  Initialize(definitions.InitializeRequest)
  Ping(definitions.PingRequest)
  ListResources(definitions.ListResourcesRequest)
  ListResourceTemplates(definitions.ListResourceTemplatesRequest)
  ReadResource(definitions.ReadResourceRequest)
  Subscribe(definitions.SubscribeRequest)
  Unsubscribe(definitions.UnsubscribeRequest)
  ListPrompts(definitions.ListPromptsRequest)
  GetPrompt(definitions.GetPromptRequest)
  ListTools(definitions.ListToolsRequest)
  CallTool(definitions.CallToolRequest)
  SetLevel(definitions.SetLevelRequest)
  Complete(definitions.CompleteRequest)
}

pub type ServerResult {
  InitializeResult(definitions.InitializeResult)
  PingResponse
  ListResourcesResult(definitions.ListResourcesResult)
  ListResourceTemplatesResult(definitions.ListResourceTemplatesResult)
  ReadResourceResult(definitions.ReadResourceResult)
  ListPromptsResult(definitions.ListPromptsResult)
  GetPromptResult(definitions.GetPromptResult)
  ListToolsResult(definitions.ListToolsResult)
  CallToolResult(definitions.CallToolResult)
  CompleteResult(definitions.CompleteResult)
}

pub fn response_encode(response) {
  json_rpc.response_encode(response, do_response_encode)
}

fn do_response_encode(result) {
  case result {
    InitializeResult(m) -> definitions.initialize_result_encode(m)
    PingResponse -> json.object([])
    ListResourcesResult(m) -> definitions.list_resources_result_encode(m)
    ListResourceTemplatesResult(m) ->
      definitions.list_resource_templates_result_encode(m)
    ReadResourceResult(m) -> definitions.read_resource_result_encode(m)
    ListPromptsResult(m) -> definitions.list_prompts_result_encode(m)
    GetPromptResult(m) -> definitions.get_prompt_result_encode(m)
    ListToolsResult(m) -> definitions.list_tools_result_encode(m)
    CallToolResult(m) -> definitions.call_tool_result_encode(m)
    CompleteResult(m) -> definitions.complete_result_encode(m)
  }
}

pub type Server(tool) {
  Server(
    implementation: definitions.Implementation,
    tools: List(
      #(
        definitions.Tool,
        fn(dict.Dict(String, utils.Any)) -> Result(tool, String),
      ),
    ),
    resources: List(definitions.Resource),
  )
}

pub fn handle_rpc(request, server) {
  case request {
    json_rpc.Request(id:, value:, ..) ->
      case handle_request(value, server) {
        effect.Done(return) -> {
          json_rpc.response(id, return) |> Some |> effect.Done
        }
        effect.CallTool(tool, resume) ->
          effect.CallTool(tool, fn(reply) {
            json_rpc.response(id, resume(reply)) |> Some
          })
        effect.ReadResource(resource, resume) ->
          effect.ReadResource(resource, fn(reply) {
            json_rpc.response(id, resume(reply)) |> Some
          })
      }
    json_rpc.Notification(value:, ..) -> {
      let Nil = handle_notification(value, server)
      effect.Done(None)
    }
  }
}

pub fn handle_request(of, server) {
  case of {
    Initialize(message) -> {
      initialize(message, server)
      |> InitializeResult
      |> effect.Done
    }
    ListTools(message) -> {
      list_tools(message, server)
      |> ListToolsResult
      |> effect.Done
    }
    CallTool(message) -> {
      case call_tool(message, server) {
        Ok(args) ->
          effect.CallTool(args, fn(reply) {
            let content =
              utils.Object(reply)
              |> utils.any_to_json
              |> json.to_string
              |> utils.String
            CallToolResult(definitions.CallToolResult(
              meta: None,
              structured_content: Some(reply),
              content: [
                utils.Object(
                  dict.from_list([
                    #("type", utils.String("text")),
                    #("text", content),
                  ]),
                ),
              ],
              is_error: Some(False),
            ))
          })
        Error(reason) ->
          effect.Done(
            CallToolResult(definitions.CallToolResult(
              meta: None,
              structured_content: None,
              content: [
                utils.Object(
                  dict.from_list([
                    #("type", utils.String("text")),
                    #("text", utils.String(string.inspect(reason))),
                  ]),
                ),
              ],
              is_error: Some(False),
            )),
          )
      }
    }
    ListResources(message) -> {
      list_resources(message, server)
      |> ListResourcesResult
      |> effect.Done
    }
    ReadResource(message) -> {
      case read_resource(message, server) {
        Ok(resource) ->
          effect.ReadResource(resource, fn(contents) {
            effect.resource_contents_to_result(resource.uri, contents)
            |> ReadResourceResult
          })
        Error(Nil) ->
          definitions.ReadResourceResult(meta: None, contents: [])
          |> ReadResourceResult()
          |> effect.Done
      }
    }
    ListPrompts(_) -> {
      list_prompts()
      |> ListPromptsResult
      |> effect.Done
    }
    Ping(_) -> PingResponse |> effect.Done
    _ -> {
      // echo of
      panic as "unsupported message"
    }
  }
}

pub fn handle_notification(notification, _server) {
  case notification {
    Initialized(_message) -> Nil
    _ -> {
      // echo notification
      panic as "unsupported notification"
    }
  }
}

fn initialize(_message, server) {
  let Server(implementation:, ..) = server
  definitions.InitializeResult(
    protocol_version: "2025-06-18",
    meta: None,
    instructions: None,
    capabilities: definitions.ServerCapabilities(
      completions: None,
      experimental: None,
      logging: None,
      prompts: None,
      tools: Some(definitions.Internal11(list_changed: Some(False))),
      resources: Some(definitions.Internal10(
        subscribe: Some(False),
        list_changed: Some(False),
      )),
    ),
    server_info: implementation,
  )
}

fn list_tools(_message, server) {
  let Server(tools:, ..) = server
  definitions.ListToolsResult(
    meta: None,
    next_cursor: None,
    tools: list.map(tools, pair.first),
  )
}

pub type ToolError {
  UnknownTool
  BadArguments
}

fn call_tool(message, server) {
  let Server(tools:, ..) = server
  let definitions.CallToolRequest(name:, arguments:) = message
  let found =
    list.find_map(tools, fn(tool) {
      let #(definitions.Tool(name: n, ..), call) = tool
      case name == n {
        True -> Ok(call)
        False -> Error(Nil)
      }
    })
  case found {
    Ok(call) ->
      case call(arguments |> option.unwrap(dict.new())) {
        Ok(args) -> Ok(args)
        Error(_reason) -> Error(BadArguments)
      }
    Error(Nil) -> Error(UnknownTool)
  }
}

fn list_resources(_cursor, server) {
  let Server(resources:, ..) = server
  definitions.ListResourcesResult(meta: None, resources:, next_cursor: None)
}

fn read_resource(message, server) {
  let Server(resources:, ..) = server
  let definitions.ReadResourceRequest(uri:) = message

  list.find_map(resources, fn(resource) {
    let definitions.Resource(uri: u, ..) = resource
    case uri == u {
      True -> Ok(resource)
      False -> Error(Nil)
    }
  })
}

fn list_prompts() {
  definitions.ListPromptsResult(meta: None, prompts: [], next_cursor: None)
}
