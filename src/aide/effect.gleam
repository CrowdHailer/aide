import aide/definitions
import gleam/bit_array
import gleam/dict.{type Dict}
import gleam/option.{None}
import oas/generator/utils

pub type Effect(return, tool, prompt) {
  Done(message: return)
  CallTool(
    tool: tool,
    resume: fn(Result(Dict(String, utils.Any), String)) -> return,
  )
  ReadResource(
    resource: definitions.Resource,
    resume: fn(ResourceContents) -> return,
  )
  GetPrompt(
    prompt: prompt,
    // There is no "is_error" field on GetPromptReply.
    resume: fn(List(definitions.PromptMessage)) -> return,
  )
}

pub type ResourceContents {
  TextContents(mime_type: String, text: String)
  BlobContents(mime_type: String, blob: BitArray)
}

pub fn resource_contents_to_result(uri, contents) {
  case contents {
    TextContents(mime_type:, text:) ->
      definitions.ReadResourceResult(meta: None, contents: [
        utils.Object(
          dict.from_list([
            #("uri", utils.String(uri)),
            #("text", utils.String(text)),
            #("mime_type", utils.String(mime_type)),
          ]),
        ),
      ])
    BlobContents(mime_type:, blob:) ->
      definitions.ReadResourceResult(meta: None, contents: [
        utils.Object(
          dict.from_list([
            #("uri", utils.String(uri)),
            #("blob", utils.String(bit_array.base64_encode(blob, False))),
            #("mime_type", utils.String(mime_type)),
          ]),
        ),
      ])
  }
}
