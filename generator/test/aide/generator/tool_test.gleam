import aide/generator
import aide/tool
import birdie
import oas/json_schema

pub fn simple_object_test() {
  let tools = [
    tool.Spec("flip", [json_schema.field("value", json_schema.boolean())], [
      json_schema.field("output", json_schema.boolean()),
    ]),
  ]
  let output = generator.generate(tools)
  birdie.snap(output, "simple_object_test")
}
