import aide/definitions
import gleam/dict
import gleam/list
import gleam/option.{None, Some}
import oas/json_schema

fn cast_input_schema(args) {
  let #(required, properties) = cast_schema(args)
  definitions.Internal5(
    type_: "object",
    properties: Some(dict.from_list(properties)),
    required: Some(required),
  )
}

fn cast_output_schema(args) {
  let #(required, properties) = cast_schema(args)
  definitions.Internal6(
    type_: "object",
    properties: Some(dict.from_list(properties)),
    required: Some(required),
  )
}

fn cast_schema(args) {
  list.map_fold(args, [], fn(acc, arg) {
    let #(name, schema, required) = arg
    let assert json_schema.Inline(schema) = schema

    let acc = case required {
      True -> [name, ..acc]
      False -> acc
    }
    #(acc, #(name, json_schema.to_fields(schema)))
  })
}

pub fn new(name, input_schema, output_schema) {
  definitions.Tool(
    name: name,
    title: None,
    description: None,
    input_schema: cast_input_schema(input_schema),
    output_schema: Some(cast_output_schema(output_schema)),
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

pub type Spec {
  // Can't creat constant with dictionary so pass in list or input/output
  // I don't think that order matters for named arguments but maybe it will.
  Spec(name: String, input: ObjectSchema, output: ObjectSchema)
}

pub type ObjectSchema =
  List(#(String, json_schema.Ref(json_schema.Schema), Bool))
