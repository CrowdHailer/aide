import aide/definitions
import gleam/dict
import gleam/dynamic/decode
import gleam/list
import gleam/option.{None, Some}
import oas/json_schema

fn cast_schema(args) {
  let #(required, properties) =
    list.map_fold(args, [], fn(acc, arg) {
      let #(name, schema, required) = arg
      let assert json_schema.Inline(schema) = schema

      let acc = case required {
        True -> [name, ..acc]
        False -> acc
      }
      #(acc, #(name, json_schema.to_fields(schema)))
    })
  definitions.AnonA5a007cd(
    type_: "object",
    properties: Some(dict.from_list(properties)),
    required: Some(required),
  )
}

pub fn set_title(tool, title) {
  definitions.Tool(..tool, title: Some(title))
}

pub fn set_description(tool, description) {
  definitions.Tool(..tool, description: Some(description))
}

/// The specification for an MCP tool.
///
/// This type cannot include the decoder as the decoders (and encoder) are generated from this spec.
/// The Tool type is the runtime type that includes the decoder.
pub type Spec {
  // Can't creat constant with dictionary so pass in list or input/output
  // I don't think that order matters for named arguments but maybe it will.
  Spec(
    name: String,
    title: String,
    description: String,
    input: ObjectSchema,
    output: ObjectSchema,
  )
}

/// The spec and decoder of an MCP tool.
///
/// Tools are defined with only a decoder because implementations of a tool can be sync or async.
/// See `aide/effect.Effect` for implementing tool handling.
pub type Tool(t) {
  Tool(spec: Spec, decoder: decode.Decoder(t))
}

pub fn to_api_definition(tool) {
  let Tool(spec:, ..) = tool
  definitions.Tool(
    meta: None,
    annotations: None,
    description: Some(spec.description),
    input_schema: cast_schema(spec.input),
    name: spec.name,
    output_schema: Some(cast_schema(spec.output)),
    title: Some(spec.title),
  )
}

pub type ObjectSchema =
  List(#(String, json_schema.Ref(json_schema.Schema), Bool))
// Add description etc to spec?
// Spec to definitions function in here
