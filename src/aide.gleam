import aide/definitions
import aide/effect
import aide/json_rpc
import aide/reason
import gleam/dict
import gleam/dynamic/decode
import gleam/json
import gleam/list
import gleam/option.{None, Some}
import gleam/pair
import gleam/result
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
  let method = request_method(request)
  let params = case request {
    Initialize(request) -> definitions.initialize_request_encode(request)
    Ping(request) -> definitions.ping_request_encode(request)
    ListResources(request) -> definitions.list_resources_request_encode(request)
    ListResourceTemplates(request) ->
      definitions.list_resource_templates_request_encode(request)
    ReadResource(request) -> definitions.read_resource_request_encode(request)
    Subscribe(request) -> definitions.subscribe_request_encode(request)
    Unsubscribe(request) -> definitions.unsubscribe_request_encode(request)
    ListPrompts(request) -> definitions.list_prompts_request_encode(request)
    GetPrompt(request) -> definitions.get_prompt_request_encode(request)
    ListTools(request) -> definitions.list_tools_request_encode(request)
    CallTool(request) -> definitions.call_tool_request_encode(request)
    SetLevel(request) -> definitions.set_level_request_encode(request)
    Complete(request) -> definitions.complete_request_encode(request)
  }
  #(method, Some(params))
}

pub fn request_method(request) {
  case request {
    Initialize(_) -> "initialize"
    Ping(_) -> "ping"
    ListResources(_) -> "resources/list"
    ListResourceTemplates(_) -> "resources/templates/list"
    ReadResource(_) -> "resources/read"
    Subscribe(_) -> "resources/subscribe"
    Unsubscribe(_) -> "resources/unsubscribe"
    ListPrompts(_) -> "prompts/list"
    GetPrompt(_) -> "prompts/get"
    ListTools(_) -> "tools/list"
    CallTool(_) -> "tools/call"
    SetLevel(_) -> "logging/setLevel"
    Complete(_) -> "completion/complete"
  }
}

fn do_notification_encode(notification) {
  let method = notification_method(notification)
  let params = case notification {
    Cancelled(n) -> definitions.cancelled_notification_encode(n)
    Initialized(n) -> definitions.initialized_notification_encode(n)
    Progress(n) -> definitions.progress_notification_encode(n)
    RootsListChanged(n) -> definitions.roots_list_changed_notification_encode(n)
  }
  #(method, Some(params))
}

pub fn notification_method(notification) {
  case notification {
    Cancelled(_) -> "notifications/cancelled"
    Initialized(_) -> "notifications/initialized"
    Progress(_) -> "notifications/progress"
    RootsListChanged(_) -> "notifications/roots/list_changed"
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
    tools: List(#(definitions.Tool, decode.Decoder(tool))),
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
      |> Ok
      |> effect.Done
    }
    ListTools(message) -> {
      list_tools(message, server)
      |> ListToolsResult
      |> Ok
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
            Ok(
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
              )),
            )
          })
        Error(reason) -> effect.Done(Error(reason))
      }
    }
    ListResources(message) -> {
      list_resources(message, server)
      |> ListResourcesResult
      |> Ok
      |> effect.Done
    }
    ReadResource(message) -> {
      case read_resource(message, server) {
        Ok(resource) ->
          effect.ReadResource(resource, fn(contents) {
            effect.resource_contents_to_result(resource.uri, contents)
            |> ReadResourceResult
            |> Ok
          })
        Error(reason) -> effect.Done(Error(reason))
      }
    }
    ListPrompts(_) -> {
      list_prompts()
      |> ListPromptsResult
      |> Ok
      |> effect.Done
    }
    Ping(_) -> PingResponse |> Ok |> effect.Done
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
    Ok(call) -> {
      let arguments =
        arguments
        |> option.unwrap(dict.new())
        |> utils.Object
        |> utils.any_to_dynamic
      case decode.run(arguments, call) {
        Ok(args) -> Ok(args)
        Error(reason) -> Error(reason.invalid_arguments(name, reason))
      }
    }
    Error(Nil) -> Error(reason.unknown_tool(name))
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
  |> result.replace_error(reason.resource_not_found(uri))
}

fn list_prompts() {
  definitions.ListPromptsResult(meta: None, prompts: [], next_cursor: None)
}
