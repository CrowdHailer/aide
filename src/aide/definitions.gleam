import gleam/dict
import gleam/dynamic/decode
import gleam/json
import gleam/option.{type Option, None}
import oas/generator/utils

pub type PromptMessage {
  PromptMessage(content: ContentBlock, role: Role)
}

pub type Prompt {
  Prompt(
    meta: Option(dict.Dict(String, utils.Any)),
    arguments: Option(List(PromptArgument)),
    description: Option(String),
    name: String,
    title: Option(String),
  )
}

pub type LoggingMessageNotification {
  LoggingMessageNotification(
    data: utils.Never,
    level: LoggingLevel,
    logger: Option(String),
  )
}

pub type EnumSchema {
  EnumSchema(
    description: Option(String),
    enum: List(String),
    enum_names: Option(List(String)),
    title: Option(String),
    type_: String,
  )
}

pub type CallToolRequest {
  CallToolRequest(arguments: Option(dict.Dict(String, utils.Any)), name: String)
}

pub type ListToolsResult {
  ListToolsResult(
    meta: Option(dict.Dict(String, utils.Any)),
    next_cursor: Option(String),
    tools: List(Tool),
  )
}

pub type ModelHint {
  ModelHint(name: Option(String))
}

pub type Jsonrpcrequest {
  Jsonrpcrequest(
    id: RequestId,
    jsonrpc: String,
    method_: String,
    params: Option(Anon8593718a),
  )
}

pub type BooleanSchema {
  BooleanSchema(
    default: Option(Bool),
    description: Option(String),
    title: Option(String),
    type_: String,
  )
}

pub type SamplingMessage {
  SamplingMessage(content: utils.Any, role: Role)
}

pub type ToolAnnotations {
  ToolAnnotations(
    destructive_hint: Option(Bool),
    idempotent_hint: Option(Bool),
    open_world_hint: Option(Bool),
    read_only_hint: Option(Bool),
    title: Option(String),
  )
}

pub type PingRequest {
  PingRequest(
    meta: Option(Anon345b3036),
    additional_properties: dict.Dict(String, utils.Any),
  )
}

pub type RootsListChangedNotification {
  RootsListChangedNotification(
    meta: Option(dict.Dict(String, utils.Any)),
    additional_properties: dict.Dict(String, utils.Any),
  )
}

pub type Request {
  Request(
    meta: Option(Anon345b3036),
    additional_properties: dict.Dict(String, utils.Any),
  )
}

pub type ElicitResult {
  ElicitResult(
    meta: Option(dict.Dict(String, utils.Any)),
    action: String,
    content: Option(dict.Dict(String, utils.Any)),
  )
}

pub type ClientCapabilities {
  ClientCapabilities(
    elicitation: Option(dict.Dict(String, utils.Any)),
    experimental: Option(dict.Dict(String, dict.Dict(String, utils.Any))),
    roots: Option(Anon405cc9c3),
    sampling: Option(dict.Dict(String, utils.Any)),
  )
}

pub type TextResourceContents {
  TextResourceContents(
    meta: Option(dict.Dict(String, utils.Any)),
    mime_type: Option(String),
    text: String,
    uri: String,
  )
}

pub type PromptListChangedNotification {
  PromptListChangedNotification(
    meta: Option(dict.Dict(String, utils.Any)),
    additional_properties: dict.Dict(String, utils.Any),
  )
}

pub type UnsubscribeRequest {
  UnsubscribeRequest(uri: String)
}

pub type ListPromptsResult {
  ListPromptsResult(
    meta: Option(dict.Dict(String, utils.Any)),
    next_cursor: Option(String),
    prompts: List(Prompt),
  )
}

pub type ProgressNotification {
  ProgressNotification(
    message: Option(String),
    progress: Float,
    progress_token: ProgressToken,
    total: Option(Float),
  )
}

pub type StringSchema {
  StringSchema(
    description: Option(String),
    format: Option(String),
    max_length: Option(Int),
    min_length: Option(Int),
    title: Option(String),
    type_: String,
  )
}

pub type AudioContent {
  AudioContent(
    meta: Option(dict.Dict(String, utils.Any)),
    annotations: Option(Annotations),
    data: String,
    mime_type: String,
    type_: String,
  )
}

pub type NumberSchema {
  NumberSchema(
    description: Option(String),
    maximum: Option(Int),
    minimum: Option(Int),
    title: Option(String),
    type_: String,
  )
}

pub type ResourceLink {
  ResourceLink(
    meta: Option(dict.Dict(String, utils.Any)),
    annotations: Option(Annotations),
    description: Option(String),
    mime_type: Option(String),
    name: String,
    size: Option(Int),
    title: Option(String),
    type_: String,
    uri: String,
  )
}

pub type ResourceTemplateReference {
  ResourceTemplateReference(type_: String, uri: String)
}

pub type Annotations {
  Annotations(
    audience: Option(List(Role)),
    last_modified: Option(String),
    priority: Option(Float),
  )
}

pub type PaginatedRequest {
  PaginatedRequest(cursor: Option(String))
}

pub type Notification {
  Notification(
    meta: Option(dict.Dict(String, utils.Any)),
    additional_properties: dict.Dict(String, utils.Any),
  )
}

pub type CreateMessageResult {
  CreateMessageResult(
    meta: Option(dict.Dict(String, utils.Any)),
    content: utils.Any,
    model: String,
    role: Role,
    stop_reason: Option(String),
  )
}

pub type PromptReference {
  PromptReference(name: String, title: Option(String), type_: String)
}

pub type ResourceContents {
  ResourceContents(
    meta: Option(dict.Dict(String, utils.Any)),
    mime_type: Option(String),
    uri: String,
  )
}

pub type ResourceTemplate {
  ResourceTemplate(
    meta: Option(dict.Dict(String, utils.Any)),
    annotations: Option(Annotations),
    description: Option(String),
    mime_type: Option(String),
    name: String,
    title: Option(String),
    uri_template: String,
  )
}

pub type Tool {
  Tool(
    meta: Option(dict.Dict(String, utils.Any)),
    annotations: Option(ToolAnnotations),
    description: Option(String),
    input_schema: AnonA5a007cd,
    name: String,
    output_schema: Option(AnonA5a007cd),
    title: Option(String),
  )
}

pub type PromptArgument {
  PromptArgument(
    description: Option(String),
    name: String,
    required: Option(Bool),
    title: Option(String),
  )
}

pub type Implementation {
  Implementation(name: String, title: Option(String), version: String)
}

pub type SubscribeRequest {
  SubscribeRequest(uri: String)
}

pub type ListResourceTemplatesResult {
  ListResourceTemplatesResult(
    meta: Option(dict.Dict(String, utils.Any)),
    next_cursor: Option(String),
    resource_templates: List(ResourceTemplate),
  )
}

pub type ListResourcesRequest {
  ListResourcesRequest(cursor: Option(String))
}

pub type BaseMetadata {
  BaseMetadata(name: String, title: Option(String))
}

pub type ListToolsRequest {
  ListToolsRequest(cursor: Option(String))
}

pub type InitializedNotification {
  InitializedNotification(
    meta: Option(dict.Dict(String, utils.Any)),
    additional_properties: dict.Dict(String, utils.Any),
  )
}

pub type CallToolResult {
  CallToolResult(
    meta: Option(dict.Dict(String, utils.Any)),
    content: List(ContentBlock),
    is_error: Option(Bool),
    structured_content: Option(dict.Dict(String, utils.Any)),
  )
}

pub type ImageContent {
  ImageContent(
    meta: Option(dict.Dict(String, utils.Any)),
    annotations: Option(Annotations),
    data: String,
    mime_type: String,
    type_: String,
  )
}

pub type ListRootsResult {
  ListRootsResult(meta: Option(dict.Dict(String, utils.Any)), roots: List(Root))
}

pub type CompleteRequest {
  CompleteRequest(
    argument: Anon68f425dd,
    context: Option(Anon4c2c4139),
    ref: utils.Any,
  )
}

pub type EmbeddedResource {
  EmbeddedResource(
    meta: Option(dict.Dict(String, utils.Any)),
    annotations: Option(Annotations),
    resource: utils.Any,
    type_: String,
  )
}

pub type InitializeResult {
  InitializeResult(
    meta: Option(dict.Dict(String, utils.Any)),
    capabilities: ServerCapabilities,
    instructions: Option(String),
    protocol_version: String,
    server_info: Implementation,
  )
}

pub type Result {
  Result(
    meta: Option(dict.Dict(String, utils.Any)),
    additional_properties: dict.Dict(String, utils.Any),
  )
}

pub type ServerCapabilities {
  ServerCapabilities(
    completions: Option(dict.Dict(String, utils.Any)),
    experimental: Option(dict.Dict(String, dict.Dict(String, utils.Any))),
    logging: Option(dict.Dict(String, utils.Any)),
    prompts: Option(Anon405cc9c3),
    resources: Option(Anon3889ba9d),
    tools: Option(Anon405cc9c3),
  )
}

pub type CreateMessageRequest {
  CreateMessageRequest(
    include_context: Option(String),
    max_tokens: Int,
    messages: List(SamplingMessage),
    metadata: Option(dict.Dict(String, utils.Any)),
    model_preferences: Option(ModelPreferences),
    stop_sequences: Option(List(String)),
    system_prompt: Option(String),
    temperature: Option(Float),
  )
}

pub type Root {
  Root(
    meta: Option(dict.Dict(String, utils.Any)),
    name: Option(String),
    uri: String,
  )
}

pub type ModelPreferences {
  ModelPreferences(
    cost_priority: Option(Float),
    hints: Option(List(ModelHint)),
    intelligence_priority: Option(Float),
    speed_priority: Option(Float),
  )
}

pub type ListResourceTemplatesRequest {
  ListResourceTemplatesRequest(cursor: Option(String))
}

pub type CompleteResult {
  CompleteResult(
    meta: Option(dict.Dict(String, utils.Any)),
    completion: AnonA60b75a3,
  )
}

pub type Resource {
  Resource(
    meta: Option(dict.Dict(String, utils.Any)),
    annotations: Option(Annotations),
    description: Option(String),
    mime_type: Option(String),
    name: String,
    size: Option(Int),
    title: Option(String),
    uri: String,
  )
}

pub type BlobResourceContents {
  BlobResourceContents(
    meta: Option(dict.Dict(String, utils.Any)),
    blob: String,
    mime_type: Option(String),
    uri: String,
  )
}

pub type ReadResourceResult {
  ReadResourceResult(
    meta: Option(dict.Dict(String, utils.Any)),
    contents: List(utils.Any),
  )
}

pub type ResourceUpdatedNotification {
  ResourceUpdatedNotification(uri: String)
}

pub type ElicitRequest {
  ElicitRequest(message: String, requested_schema: Anon23ef5801)
}

pub type GetPromptRequest {
  GetPromptRequest(arguments: Option(dict.Dict(String, String)), name: String)
}

pub type ListPromptsRequest {
  ListPromptsRequest(cursor: Option(String))
}

pub type ListResourcesResult {
  ListResourcesResult(
    meta: Option(dict.Dict(String, utils.Any)),
    next_cursor: Option(String),
    resources: List(Resource),
  )
}

pub type ToolListChangedNotification {
  ToolListChangedNotification(
    meta: Option(dict.Dict(String, utils.Any)),
    additional_properties: dict.Dict(String, utils.Any),
  )
}

pub type Jsonrpcerror {
  Jsonrpcerror(error: Anon3a47e9cb, id: RequestId, jsonrpc: String)
}

pub type ListRootsRequest {
  ListRootsRequest(
    meta: Option(Anon345b3036),
    additional_properties: dict.Dict(String, utils.Any),
  )
}

pub type PaginatedResult {
  PaginatedResult(
    meta: Option(dict.Dict(String, utils.Any)),
    next_cursor: Option(String),
  )
}

pub type InitializeRequest {
  InitializeRequest(
    capabilities: ClientCapabilities,
    client_info: Implementation,
    protocol_version: String,
  )
}

pub type CancelledNotification {
  CancelledNotification(reason: Option(String), request_id: RequestId)
}

pub type ResourceListChangedNotification {
  ResourceListChangedNotification(
    meta: Option(dict.Dict(String, utils.Any)),
    additional_properties: dict.Dict(String, utils.Any),
  )
}

pub type Jsonrpcnotification {
  Jsonrpcnotification(
    jsonrpc: String,
    method_: String,
    params: Option(AnonD071168d),
  )
}

pub type GetPromptResult {
  GetPromptResult(
    meta: Option(dict.Dict(String, utils.Any)),
    description: Option(String),
    messages: List(PromptMessage),
  )
}

pub type SetLevelRequest {
  SetLevelRequest(level: LoggingLevel)
}

pub type ReadResourceRequest {
  ReadResourceRequest(uri: String)
}

pub type Jsonrpcresponse {
  Jsonrpcresponse(id: RequestId, jsonrpc: String, result: Result)
}

pub type TextContent {
  TextContent(
    meta: Option(dict.Dict(String, utils.Any)),
    annotations: Option(Annotations),
    text: String,
    type_: String,
  )
}

pub type Anon8593718a {
  Anon8593718a(
    meta: Option(Anon345b3036),
    additional_properties: dict.Dict(String, utils.Any),
  )
}

pub type AnonA5a007cd {
  AnonA5a007cd(
    properties: Option(dict.Dict(String, dict.Dict(String, utils.Any))),
    required: Option(List(String)),
    type_: String,
  )
}

pub type Anon68f425dd {
  Anon68f425dd(name: String, value: String)
}

pub type Anon4c2c4139 {
  Anon4c2c4139(arguments: Option(dict.Dict(String, String)))
}

pub type Anon3889ba9d {
  Anon3889ba9d(list_changed: Option(Bool), subscribe: Option(Bool))
}

pub type Anon405cc9c3 {
  Anon405cc9c3(list_changed: Option(Bool))
}

pub type AnonA60b75a3 {
  AnonA60b75a3(has_more: Option(Bool), total: Option(Int), values: List(String))
}

pub type Anon23ef5801 {
  Anon23ef5801(
    properties: dict.Dict(String, PrimitiveSchemaDefinition),
    required: Option(List(String)),
    type_: String,
  )
}

pub type Anon3a47e9cb {
  Anon3a47e9cb(code: Int, data: Option(utils.Never), message: String)
}

pub type Anon345b3036 {
  Anon345b3036(
    progress_token: Option(ProgressToken),
    additional_properties: dict.Dict(String, utils.Any),
  )
}

pub type AnonD071168d {
  AnonD071168d(
    meta: Option(dict.Dict(String, utils.Any)),
    additional_properties: dict.Dict(String, utils.Any),
  )
}

pub type LoggingLevel =
  String

pub type PrimitiveSchemaDefinition =
  utils.Any

pub type RequestId =
  utils.Any

pub type ServerResult =
  utils.Any

pub type EmptyResult =
  utils.Never

pub type Role =
  String

pub type ContentBlock =
  utils.Any

pub type ProgressToken =
  utils.Any

pub type ClientRequest =
  utils.Any

pub type Cursor =
  String

pub type ServerRequest =
  utils.Any

pub type Jsonrpcmessage =
  utils.Any

pub type ClientResult =
  utils.Any

pub type ClientNotification =
  utils.Any

pub type ServerNotification =
  utils.Any

pub fn anon_d071168d_decoder() {
  use meta <- decode.optional_field(
    "_meta",
    None,
    decode.optional(decode.dict(decode.string, utils.any_decoder())),
  )
  use additional_properties <- utils.decode_additional(
    ["_meta"],
    utils.any_decoder(),
  )
  decode.success(AnonD071168d(
    meta: meta,
    additional_properties: additional_properties,
  ))
}

pub fn anon_d071168d_encode(data: AnonD071168d) {
  utils.object([
    #("_meta", json.nullable(data.meta, utils.dict(_, utils.any_to_json))),
    ..dict.to_list(
      dict.map_values(data.additional_properties, fn(_key, value) {
        utils.any_to_json(value)
      }),
    )
  ])
}

pub fn anon_345b3036_decoder() {
  use progress_token <- decode.optional_field(
    "progressToken",
    None,
    decode.optional(progress_token_decoder()),
  )
  use additional_properties <- utils.decode_additional(
    ["progressToken"],
    utils.any_decoder(),
  )
  decode.success(Anon345b3036(
    progress_token: progress_token,
    additional_properties: additional_properties,
  ))
}

pub fn anon_345b3036_encode(data: Anon345b3036) {
  utils.object([
    #(
      "progressToken",
      json.nullable(data.progress_token, progress_token_encode),
    ),
    ..dict.to_list(
      dict.map_values(data.additional_properties, fn(_key, value) {
        utils.any_to_json(value)
      }),
    )
  ])
}

pub fn anon_3a47e9cb_decoder() {
  use code <- decode.field("code", decode.int)
  use data <- decode.optional_field(
    "data",
    None,
    decode.optional(
      decode.new_primitive_decoder("Never", fn(_) {
        panic as "tried to decode a never decode value"
      }),
    ),
  )
  use message <- decode.field("message", decode.string)
  decode.success(Anon3a47e9cb(code: code, data: data, message: message))
}

pub fn anon_3a47e9cb_encode(data: Anon3a47e9cb) {
  utils.object([
    #("code", json.int(data.code)),
    #(
      "data",
      json.nullable(data.data, fn(_data) {
        panic as "never value cannot be encoded"
      }),
    ),
    #("message", json.string(data.message)),
  ])
}

pub fn anon_23ef5801_decoder() {
  use properties <- decode.field(
    "properties",
    decode.dict(decode.string, primitive_schema_definition_decoder()),
  )
  use required <- decode.optional_field(
    "required",
    None,
    decode.optional(decode.list(decode.string)),
  )
  use type_ <- decode.field("type", decode.string)
  decode.success(Anon23ef5801(
    properties: properties,
    required: required,
    type_: type_,
  ))
}

pub fn anon_23ef5801_encode(data: Anon23ef5801) {
  utils.object([
    #(
      "properties",
      utils.dict(_, primitive_schema_definition_encode)(data.properties),
    ),
    #("required", json.nullable(data.required, json.array(_, json.string))),
    #("type", json.string(data.type_)),
  ])
}

pub fn anon_a60b75a3_decoder() {
  use has_more <- decode.optional_field(
    "hasMore",
    None,
    decode.optional(decode.bool),
  )
  use total <- decode.optional_field("total", None, decode.optional(decode.int))
  use values <- decode.field("values", decode.list(decode.string))
  decode.success(AnonA60b75a3(has_more: has_more, total: total, values: values))
}

pub fn anon_a60b75a3_encode(data: AnonA60b75a3) {
  utils.object([
    #("hasMore", json.nullable(data.has_more, json.bool)),
    #("total", json.nullable(data.total, json.int)),
    #("values", json.array(_, json.string)(data.values)),
  ])
}

pub fn anon_405cc9c3_decoder() {
  use list_changed <- decode.optional_field(
    "listChanged",
    None,
    decode.optional(decode.bool),
  )
  decode.success(Anon405cc9c3(list_changed: list_changed))
}

pub fn anon_405cc9c3_encode(data: Anon405cc9c3) {
  utils.object([#("listChanged", json.nullable(data.list_changed, json.bool))])
}

pub fn anon_3889ba9d_decoder() {
  use list_changed <- decode.optional_field(
    "listChanged",
    None,
    decode.optional(decode.bool),
  )
  use subscribe <- decode.optional_field(
    "subscribe",
    None,
    decode.optional(decode.bool),
  )
  decode.success(Anon3889ba9d(list_changed: list_changed, subscribe: subscribe))
}

pub fn anon_3889ba9d_encode(data: Anon3889ba9d) {
  utils.object([
    #("listChanged", json.nullable(data.list_changed, json.bool)),
    #("subscribe", json.nullable(data.subscribe, json.bool)),
  ])
}

pub fn anon_4c2c4139_decoder() {
  use arguments <- decode.optional_field(
    "arguments",
    None,
    decode.optional(decode.dict(decode.string, decode.string)),
  )
  decode.success(Anon4c2c4139(arguments: arguments))
}

pub fn anon_4c2c4139_encode(data: Anon4c2c4139) {
  utils.object([
    #("arguments", json.nullable(data.arguments, utils.dict(_, json.string))),
  ])
}

pub fn anon_68f425dd_decoder() {
  use name <- decode.field("name", decode.string)
  use value <- decode.field("value", decode.string)
  decode.success(Anon68f425dd(name: name, value: value))
}

pub fn anon_68f425dd_encode(data: Anon68f425dd) {
  utils.object([
    #("name", json.string(data.name)),
    #("value", json.string(data.value)),
  ])
}

pub fn anon_a5a007cd_decoder() {
  use properties <- decode.optional_field(
    "properties",
    None,
    decode.optional(decode.dict(
      decode.string,
      decode.dict(decode.string, utils.any_decoder()),
    )),
  )
  use required <- decode.optional_field(
    "required",
    None,
    decode.optional(decode.list(decode.string)),
  )
  use type_ <- decode.field("type", decode.string)
  decode.success(AnonA5a007cd(
    properties: properties,
    required: required,
    type_: type_,
  ))
}

pub fn anon_a5a007cd_encode(data: AnonA5a007cd) {
  utils.object([
    #(
      "properties",
      json.nullable(
        data.properties,
        utils.dict(_, utils.dict(_, utils.any_to_json)),
      ),
    ),
    #("required", json.nullable(data.required, json.array(_, json.string))),
    #("type", json.string(data.type_)),
  ])
}

pub fn anon_8593718a_decoder() {
  use meta <- decode.optional_field(
    "_meta",
    None,
    decode.optional(anon_345b3036_decoder()),
  )
  use additional_properties <- utils.decode_additional(
    ["_meta"],
    utils.any_decoder(),
  )
  decode.success(Anon8593718a(
    meta: meta,
    additional_properties: additional_properties,
  ))
}

pub fn anon_8593718a_encode(data: Anon8593718a) {
  utils.object([
    #("_meta", json.nullable(data.meta, anon_345b3036_encode)),
    ..dict.to_list(
      dict.map_values(data.additional_properties, fn(_key, value) {
        utils.any_to_json(value)
      }),
    )
  ])
}

pub fn text_content_decoder() {
  use meta <- decode.optional_field(
    "_meta",
    None,
    decode.optional(decode.dict(decode.string, utils.any_decoder())),
  )
  use annotations <- decode.optional_field(
    "annotations",
    None,
    decode.optional(annotations_decoder()),
  )
  use text <- decode.field("text", decode.string)
  use type_ <- decode.field("type", decode.string)
  decode.success(TextContent(
    meta: meta,
    annotations: annotations,
    text: text,
    type_: type_,
  ))
}

pub fn text_content_encode(data: TextContent) {
  utils.object([
    #("_meta", json.nullable(data.meta, utils.dict(_, utils.any_to_json))),
    #("annotations", json.nullable(data.annotations, annotations_encode)),
    #("text", json.string(data.text)),
    #("type", json.string(data.type_)),
  ])
}

pub fn jsonrpcresponse_decoder() {
  use id <- decode.field("id", request_id_decoder())
  use jsonrpc <- decode.field("jsonrpc", decode.string)
  use result <- decode.field("result", result_decoder())
  decode.success(Jsonrpcresponse(id: id, jsonrpc: jsonrpc, result: result))
}

pub fn jsonrpcresponse_encode(data: Jsonrpcresponse) {
  utils.object([
    #("id", request_id_encode(data.id)),
    #("jsonrpc", json.string(data.jsonrpc)),
    #("result", result_encode(data.result)),
  ])
}

pub fn read_resource_request_decoder() {
  use uri <- decode.field("uri", decode.string)
  decode.success(ReadResourceRequest(uri: uri))
}

pub fn read_resource_request_encode(data: ReadResourceRequest) {
  utils.object([#("uri", json.string(data.uri))])
}

pub fn server_notification_decoder() {
  utils.any_decoder()
}

pub fn server_notification_encode(data: ServerNotification) {
  utils.any_to_json(data)
}

pub fn set_level_request_decoder() {
  use level <- decode.field("level", logging_level_decoder())
  decode.success(SetLevelRequest(level: level))
}

pub fn set_level_request_encode(data: SetLevelRequest) {
  utils.object([#("level", logging_level_encode(data.level))])
}

pub fn client_notification_decoder() {
  utils.any_decoder()
}

pub fn client_notification_encode(data: ClientNotification) {
  utils.any_to_json(data)
}

pub fn get_prompt_result_decoder() {
  use meta <- decode.optional_field(
    "_meta",
    None,
    decode.optional(decode.dict(decode.string, utils.any_decoder())),
  )
  use description <- decode.optional_field(
    "description",
    None,
    decode.optional(decode.string),
  )
  use messages <- decode.field(
    "messages",
    decode.list(prompt_message_decoder()),
  )
  decode.success(GetPromptResult(
    meta: meta,
    description: description,
    messages: messages,
  ))
}

pub fn get_prompt_result_encode(data: GetPromptResult) {
  utils.object([
    #("_meta", json.nullable(data.meta, utils.dict(_, utils.any_to_json))),
    #("description", json.nullable(data.description, json.string)),
    #("messages", json.array(_, prompt_message_encode)(data.messages)),
  ])
}

pub fn jsonrpcnotification_decoder() {
  use jsonrpc <- decode.field("jsonrpc", decode.string)
  use method_ <- decode.field("method", decode.string)
  use params <- decode.optional_field(
    "params",
    None,
    decode.optional(anon_d071168d_decoder()),
  )
  decode.success(Jsonrpcnotification(
    jsonrpc: jsonrpc,
    method_: method_,
    params: params,
  ))
}

pub fn jsonrpcnotification_encode(data: Jsonrpcnotification) {
  utils.object([
    #("jsonrpc", json.string(data.jsonrpc)),
    #("method", json.string(data.method_)),
    #("params", json.nullable(data.params, anon_d071168d_encode)),
  ])
}

pub fn resource_list_changed_notification_decoder() {
  use meta <- decode.optional_field(
    "_meta",
    None,
    decode.optional(decode.dict(decode.string, utils.any_decoder())),
  )
  use additional_properties <- utils.decode_additional(
    ["_meta"],
    utils.any_decoder(),
  )
  decode.success(ResourceListChangedNotification(
    meta: meta,
    additional_properties: additional_properties,
  ))
}

pub fn resource_list_changed_notification_encode(
  data: ResourceListChangedNotification,
) {
  utils.object([
    #("_meta", json.nullable(data.meta, utils.dict(_, utils.any_to_json))),
    ..dict.to_list(
      dict.map_values(data.additional_properties, fn(_key, value) {
        utils.any_to_json(value)
      }),
    )
  ])
}

pub fn cancelled_notification_decoder() {
  use reason <- decode.optional_field(
    "reason",
    None,
    decode.optional(decode.string),
  )
  use request_id <- decode.field("requestId", request_id_decoder())
  decode.success(CancelledNotification(reason: reason, request_id: request_id))
}

pub fn cancelled_notification_encode(data: CancelledNotification) {
  utils.object([
    #("reason", json.nullable(data.reason, json.string)),
    #("requestId", request_id_encode(data.request_id)),
  ])
}

pub fn initialize_request_decoder() {
  use capabilities <- decode.field(
    "capabilities",
    client_capabilities_decoder(),
  )
  use client_info <- decode.field("clientInfo", implementation_decoder())
  use protocol_version <- decode.field("protocolVersion", decode.string)
  decode.success(InitializeRequest(
    capabilities: capabilities,
    client_info: client_info,
    protocol_version: protocol_version,
  ))
}

pub fn initialize_request_encode(data: InitializeRequest) {
  utils.object([
    #("capabilities", client_capabilities_encode(data.capabilities)),
    #("clientInfo", implementation_encode(data.client_info)),
    #("protocolVersion", json.string(data.protocol_version)),
  ])
}

pub fn paginated_result_decoder() {
  use meta <- decode.optional_field(
    "_meta",
    None,
    decode.optional(decode.dict(decode.string, utils.any_decoder())),
  )
  use next_cursor <- decode.optional_field(
    "nextCursor",
    None,
    decode.optional(decode.string),
  )
  decode.success(PaginatedResult(meta: meta, next_cursor: next_cursor))
}

pub fn paginated_result_encode(data: PaginatedResult) {
  utils.object([
    #("_meta", json.nullable(data.meta, utils.dict(_, utils.any_to_json))),
    #("nextCursor", json.nullable(data.next_cursor, json.string)),
  ])
}

pub fn list_roots_request_decoder() {
  use meta <- decode.optional_field(
    "_meta",
    None,
    decode.optional(anon_345b3036_decoder()),
  )
  use additional_properties <- utils.decode_additional(
    ["_meta"],
    utils.any_decoder(),
  )
  decode.success(ListRootsRequest(
    meta: meta,
    additional_properties: additional_properties,
  ))
}

pub fn list_roots_request_encode(data: ListRootsRequest) {
  utils.object([
    #("_meta", json.nullable(data.meta, anon_345b3036_encode)),
    ..dict.to_list(
      dict.map_values(data.additional_properties, fn(_key, value) {
        utils.any_to_json(value)
      }),
    )
  ])
}

pub fn jsonrpcerror_decoder() {
  use error <- decode.field("error", anon_3a47e9cb_decoder())
  use id <- decode.field("id", request_id_decoder())
  use jsonrpc <- decode.field("jsonrpc", decode.string)
  decode.success(Jsonrpcerror(error: error, id: id, jsonrpc: jsonrpc))
}

pub fn jsonrpcerror_encode(data: Jsonrpcerror) {
  utils.object([
    #("error", anon_3a47e9cb_encode(data.error)),
    #("id", request_id_encode(data.id)),
    #("jsonrpc", json.string(data.jsonrpc)),
  ])
}

pub fn tool_list_changed_notification_decoder() {
  use meta <- decode.optional_field(
    "_meta",
    None,
    decode.optional(decode.dict(decode.string, utils.any_decoder())),
  )
  use additional_properties <- utils.decode_additional(
    ["_meta"],
    utils.any_decoder(),
  )
  decode.success(ToolListChangedNotification(
    meta: meta,
    additional_properties: additional_properties,
  ))
}

pub fn tool_list_changed_notification_encode(data: ToolListChangedNotification) {
  utils.object([
    #("_meta", json.nullable(data.meta, utils.dict(_, utils.any_to_json))),
    ..dict.to_list(
      dict.map_values(data.additional_properties, fn(_key, value) {
        utils.any_to_json(value)
      }),
    )
  ])
}

pub fn client_result_decoder() {
  utils.any_decoder()
}

pub fn client_result_encode(data: ClientResult) {
  utils.any_to_json(data)
}

pub fn list_resources_result_decoder() {
  use meta <- decode.optional_field(
    "_meta",
    None,
    decode.optional(decode.dict(decode.string, utils.any_decoder())),
  )
  use next_cursor <- decode.optional_field(
    "nextCursor",
    None,
    decode.optional(decode.string),
  )
  use resources <- decode.field("resources", decode.list(resource_decoder()))
  decode.success(ListResourcesResult(
    meta: meta,
    next_cursor: next_cursor,
    resources: resources,
  ))
}

pub fn list_resources_result_encode(data: ListResourcesResult) {
  utils.object([
    #("_meta", json.nullable(data.meta, utils.dict(_, utils.any_to_json))),
    #("nextCursor", json.nullable(data.next_cursor, json.string)),
    #("resources", json.array(_, resource_encode)(data.resources)),
  ])
}

pub fn list_prompts_request_decoder() {
  use cursor <- decode.optional_field(
    "cursor",
    None,
    decode.optional(decode.string),
  )
  decode.success(ListPromptsRequest(cursor: cursor))
}

pub fn list_prompts_request_encode(data: ListPromptsRequest) {
  utils.object([#("cursor", json.nullable(data.cursor, json.string))])
}

pub fn jsonrpcmessage_decoder() {
  utils.any_decoder()
}

pub fn jsonrpcmessage_encode(data: Jsonrpcmessage) {
  utils.any_to_json(data)
}

pub fn get_prompt_request_decoder() {
  use arguments <- decode.optional_field(
    "arguments",
    None,
    decode.optional(decode.dict(decode.string, decode.string)),
  )
  use name <- decode.field("name", decode.string)
  decode.success(GetPromptRequest(arguments: arguments, name: name))
}

pub fn get_prompt_request_encode(data: GetPromptRequest) {
  utils.object([
    #("arguments", json.nullable(data.arguments, utils.dict(_, json.string))),
    #("name", json.string(data.name)),
  ])
}

pub fn elicit_request_decoder() {
  use message <- decode.field("message", decode.string)
  use requested_schema <- decode.field(
    "requestedSchema",
    anon_23ef5801_decoder(),
  )
  decode.success(ElicitRequest(
    message: message,
    requested_schema: requested_schema,
  ))
}

pub fn elicit_request_encode(data: ElicitRequest) {
  utils.object([
    #("message", json.string(data.message)),
    #("requestedSchema", anon_23ef5801_encode(data.requested_schema)),
  ])
}

pub fn resource_updated_notification_decoder() {
  use uri <- decode.field("uri", decode.string)
  decode.success(ResourceUpdatedNotification(uri: uri))
}

pub fn resource_updated_notification_encode(data: ResourceUpdatedNotification) {
  utils.object([#("uri", json.string(data.uri))])
}

pub fn read_resource_result_decoder() {
  use meta <- decode.optional_field(
    "_meta",
    None,
    decode.optional(decode.dict(decode.string, utils.any_decoder())),
  )
  use contents <- decode.field("contents", decode.list(utils.any_decoder()))
  decode.success(ReadResourceResult(meta: meta, contents: contents))
}

pub fn read_resource_result_encode(data: ReadResourceResult) {
  utils.object([
    #("_meta", json.nullable(data.meta, utils.dict(_, utils.any_to_json))),
    #("contents", json.array(_, utils.any_to_json)(data.contents)),
  ])
}

pub fn server_request_decoder() {
  utils.any_decoder()
}

pub fn server_request_encode(data: ServerRequest) {
  utils.any_to_json(data)
}

pub fn cursor_decoder() {
  decode.string
}

pub fn cursor_encode(data: Cursor) {
  json.string(data)
}

pub fn blob_resource_contents_decoder() {
  use meta <- decode.optional_field(
    "_meta",
    None,
    decode.optional(decode.dict(decode.string, utils.any_decoder())),
  )
  use blob <- decode.field("blob", decode.string)
  use mime_type <- decode.optional_field(
    "mimeType",
    None,
    decode.optional(decode.string),
  )
  use uri <- decode.field("uri", decode.string)
  decode.success(BlobResourceContents(
    meta: meta,
    blob: blob,
    mime_type: mime_type,
    uri: uri,
  ))
}

pub fn blob_resource_contents_encode(data: BlobResourceContents) {
  utils.object([
    #("_meta", json.nullable(data.meta, utils.dict(_, utils.any_to_json))),
    #("blob", json.string(data.blob)),
    #("mimeType", json.nullable(data.mime_type, json.string)),
    #("uri", json.string(data.uri)),
  ])
}

pub fn resource_decoder() {
  use meta <- decode.optional_field(
    "_meta",
    None,
    decode.optional(decode.dict(decode.string, utils.any_decoder())),
  )
  use annotations <- decode.optional_field(
    "annotations",
    None,
    decode.optional(annotations_decoder()),
  )
  use description <- decode.optional_field(
    "description",
    None,
    decode.optional(decode.string),
  )
  use mime_type <- decode.optional_field(
    "mimeType",
    None,
    decode.optional(decode.string),
  )
  use name <- decode.field("name", decode.string)
  use size <- decode.optional_field("size", None, decode.optional(decode.int))
  use title <- decode.optional_field(
    "title",
    None,
    decode.optional(decode.string),
  )
  use uri <- decode.field("uri", decode.string)
  decode.success(Resource(
    meta: meta,
    annotations: annotations,
    description: description,
    mime_type: mime_type,
    name: name,
    size: size,
    title: title,
    uri: uri,
  ))
}

pub fn resource_encode(data: Resource) {
  utils.object([
    #("_meta", json.nullable(data.meta, utils.dict(_, utils.any_to_json))),
    #("annotations", json.nullable(data.annotations, annotations_encode)),
    #("description", json.nullable(data.description, json.string)),
    #("mimeType", json.nullable(data.mime_type, json.string)),
    #("name", json.string(data.name)),
    #("size", json.nullable(data.size, json.int)),
    #("title", json.nullable(data.title, json.string)),
    #("uri", json.string(data.uri)),
  ])
}

pub fn complete_result_decoder() {
  use meta <- decode.optional_field(
    "_meta",
    None,
    decode.optional(decode.dict(decode.string, utils.any_decoder())),
  )
  use completion <- decode.field("completion", anon_a60b75a3_decoder())
  decode.success(CompleteResult(meta: meta, completion: completion))
}

pub fn complete_result_encode(data: CompleteResult) {
  utils.object([
    #("_meta", json.nullable(data.meta, utils.dict(_, utils.any_to_json))),
    #("completion", anon_a60b75a3_encode(data.completion)),
  ])
}

pub fn list_resource_templates_request_decoder() {
  use cursor <- decode.optional_field(
    "cursor",
    None,
    decode.optional(decode.string),
  )
  decode.success(ListResourceTemplatesRequest(cursor: cursor))
}

pub fn list_resource_templates_request_encode(
  data: ListResourceTemplatesRequest,
) {
  utils.object([#("cursor", json.nullable(data.cursor, json.string))])
}

pub fn model_preferences_decoder() {
  use cost_priority <- decode.optional_field(
    "costPriority",
    None,
    decode.optional(decode.float),
  )
  use hints <- decode.optional_field(
    "hints",
    None,
    decode.optional(decode.list(model_hint_decoder())),
  )
  use intelligence_priority <- decode.optional_field(
    "intelligencePriority",
    None,
    decode.optional(decode.float),
  )
  use speed_priority <- decode.optional_field(
    "speedPriority",
    None,
    decode.optional(decode.float),
  )
  decode.success(ModelPreferences(
    cost_priority: cost_priority,
    hints: hints,
    intelligence_priority: intelligence_priority,
    speed_priority: speed_priority,
  ))
}

pub fn model_preferences_encode(data: ModelPreferences) {
  utils.object([
    #("costPriority", json.nullable(data.cost_priority, json.float)),
    #("hints", json.nullable(data.hints, json.array(_, model_hint_encode))),
    #(
      "intelligencePriority",
      json.nullable(data.intelligence_priority, json.float),
    ),
    #("speedPriority", json.nullable(data.speed_priority, json.float)),
  ])
}

pub fn root_decoder() {
  use meta <- decode.optional_field(
    "_meta",
    None,
    decode.optional(decode.dict(decode.string, utils.any_decoder())),
  )
  use name <- decode.optional_field(
    "name",
    None,
    decode.optional(decode.string),
  )
  use uri <- decode.field("uri", decode.string)
  decode.success(Root(meta: meta, name: name, uri: uri))
}

pub fn root_encode(data: Root) {
  utils.object([
    #("_meta", json.nullable(data.meta, utils.dict(_, utils.any_to_json))),
    #("name", json.nullable(data.name, json.string)),
    #("uri", json.string(data.uri)),
  ])
}

pub fn create_message_request_decoder() {
  use include_context <- decode.optional_field(
    "includeContext",
    None,
    decode.optional(decode.string),
  )
  use max_tokens <- decode.field("maxTokens", decode.int)
  use messages <- decode.field(
    "messages",
    decode.list(sampling_message_decoder()),
  )
  use metadata <- decode.optional_field(
    "metadata",
    None,
    decode.optional(decode.dict(decode.string, utils.any_decoder())),
  )
  use model_preferences <- decode.optional_field(
    "modelPreferences",
    None,
    decode.optional(model_preferences_decoder()),
  )
  use stop_sequences <- decode.optional_field(
    "stopSequences",
    None,
    decode.optional(decode.list(decode.string)),
  )
  use system_prompt <- decode.optional_field(
    "systemPrompt",
    None,
    decode.optional(decode.string),
  )
  use temperature <- decode.optional_field(
    "temperature",
    None,
    decode.optional(decode.float),
  )
  decode.success(CreateMessageRequest(
    include_context: include_context,
    max_tokens: max_tokens,
    messages: messages,
    metadata: metadata,
    model_preferences: model_preferences,
    stop_sequences: stop_sequences,
    system_prompt: system_prompt,
    temperature: temperature,
  ))
}

pub fn create_message_request_encode(data: CreateMessageRequest) {
  utils.object([
    #("includeContext", json.nullable(data.include_context, json.string)),
    #("maxTokens", json.int(data.max_tokens)),
    #("messages", json.array(_, sampling_message_encode)(data.messages)),
    #(
      "metadata",
      json.nullable(data.metadata, utils.dict(_, utils.any_to_json)),
    ),
    #(
      "modelPreferences",
      json.nullable(data.model_preferences, model_preferences_encode),
    ),
    #(
      "stopSequences",
      json.nullable(data.stop_sequences, json.array(_, json.string)),
    ),
    #("systemPrompt", json.nullable(data.system_prompt, json.string)),
    #("temperature", json.nullable(data.temperature, json.float)),
  ])
}

pub fn server_capabilities_decoder() {
  use completions <- decode.optional_field(
    "completions",
    None,
    decode.optional(decode.dict(decode.string, utils.any_decoder())),
  )
  use experimental <- decode.optional_field(
    "experimental",
    None,
    decode.optional(decode.dict(
      decode.string,
      decode.dict(decode.string, utils.any_decoder()),
    )),
  )
  use logging <- decode.optional_field(
    "logging",
    None,
    decode.optional(decode.dict(decode.string, utils.any_decoder())),
  )
  use prompts <- decode.optional_field(
    "prompts",
    None,
    decode.optional(anon_405cc9c3_decoder()),
  )
  use resources <- decode.optional_field(
    "resources",
    None,
    decode.optional(anon_3889ba9d_decoder()),
  )
  use tools <- decode.optional_field(
    "tools",
    None,
    decode.optional(anon_405cc9c3_decoder()),
  )
  decode.success(ServerCapabilities(
    completions: completions,
    experimental: experimental,
    logging: logging,
    prompts: prompts,
    resources: resources,
    tools: tools,
  ))
}

pub fn server_capabilities_encode(data: ServerCapabilities) {
  utils.object([
    #(
      "completions",
      json.nullable(data.completions, utils.dict(_, utils.any_to_json)),
    ),
    #(
      "experimental",
      json.nullable(
        data.experimental,
        utils.dict(_, utils.dict(_, utils.any_to_json)),
      ),
    ),
    #("logging", json.nullable(data.logging, utils.dict(_, utils.any_to_json))),
    #("prompts", json.nullable(data.prompts, anon_405cc9c3_encode)),
    #("resources", json.nullable(data.resources, anon_3889ba9d_encode)),
    #("tools", json.nullable(data.tools, anon_405cc9c3_encode)),
  ])
}

pub fn client_request_decoder() {
  utils.any_decoder()
}

pub fn client_request_encode(data: ClientRequest) {
  utils.any_to_json(data)
}

pub fn result_decoder() {
  use meta <- decode.optional_field(
    "_meta",
    None,
    decode.optional(decode.dict(decode.string, utils.any_decoder())),
  )
  use additional_properties <- utils.decode_additional(
    ["_meta"],
    utils.any_decoder(),
  )
  decode.success(Result(
    meta: meta,
    additional_properties: additional_properties,
  ))
}

pub fn result_encode(data: Result) {
  utils.object([
    #("_meta", json.nullable(data.meta, utils.dict(_, utils.any_to_json))),
    ..dict.to_list(
      dict.map_values(data.additional_properties, fn(_key, value) {
        utils.any_to_json(value)
      }),
    )
  ])
}

pub fn initialize_result_decoder() {
  use meta <- decode.optional_field(
    "_meta",
    None,
    decode.optional(decode.dict(decode.string, utils.any_decoder())),
  )
  use capabilities <- decode.field(
    "capabilities",
    server_capabilities_decoder(),
  )
  use instructions <- decode.optional_field(
    "instructions",
    None,
    decode.optional(decode.string),
  )
  use protocol_version <- decode.field("protocolVersion", decode.string)
  use server_info <- decode.field("serverInfo", implementation_decoder())
  decode.success(InitializeResult(
    meta: meta,
    capabilities: capabilities,
    instructions: instructions,
    protocol_version: protocol_version,
    server_info: server_info,
  ))
}

pub fn initialize_result_encode(data: InitializeResult) {
  utils.object([
    #("_meta", json.nullable(data.meta, utils.dict(_, utils.any_to_json))),
    #("capabilities", server_capabilities_encode(data.capabilities)),
    #("instructions", json.nullable(data.instructions, json.string)),
    #("protocolVersion", json.string(data.protocol_version)),
    #("serverInfo", implementation_encode(data.server_info)),
  ])
}

pub fn embedded_resource_decoder() {
  use meta <- decode.optional_field(
    "_meta",
    None,
    decode.optional(decode.dict(decode.string, utils.any_decoder())),
  )
  use annotations <- decode.optional_field(
    "annotations",
    None,
    decode.optional(annotations_decoder()),
  )
  use resource <- decode.field("resource", utils.any_decoder())
  use type_ <- decode.field("type", decode.string)
  decode.success(EmbeddedResource(
    meta: meta,
    annotations: annotations,
    resource: resource,
    type_: type_,
  ))
}

pub fn embedded_resource_encode(data: EmbeddedResource) {
  utils.object([
    #("_meta", json.nullable(data.meta, utils.dict(_, utils.any_to_json))),
    #("annotations", json.nullable(data.annotations, annotations_encode)),
    #("resource", utils.any_to_json(data.resource)),
    #("type", json.string(data.type_)),
  ])
}

pub fn complete_request_decoder() {
  use argument <- decode.field("argument", anon_68f425dd_decoder())
  use context <- decode.optional_field(
    "context",
    None,
    decode.optional(anon_4c2c4139_decoder()),
  )
  use ref <- decode.field("ref", utils.any_decoder())
  decode.success(CompleteRequest(argument: argument, context: context, ref: ref))
}

pub fn complete_request_encode(data: CompleteRequest) {
  utils.object([
    #("argument", anon_68f425dd_encode(data.argument)),
    #("context", json.nullable(data.context, anon_4c2c4139_encode)),
    #("ref", utils.any_to_json(data.ref)),
  ])
}

pub fn list_roots_result_decoder() {
  use meta <- decode.optional_field(
    "_meta",
    None,
    decode.optional(decode.dict(decode.string, utils.any_decoder())),
  )
  use roots <- decode.field("roots", decode.list(root_decoder()))
  decode.success(ListRootsResult(meta: meta, roots: roots))
}

pub fn list_roots_result_encode(data: ListRootsResult) {
  utils.object([
    #("_meta", json.nullable(data.meta, utils.dict(_, utils.any_to_json))),
    #("roots", json.array(_, root_encode)(data.roots)),
  ])
}

pub fn image_content_decoder() {
  use meta <- decode.optional_field(
    "_meta",
    None,
    decode.optional(decode.dict(decode.string, utils.any_decoder())),
  )
  use annotations <- decode.optional_field(
    "annotations",
    None,
    decode.optional(annotations_decoder()),
  )
  use data <- decode.field("data", decode.string)
  use mime_type <- decode.field("mimeType", decode.string)
  use type_ <- decode.field("type", decode.string)
  decode.success(ImageContent(
    meta: meta,
    annotations: annotations,
    data: data,
    mime_type: mime_type,
    type_: type_,
  ))
}

pub fn image_content_encode(data: ImageContent) {
  utils.object([
    #("_meta", json.nullable(data.meta, utils.dict(_, utils.any_to_json))),
    #("annotations", json.nullable(data.annotations, annotations_encode)),
    #("data", json.string(data.data)),
    #("mimeType", json.string(data.mime_type)),
    #("type", json.string(data.type_)),
  ])
}

pub fn call_tool_result_decoder() {
  use meta <- decode.optional_field(
    "_meta",
    None,
    decode.optional(decode.dict(decode.string, utils.any_decoder())),
  )
  use content <- decode.field("content", decode.list(content_block_decoder()))
  use is_error <- decode.optional_field(
    "isError",
    None,
    decode.optional(decode.bool),
  )
  use structured_content <- decode.optional_field(
    "structuredContent",
    None,
    decode.optional(decode.dict(decode.string, utils.any_decoder())),
  )
  decode.success(CallToolResult(
    meta: meta,
    content: content,
    is_error: is_error,
    structured_content: structured_content,
  ))
}

pub fn call_tool_result_encode(data: CallToolResult) {
  utils.object([
    #("_meta", json.nullable(data.meta, utils.dict(_, utils.any_to_json))),
    #("content", json.array(_, content_block_encode)(data.content)),
    #("isError", json.nullable(data.is_error, json.bool)),
    #(
      "structuredContent",
      json.nullable(data.structured_content, utils.dict(_, utils.any_to_json)),
    ),
  ])
}

pub fn initialized_notification_decoder() {
  use meta <- decode.optional_field(
    "_meta",
    None,
    decode.optional(decode.dict(decode.string, utils.any_decoder())),
  )
  use additional_properties <- utils.decode_additional(
    ["_meta"],
    utils.any_decoder(),
  )
  decode.success(InitializedNotification(
    meta: meta,
    additional_properties: additional_properties,
  ))
}

pub fn initialized_notification_encode(data: InitializedNotification) {
  utils.object([
    #("_meta", json.nullable(data.meta, utils.dict(_, utils.any_to_json))),
    ..dict.to_list(
      dict.map_values(data.additional_properties, fn(_key, value) {
        utils.any_to_json(value)
      }),
    )
  ])
}

pub fn list_tools_request_decoder() {
  use cursor <- decode.optional_field(
    "cursor",
    None,
    decode.optional(decode.string),
  )
  decode.success(ListToolsRequest(cursor: cursor))
}

pub fn list_tools_request_encode(data: ListToolsRequest) {
  utils.object([#("cursor", json.nullable(data.cursor, json.string))])
}

pub fn base_metadata_decoder() {
  use name <- decode.field("name", decode.string)
  use title <- decode.optional_field(
    "title",
    None,
    decode.optional(decode.string),
  )
  decode.success(BaseMetadata(name: name, title: title))
}

pub fn base_metadata_encode(data: BaseMetadata) {
  utils.object([
    #("name", json.string(data.name)),
    #("title", json.nullable(data.title, json.string)),
  ])
}

pub fn list_resources_request_decoder() {
  use cursor <- decode.optional_field(
    "cursor",
    None,
    decode.optional(decode.string),
  )
  decode.success(ListResourcesRequest(cursor: cursor))
}

pub fn list_resources_request_encode(data: ListResourcesRequest) {
  utils.object([#("cursor", json.nullable(data.cursor, json.string))])
}

pub fn list_resource_templates_result_decoder() {
  use meta <- decode.optional_field(
    "_meta",
    None,
    decode.optional(decode.dict(decode.string, utils.any_decoder())),
  )
  use next_cursor <- decode.optional_field(
    "nextCursor",
    None,
    decode.optional(decode.string),
  )
  use resource_templates <- decode.field(
    "resourceTemplates",
    decode.list(resource_template_decoder()),
  )
  decode.success(ListResourceTemplatesResult(
    meta: meta,
    next_cursor: next_cursor,
    resource_templates: resource_templates,
  ))
}

pub fn list_resource_templates_result_encode(data: ListResourceTemplatesResult) {
  utils.object([
    #("_meta", json.nullable(data.meta, utils.dict(_, utils.any_to_json))),
    #("nextCursor", json.nullable(data.next_cursor, json.string)),
    #(
      "resourceTemplates",
      json.array(_, resource_template_encode)(data.resource_templates),
    ),
  ])
}

pub fn subscribe_request_decoder() {
  use uri <- decode.field("uri", decode.string)
  decode.success(SubscribeRequest(uri: uri))
}

pub fn subscribe_request_encode(data: SubscribeRequest) {
  utils.object([#("uri", json.string(data.uri))])
}

pub fn implementation_decoder() {
  use name <- decode.field("name", decode.string)
  use title <- decode.optional_field(
    "title",
    None,
    decode.optional(decode.string),
  )
  use version <- decode.field("version", decode.string)
  decode.success(Implementation(name: name, title: title, version: version))
}

pub fn implementation_encode(data: Implementation) {
  utils.object([
    #("name", json.string(data.name)),
    #("title", json.nullable(data.title, json.string)),
    #("version", json.string(data.version)),
  ])
}

pub fn progress_token_decoder() {
  utils.any_decoder()
}

pub fn progress_token_encode(data: ProgressToken) {
  utils.any_to_json(data)
}

pub fn content_block_decoder() {
  utils.any_decoder()
}

pub fn content_block_encode(data: ContentBlock) {
  utils.any_to_json(data)
}

pub fn role_decoder() {
  decode.string
}

pub fn role_encode(data: Role) {
  json.string(data)
}

pub fn prompt_argument_decoder() {
  use description <- decode.optional_field(
    "description",
    None,
    decode.optional(decode.string),
  )
  use name <- decode.field("name", decode.string)
  use required <- decode.optional_field(
    "required",
    None,
    decode.optional(decode.bool),
  )
  use title <- decode.optional_field(
    "title",
    None,
    decode.optional(decode.string),
  )
  decode.success(PromptArgument(
    description: description,
    name: name,
    required: required,
    title: title,
  ))
}

pub fn prompt_argument_encode(data: PromptArgument) {
  utils.object([
    #("description", json.nullable(data.description, json.string)),
    #("name", json.string(data.name)),
    #("required", json.nullable(data.required, json.bool)),
    #("title", json.nullable(data.title, json.string)),
  ])
}

pub fn tool_decoder() {
  use meta <- decode.optional_field(
    "_meta",
    None,
    decode.optional(decode.dict(decode.string, utils.any_decoder())),
  )
  use annotations <- decode.optional_field(
    "annotations",
    None,
    decode.optional(tool_annotations_decoder()),
  )
  use description <- decode.optional_field(
    "description",
    None,
    decode.optional(decode.string),
  )
  use input_schema <- decode.field("inputSchema", anon_a5a007cd_decoder())
  use name <- decode.field("name", decode.string)
  use output_schema <- decode.optional_field(
    "outputSchema",
    None,
    decode.optional(anon_a5a007cd_decoder()),
  )
  use title <- decode.optional_field(
    "title",
    None,
    decode.optional(decode.string),
  )
  decode.success(Tool(
    meta: meta,
    annotations: annotations,
    description: description,
    input_schema: input_schema,
    name: name,
    output_schema: output_schema,
    title: title,
  ))
}

pub fn tool_encode(data: Tool) {
  utils.object([
    #("_meta", json.nullable(data.meta, utils.dict(_, utils.any_to_json))),
    #("annotations", json.nullable(data.annotations, tool_annotations_encode)),
    #("description", json.nullable(data.description, json.string)),
    #("inputSchema", anon_a5a007cd_encode(data.input_schema)),
    #("name", json.string(data.name)),
    #("outputSchema", json.nullable(data.output_schema, anon_a5a007cd_encode)),
    #("title", json.nullable(data.title, json.string)),
  ])
}

pub fn resource_template_decoder() {
  use meta <- decode.optional_field(
    "_meta",
    None,
    decode.optional(decode.dict(decode.string, utils.any_decoder())),
  )
  use annotations <- decode.optional_field(
    "annotations",
    None,
    decode.optional(annotations_decoder()),
  )
  use description <- decode.optional_field(
    "description",
    None,
    decode.optional(decode.string),
  )
  use mime_type <- decode.optional_field(
    "mimeType",
    None,
    decode.optional(decode.string),
  )
  use name <- decode.field("name", decode.string)
  use title <- decode.optional_field(
    "title",
    None,
    decode.optional(decode.string),
  )
  use uri_template <- decode.field("uriTemplate", decode.string)
  decode.success(ResourceTemplate(
    meta: meta,
    annotations: annotations,
    description: description,
    mime_type: mime_type,
    name: name,
    title: title,
    uri_template: uri_template,
  ))
}

pub fn resource_template_encode(data: ResourceTemplate) {
  utils.object([
    #("_meta", json.nullable(data.meta, utils.dict(_, utils.any_to_json))),
    #("annotations", json.nullable(data.annotations, annotations_encode)),
    #("description", json.nullable(data.description, json.string)),
    #("mimeType", json.nullable(data.mime_type, json.string)),
    #("name", json.string(data.name)),
    #("title", json.nullable(data.title, json.string)),
    #("uriTemplate", json.string(data.uri_template)),
  ])
}

pub fn resource_contents_decoder() {
  use meta <- decode.optional_field(
    "_meta",
    None,
    decode.optional(decode.dict(decode.string, utils.any_decoder())),
  )
  use mime_type <- decode.optional_field(
    "mimeType",
    None,
    decode.optional(decode.string),
  )
  use uri <- decode.field("uri", decode.string)
  decode.success(ResourceContents(meta: meta, mime_type: mime_type, uri: uri))
}

pub fn resource_contents_encode(data: ResourceContents) {
  utils.object([
    #("_meta", json.nullable(data.meta, utils.dict(_, utils.any_to_json))),
    #("mimeType", json.nullable(data.mime_type, json.string)),
    #("uri", json.string(data.uri)),
  ])
}

pub fn prompt_reference_decoder() {
  use name <- decode.field("name", decode.string)
  use title <- decode.optional_field(
    "title",
    None,
    decode.optional(decode.string),
  )
  use type_ <- decode.field("type", decode.string)
  decode.success(PromptReference(name: name, title: title, type_: type_))
}

pub fn prompt_reference_encode(data: PromptReference) {
  utils.object([
    #("name", json.string(data.name)),
    #("title", json.nullable(data.title, json.string)),
    #("type", json.string(data.type_)),
  ])
}

pub fn create_message_result_decoder() {
  use meta <- decode.optional_field(
    "_meta",
    None,
    decode.optional(decode.dict(decode.string, utils.any_decoder())),
  )
  use content <- decode.field("content", utils.any_decoder())
  use model <- decode.field("model", decode.string)
  use role <- decode.field("role", role_decoder())
  use stop_reason <- decode.optional_field(
    "stopReason",
    None,
    decode.optional(decode.string),
  )
  decode.success(CreateMessageResult(
    meta: meta,
    content: content,
    model: model,
    role: role,
    stop_reason: stop_reason,
  ))
}

pub fn create_message_result_encode(data: CreateMessageResult) {
  utils.object([
    #("_meta", json.nullable(data.meta, utils.dict(_, utils.any_to_json))),
    #("content", utils.any_to_json(data.content)),
    #("model", json.string(data.model)),
    #("role", role_encode(data.role)),
    #("stopReason", json.nullable(data.stop_reason, json.string)),
  ])
}

pub fn notification_decoder() {
  use meta <- decode.optional_field(
    "_meta",
    None,
    decode.optional(decode.dict(decode.string, utils.any_decoder())),
  )
  use additional_properties <- utils.decode_additional(
    ["_meta"],
    utils.any_decoder(),
  )
  decode.success(Notification(
    meta: meta,
    additional_properties: additional_properties,
  ))
}

pub fn notification_encode(data: Notification) {
  utils.object([
    #("_meta", json.nullable(data.meta, utils.dict(_, utils.any_to_json))),
    ..dict.to_list(
      dict.map_values(data.additional_properties, fn(_key, value) {
        utils.any_to_json(value)
      }),
    )
  ])
}

pub fn paginated_request_decoder() {
  use cursor <- decode.optional_field(
    "cursor",
    None,
    decode.optional(decode.string),
  )
  decode.success(PaginatedRequest(cursor: cursor))
}

pub fn paginated_request_encode(data: PaginatedRequest) {
  utils.object([#("cursor", json.nullable(data.cursor, json.string))])
}

pub fn annotations_decoder() {
  use audience <- decode.optional_field(
    "audience",
    None,
    decode.optional(decode.list(role_decoder())),
  )
  use last_modified <- decode.optional_field(
    "lastModified",
    None,
    decode.optional(decode.string),
  )
  use priority <- decode.optional_field(
    "priority",
    None,
    decode.optional(decode.float),
  )
  decode.success(Annotations(
    audience: audience,
    last_modified: last_modified,
    priority: priority,
  ))
}

pub fn annotations_encode(data: Annotations) {
  utils.object([
    #("audience", json.nullable(data.audience, json.array(_, role_encode))),
    #("lastModified", json.nullable(data.last_modified, json.string)),
    #("priority", json.nullable(data.priority, json.float)),
  ])
}

pub fn resource_template_reference_decoder() {
  use type_ <- decode.field("type", decode.string)
  use uri <- decode.field("uri", decode.string)
  decode.success(ResourceTemplateReference(type_: type_, uri: uri))
}

pub fn resource_template_reference_encode(data: ResourceTemplateReference) {
  utils.object([
    #("type", json.string(data.type_)),
    #("uri", json.string(data.uri)),
  ])
}

pub fn resource_link_decoder() {
  use meta <- decode.optional_field(
    "_meta",
    None,
    decode.optional(decode.dict(decode.string, utils.any_decoder())),
  )
  use annotations <- decode.optional_field(
    "annotations",
    None,
    decode.optional(annotations_decoder()),
  )
  use description <- decode.optional_field(
    "description",
    None,
    decode.optional(decode.string),
  )
  use mime_type <- decode.optional_field(
    "mimeType",
    None,
    decode.optional(decode.string),
  )
  use name <- decode.field("name", decode.string)
  use size <- decode.optional_field("size", None, decode.optional(decode.int))
  use title <- decode.optional_field(
    "title",
    None,
    decode.optional(decode.string),
  )
  use type_ <- decode.field("type", decode.string)
  use uri <- decode.field("uri", decode.string)
  decode.success(ResourceLink(
    meta: meta,
    annotations: annotations,
    description: description,
    mime_type: mime_type,
    name: name,
    size: size,
    title: title,
    type_: type_,
    uri: uri,
  ))
}

pub fn resource_link_encode(data: ResourceLink) {
  utils.object([
    #("_meta", json.nullable(data.meta, utils.dict(_, utils.any_to_json))),
    #("annotations", json.nullable(data.annotations, annotations_encode)),
    #("description", json.nullable(data.description, json.string)),
    #("mimeType", json.nullable(data.mime_type, json.string)),
    #("name", json.string(data.name)),
    #("size", json.nullable(data.size, json.int)),
    #("title", json.nullable(data.title, json.string)),
    #("type", json.string(data.type_)),
    #("uri", json.string(data.uri)),
  ])
}

pub fn empty_result_decoder() {
  decode.new_primitive_decoder("Never", fn(_) {
    panic as "tried to decode a never decode value"
  })
}

pub fn empty_result_encode(_data: EmptyResult) {
  panic as "never value cannot be encoded"
}

pub fn number_schema_decoder() {
  use description <- decode.optional_field(
    "description",
    None,
    decode.optional(decode.string),
  )
  use maximum <- decode.optional_field(
    "maximum",
    None,
    decode.optional(decode.int),
  )
  use minimum <- decode.optional_field(
    "minimum",
    None,
    decode.optional(decode.int),
  )
  use title <- decode.optional_field(
    "title",
    None,
    decode.optional(decode.string),
  )
  use type_ <- decode.field("type", decode.string)
  decode.success(NumberSchema(
    description: description,
    maximum: maximum,
    minimum: minimum,
    title: title,
    type_: type_,
  ))
}

pub fn number_schema_encode(data: NumberSchema) {
  utils.object([
    #("description", json.nullable(data.description, json.string)),
    #("maximum", json.nullable(data.maximum, json.int)),
    #("minimum", json.nullable(data.minimum, json.int)),
    #("title", json.nullable(data.title, json.string)),
    #("type", json.string(data.type_)),
  ])
}

pub fn audio_content_decoder() {
  use meta <- decode.optional_field(
    "_meta",
    None,
    decode.optional(decode.dict(decode.string, utils.any_decoder())),
  )
  use annotations <- decode.optional_field(
    "annotations",
    None,
    decode.optional(annotations_decoder()),
  )
  use data <- decode.field("data", decode.string)
  use mime_type <- decode.field("mimeType", decode.string)
  use type_ <- decode.field("type", decode.string)
  decode.success(AudioContent(
    meta: meta,
    annotations: annotations,
    data: data,
    mime_type: mime_type,
    type_: type_,
  ))
}

pub fn audio_content_encode(data: AudioContent) {
  utils.object([
    #("_meta", json.nullable(data.meta, utils.dict(_, utils.any_to_json))),
    #("annotations", json.nullable(data.annotations, annotations_encode)),
    #("data", json.string(data.data)),
    #("mimeType", json.string(data.mime_type)),
    #("type", json.string(data.type_)),
  ])
}

pub fn string_schema_decoder() {
  use description <- decode.optional_field(
    "description",
    None,
    decode.optional(decode.string),
  )
  use format <- decode.optional_field(
    "format",
    None,
    decode.optional(decode.string),
  )
  use max_length <- decode.optional_field(
    "maxLength",
    None,
    decode.optional(decode.int),
  )
  use min_length <- decode.optional_field(
    "minLength",
    None,
    decode.optional(decode.int),
  )
  use title <- decode.optional_field(
    "title",
    None,
    decode.optional(decode.string),
  )
  use type_ <- decode.field("type", decode.string)
  decode.success(StringSchema(
    description: description,
    format: format,
    max_length: max_length,
    min_length: min_length,
    title: title,
    type_: type_,
  ))
}

pub fn string_schema_encode(data: StringSchema) {
  utils.object([
    #("description", json.nullable(data.description, json.string)),
    #("format", json.nullable(data.format, json.string)),
    #("maxLength", json.nullable(data.max_length, json.int)),
    #("minLength", json.nullable(data.min_length, json.int)),
    #("title", json.nullable(data.title, json.string)),
    #("type", json.string(data.type_)),
  ])
}

pub fn progress_notification_decoder() {
  use message <- decode.optional_field(
    "message",
    None,
    decode.optional(decode.string),
  )
  use progress <- decode.field("progress", decode.float)
  use progress_token <- decode.field("progressToken", progress_token_decoder())
  use total <- decode.optional_field(
    "total",
    None,
    decode.optional(decode.float),
  )
  decode.success(ProgressNotification(
    message: message,
    progress: progress,
    progress_token: progress_token,
    total: total,
  ))
}

pub fn progress_notification_encode(data: ProgressNotification) {
  utils.object([
    #("message", json.nullable(data.message, json.string)),
    #("progress", json.float(data.progress)),
    #("progressToken", progress_token_encode(data.progress_token)),
    #("total", json.nullable(data.total, json.float)),
  ])
}

pub fn list_prompts_result_decoder() {
  use meta <- decode.optional_field(
    "_meta",
    None,
    decode.optional(decode.dict(decode.string, utils.any_decoder())),
  )
  use next_cursor <- decode.optional_field(
    "nextCursor",
    None,
    decode.optional(decode.string),
  )
  use prompts <- decode.field("prompts", decode.list(prompt_decoder()))
  decode.success(ListPromptsResult(
    meta: meta,
    next_cursor: next_cursor,
    prompts: prompts,
  ))
}

pub fn list_prompts_result_encode(data: ListPromptsResult) {
  utils.object([
    #("_meta", json.nullable(data.meta, utils.dict(_, utils.any_to_json))),
    #("nextCursor", json.nullable(data.next_cursor, json.string)),
    #("prompts", json.array(_, prompt_encode)(data.prompts)),
  ])
}

pub fn server_result_decoder() {
  utils.any_decoder()
}

pub fn server_result_encode(data: ServerResult) {
  utils.any_to_json(data)
}

pub fn unsubscribe_request_decoder() {
  use uri <- decode.field("uri", decode.string)
  decode.success(UnsubscribeRequest(uri: uri))
}

pub fn unsubscribe_request_encode(data: UnsubscribeRequest) {
  utils.object([#("uri", json.string(data.uri))])
}

pub fn prompt_list_changed_notification_decoder() {
  use meta <- decode.optional_field(
    "_meta",
    None,
    decode.optional(decode.dict(decode.string, utils.any_decoder())),
  )
  use additional_properties <- utils.decode_additional(
    ["_meta"],
    utils.any_decoder(),
  )
  decode.success(PromptListChangedNotification(
    meta: meta,
    additional_properties: additional_properties,
  ))
}

pub fn prompt_list_changed_notification_encode(
  data: PromptListChangedNotification,
) {
  utils.object([
    #("_meta", json.nullable(data.meta, utils.dict(_, utils.any_to_json))),
    ..dict.to_list(
      dict.map_values(data.additional_properties, fn(_key, value) {
        utils.any_to_json(value)
      }),
    )
  ])
}

pub fn text_resource_contents_decoder() {
  use meta <- decode.optional_field(
    "_meta",
    None,
    decode.optional(decode.dict(decode.string, utils.any_decoder())),
  )
  use mime_type <- decode.optional_field(
    "mimeType",
    None,
    decode.optional(decode.string),
  )
  use text <- decode.field("text", decode.string)
  use uri <- decode.field("uri", decode.string)
  decode.success(TextResourceContents(
    meta: meta,
    mime_type: mime_type,
    text: text,
    uri: uri,
  ))
}

pub fn text_resource_contents_encode(data: TextResourceContents) {
  utils.object([
    #("_meta", json.nullable(data.meta, utils.dict(_, utils.any_to_json))),
    #("mimeType", json.nullable(data.mime_type, json.string)),
    #("text", json.string(data.text)),
    #("uri", json.string(data.uri)),
  ])
}

pub fn client_capabilities_decoder() {
  use elicitation <- decode.optional_field(
    "elicitation",
    None,
    decode.optional(decode.dict(decode.string, utils.any_decoder())),
  )
  use experimental <- decode.optional_field(
    "experimental",
    None,
    decode.optional(decode.dict(
      decode.string,
      decode.dict(decode.string, utils.any_decoder()),
    )),
  )
  use roots <- decode.optional_field(
    "roots",
    None,
    decode.optional(anon_405cc9c3_decoder()),
  )
  use sampling <- decode.optional_field(
    "sampling",
    None,
    decode.optional(decode.dict(decode.string, utils.any_decoder())),
  )
  decode.success(ClientCapabilities(
    elicitation: elicitation,
    experimental: experimental,
    roots: roots,
    sampling: sampling,
  ))
}

pub fn client_capabilities_encode(data: ClientCapabilities) {
  utils.object([
    #(
      "elicitation",
      json.nullable(data.elicitation, utils.dict(_, utils.any_to_json)),
    ),
    #(
      "experimental",
      json.nullable(
        data.experimental,
        utils.dict(_, utils.dict(_, utils.any_to_json)),
      ),
    ),
    #("roots", json.nullable(data.roots, anon_405cc9c3_encode)),
    #(
      "sampling",
      json.nullable(data.sampling, utils.dict(_, utils.any_to_json)),
    ),
  ])
}

pub fn elicit_result_decoder() {
  use meta <- decode.optional_field(
    "_meta",
    None,
    decode.optional(decode.dict(decode.string, utils.any_decoder())),
  )
  use action <- decode.field("action", decode.string)
  use content <- decode.optional_field(
    "content",
    None,
    decode.optional(decode.dict(decode.string, utils.any_decoder())),
  )
  decode.success(ElicitResult(meta: meta, action: action, content: content))
}

pub fn elicit_result_encode(data: ElicitResult) {
  utils.object([
    #("_meta", json.nullable(data.meta, utils.dict(_, utils.any_to_json))),
    #("action", json.string(data.action)),
    #("content", json.nullable(data.content, utils.dict(_, utils.any_to_json))),
  ])
}

pub fn request_id_decoder() {
  utils.any_decoder()
}

pub fn request_id_encode(data: RequestId) {
  utils.any_to_json(data)
}

pub fn primitive_schema_definition_decoder() {
  utils.any_decoder()
}

pub fn primitive_schema_definition_encode(data: PrimitiveSchemaDefinition) {
  utils.any_to_json(data)
}

pub fn request_decoder() {
  use meta <- decode.optional_field(
    "_meta",
    None,
    decode.optional(anon_345b3036_decoder()),
  )
  use additional_properties <- utils.decode_additional(
    ["_meta"],
    utils.any_decoder(),
  )
  decode.success(Request(
    meta: meta,
    additional_properties: additional_properties,
  ))
}

pub fn request_encode(data: Request) {
  utils.object([
    #("_meta", json.nullable(data.meta, anon_345b3036_encode)),
    ..dict.to_list(
      dict.map_values(data.additional_properties, fn(_key, value) {
        utils.any_to_json(value)
      }),
    )
  ])
}

pub fn roots_list_changed_notification_decoder() {
  use meta <- decode.optional_field(
    "_meta",
    None,
    decode.optional(decode.dict(decode.string, utils.any_decoder())),
  )
  use additional_properties <- utils.decode_additional(
    ["_meta"],
    utils.any_decoder(),
  )
  decode.success(RootsListChangedNotification(
    meta: meta,
    additional_properties: additional_properties,
  ))
}

pub fn roots_list_changed_notification_encode(
  data: RootsListChangedNotification,
) {
  utils.object([
    #("_meta", json.nullable(data.meta, utils.dict(_, utils.any_to_json))),
    ..dict.to_list(
      dict.map_values(data.additional_properties, fn(_key, value) {
        utils.any_to_json(value)
      }),
    )
  ])
}

pub fn ping_request_decoder() {
  use meta <- decode.optional_field(
    "_meta",
    None,
    decode.optional(anon_345b3036_decoder()),
  )
  use additional_properties <- utils.decode_additional(
    ["_meta"],
    utils.any_decoder(),
  )
  decode.success(PingRequest(
    meta: meta,
    additional_properties: additional_properties,
  ))
}

pub fn ping_request_encode(data: PingRequest) {
  utils.object([
    #("_meta", json.nullable(data.meta, anon_345b3036_encode)),
    ..dict.to_list(
      dict.map_values(data.additional_properties, fn(_key, value) {
        utils.any_to_json(value)
      }),
    )
  ])
}

pub fn tool_annotations_decoder() {
  use destructive_hint <- decode.optional_field(
    "destructiveHint",
    None,
    decode.optional(decode.bool),
  )
  use idempotent_hint <- decode.optional_field(
    "idempotentHint",
    None,
    decode.optional(decode.bool),
  )
  use open_world_hint <- decode.optional_field(
    "openWorldHint",
    None,
    decode.optional(decode.bool),
  )
  use read_only_hint <- decode.optional_field(
    "readOnlyHint",
    None,
    decode.optional(decode.bool),
  )
  use title <- decode.optional_field(
    "title",
    None,
    decode.optional(decode.string),
  )
  decode.success(ToolAnnotations(
    destructive_hint: destructive_hint,
    idempotent_hint: idempotent_hint,
    open_world_hint: open_world_hint,
    read_only_hint: read_only_hint,
    title: title,
  ))
}

pub fn tool_annotations_encode(data: ToolAnnotations) {
  utils.object([
    #("destructiveHint", json.nullable(data.destructive_hint, json.bool)),
    #("idempotentHint", json.nullable(data.idempotent_hint, json.bool)),
    #("openWorldHint", json.nullable(data.open_world_hint, json.bool)),
    #("readOnlyHint", json.nullable(data.read_only_hint, json.bool)),
    #("title", json.nullable(data.title, json.string)),
  ])
}

pub fn sampling_message_decoder() {
  use content <- decode.field("content", utils.any_decoder())
  use role <- decode.field("role", role_decoder())
  decode.success(SamplingMessage(content: content, role: role))
}

pub fn sampling_message_encode(data: SamplingMessage) {
  utils.object([
    #("content", utils.any_to_json(data.content)),
    #("role", role_encode(data.role)),
  ])
}

pub fn boolean_schema_decoder() {
  use default <- decode.optional_field(
    "default",
    None,
    decode.optional(decode.bool),
  )
  use description <- decode.optional_field(
    "description",
    None,
    decode.optional(decode.string),
  )
  use title <- decode.optional_field(
    "title",
    None,
    decode.optional(decode.string),
  )
  use type_ <- decode.field("type", decode.string)
  decode.success(BooleanSchema(
    default: default,
    description: description,
    title: title,
    type_: type_,
  ))
}

pub fn boolean_schema_encode(data: BooleanSchema) {
  utils.object([
    #("default", json.nullable(data.default, json.bool)),
    #("description", json.nullable(data.description, json.string)),
    #("title", json.nullable(data.title, json.string)),
    #("type", json.string(data.type_)),
  ])
}

pub fn jsonrpcrequest_decoder() {
  use id <- decode.field("id", request_id_decoder())
  use jsonrpc <- decode.field("jsonrpc", decode.string)
  use method_ <- decode.field("method", decode.string)
  use params <- decode.optional_field(
    "params",
    None,
    decode.optional(anon_8593718a_decoder()),
  )
  decode.success(Jsonrpcrequest(
    id: id,
    jsonrpc: jsonrpc,
    method_: method_,
    params: params,
  ))
}

pub fn jsonrpcrequest_encode(data: Jsonrpcrequest) {
  utils.object([
    #("id", request_id_encode(data.id)),
    #("jsonrpc", json.string(data.jsonrpc)),
    #("method", json.string(data.method_)),
    #("params", json.nullable(data.params, anon_8593718a_encode)),
  ])
}

pub fn model_hint_decoder() {
  use name <- decode.optional_field(
    "name",
    None,
    decode.optional(decode.string),
  )
  decode.success(ModelHint(name: name))
}

pub fn model_hint_encode(data: ModelHint) {
  utils.object([#("name", json.nullable(data.name, json.string))])
}

pub fn logging_level_decoder() {
  decode.string
}

pub fn logging_level_encode(data: LoggingLevel) {
  json.string(data)
}

pub fn list_tools_result_decoder() {
  use meta <- decode.optional_field(
    "_meta",
    None,
    decode.optional(decode.dict(decode.string, utils.any_decoder())),
  )
  use next_cursor <- decode.optional_field(
    "nextCursor",
    None,
    decode.optional(decode.string),
  )
  use tools <- decode.field("tools", decode.list(tool_decoder()))
  decode.success(ListToolsResult(
    meta: meta,
    next_cursor: next_cursor,
    tools: tools,
  ))
}

pub fn list_tools_result_encode(data: ListToolsResult) {
  utils.object([
    #("_meta", json.nullable(data.meta, utils.dict(_, utils.any_to_json))),
    #("nextCursor", json.nullable(data.next_cursor, json.string)),
    #("tools", json.array(_, tool_encode)(data.tools)),
  ])
}

pub fn call_tool_request_decoder() {
  use arguments <- decode.optional_field(
    "arguments",
    None,
    decode.optional(decode.dict(decode.string, utils.any_decoder())),
  )
  use name <- decode.field("name", decode.string)
  decode.success(CallToolRequest(arguments: arguments, name: name))
}

pub fn call_tool_request_encode(data: CallToolRequest) {
  utils.object([
    #(
      "arguments",
      json.nullable(data.arguments, utils.dict(_, utils.any_to_json)),
    ),
    #("name", json.string(data.name)),
  ])
}

pub fn enum_schema_decoder() {
  use description <- decode.optional_field(
    "description",
    None,
    decode.optional(decode.string),
  )
  use enum <- decode.field("enum", decode.list(decode.string))
  use enum_names <- decode.optional_field(
    "enumNames",
    None,
    decode.optional(decode.list(decode.string)),
  )
  use title <- decode.optional_field(
    "title",
    None,
    decode.optional(decode.string),
  )
  use type_ <- decode.field("type", decode.string)
  decode.success(EnumSchema(
    description: description,
    enum: enum,
    enum_names: enum_names,
    title: title,
    type_: type_,
  ))
}

pub fn enum_schema_encode(data: EnumSchema) {
  utils.object([
    #("description", json.nullable(data.description, json.string)),
    #("enum", json.array(_, json.string)(data.enum)),
    #("enumNames", json.nullable(data.enum_names, json.array(_, json.string))),
    #("title", json.nullable(data.title, json.string)),
    #("type", json.string(data.type_)),
  ])
}

pub fn logging_message_notification_decoder() {
  use data <- decode.field(
    "data",
    decode.new_primitive_decoder("Never", fn(_) {
      panic as "tried to decode a never decode value"
    }),
  )
  use level <- decode.field("level", logging_level_decoder())
  use logger <- decode.optional_field(
    "logger",
    None,
    decode.optional(decode.string),
  )
  decode.success(LoggingMessageNotification(
    data: data,
    level: level,
    logger: logger,
  ))
}

pub fn logging_message_notification_encode(data: LoggingMessageNotification) {
  utils.object([
    #("data", fn(_data) { panic as "never value cannot be encoded" }(data.data)),
    #("level", logging_level_encode(data.level)),
    #("logger", json.nullable(data.logger, json.string)),
  ])
}

pub fn prompt_decoder() {
  use meta <- decode.optional_field(
    "_meta",
    None,
    decode.optional(decode.dict(decode.string, utils.any_decoder())),
  )
  use arguments <- decode.optional_field(
    "arguments",
    None,
    decode.optional(decode.list(prompt_argument_decoder())),
  )
  use description <- decode.optional_field(
    "description",
    None,
    decode.optional(decode.string),
  )
  use name <- decode.field("name", decode.string)
  use title <- decode.optional_field(
    "title",
    None,
    decode.optional(decode.string),
  )
  decode.success(Prompt(
    meta: meta,
    arguments: arguments,
    description: description,
    name: name,
    title: title,
  ))
}

pub fn prompt_encode(data: Prompt) {
  utils.object([
    #("_meta", json.nullable(data.meta, utils.dict(_, utils.any_to_json))),
    #(
      "arguments",
      json.nullable(data.arguments, json.array(_, prompt_argument_encode)),
    ),
    #("description", json.nullable(data.description, json.string)),
    #("name", json.string(data.name)),
    #("title", json.nullable(data.title, json.string)),
  ])
}

pub fn prompt_message_decoder() {
  use content <- decode.field("content", content_block_decoder())
  use role <- decode.field("role", role_decoder())
  decode.success(PromptMessage(content: content, role: role))
}

pub fn prompt_message_encode(data: PromptMessage) {
  utils.object([
    #("content", content_block_encode(data.content)),
    #("role", role_encode(data.role)),
  ])
}
