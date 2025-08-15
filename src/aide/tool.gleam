import aide/definitions
import gleam/dict
import gleam/option.{None, Some}
import oas/json_schema

fn cast_input_schema(args) {
  let properties =
    dict.map_values(args, fn(_label, schema) { json_schema.to_fields(schema) })
  definitions.Internal5(
    type_: "object",
    properties: Some(properties),
    required: Some(dict.keys(args)),
  )
}

pub fn new(name, input_schema) {
  definitions.Tool(
    name: name,
    title: None,
    description: None,
    input_schema: cast_input_schema(input_schema),
    output_schema: None,
    meta: None,
    annotations: None,
  )
}

pub fn set_title(tool, title) {
  definitions.Tool(..tool, title: Some(title))
}

pub fn set_description(tool, description) {
  definitions.Tool(..tool, description: Some(description))
}
