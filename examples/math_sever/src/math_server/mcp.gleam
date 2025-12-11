import aide
import aide/effect
import aide/tool
import gleam/dict
import gleam/dynamic/decode
import gleam/result
import math_server/math
import oas/generator/utils
import oas/json_schema

pub fn handle(mcp_request, server) {
  case aide.handle_rpc(mcp_request, server) {
    effect.Done(result) -> result
    effect.CallTool(tool:, resume:) -> resume(call_tool(tool))
    effect.ReadResource(resource:, resume:) -> resume(read_resource(resource))
    effect.GetPrompt(prompt:, resume:) -> resume(get_prompt(prompt))
    effect.Complete(ref:, argument:, context:, resume:) ->
      resume(complete(ref, argument, context))
  }
}

pub type Tool {
  Random
  Add(Int, Int)
}

pub fn tools() {
  [
    tool.Tool(
      spec: tool.Spec(
        name: "random",
        title: "Generate Random",
        description: "Generate a random number between two numbers",
        input: [],
        output: [json_schema.field("number", json_schema.integer())],
      ),
      decoder: decode.success(Random),
    ),
    tool.Tool(
      spec: tool.Spec(
        name: "add",
        title: "Add",
        description: "Add two numbers",
        input: [
          json_schema.field("x", json_schema.integer()),
          json_schema.field("y", json_schema.integer()),
        ],
        output: [json_schema.field("sum", json_schema.integer())],
      ),
      decoder: {
        use x <- decode.field("x", decode.int)
        use y <- decode.field("y", decode.int)
        decode.success(Add(x, y))
      },
    ),
  ]
}

fn call_tool(tool) {
  case tool {
    Random -> {
      use number <- result.map(math.random())
      dict.from_list([#("number", utils.Integer(number))])
    }
    Add(x, y) -> {
      use number <- result.map(math.add(x, y))
      dict.from_list([#("number", utils.Integer(number))])
    }
  }
}

fn read_resource(_resource) {
  effect.TextContents(mime_type: "text/plain", text: "not implemented")
}

fn get_prompt(_prompt) {
  []
}

fn complete(_ref, _argument, _context) {
  []
}
