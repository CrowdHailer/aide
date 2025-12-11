# aide

Build Model Context Protocol (MCP) Servers (clients coming soon).

[![Package Version](https://img.shields.io/hexpm/v/aide)](https://hex.pm/packages/aide)
[![Hex Docs](https://img.shields.io/badge/hex-docs-ffaff3)](https://hexdocs.pm/aide/)

## Install

```sh
gleam add aide
```

## Usage

### Build a Server

This guide explains building an MCP server with some simple maths tools. See [examples/math_server](examples/math_server) for the completed code.

Aide only supports building remote servers, not a problem as these can be used locally by directing your client to `localhost:<port>`. From this point when we say MCP Server we implicitly mean Remote Server.

#### 1. Mounting an MCP server

An MCP server is a a single endpoint that accepts a JSON-RPC request and returns a JSON-RPC response.
This endpoint can be hosted on it's own or as part of a larger application.
Any choice of web server is valid.
This guide assume a wisp server.

A common approah to routing in wisp is to have a router module that pattern matches on path and method.
The route serving mcp is `/mcp`, not it needs to handle all methods.

```gleam
// math_server/www/router
import gleam/http
import gleam/http/request.{Request}
import math_server/www/mcp
import wisp

pub fn handle(request, context) {
  use <- wisp.log_request(request)
  let Request(method:, ..) = request
  case wisp.path_segments(request), method {
    [], http.Get -> wisp.html_response("Check out our MCP server", 200)

    ["mcp"], _any -> mcp.handle(request, context)
    _, _ -> wisp.not_found()
  }
}
```

#### 2. Handle JSON RPC

The MCP protocol builds on JSON RPC, again the aide library lets you choose your own approach to JSON decoding.

The `handle` function in the `math_server/www/mcp` module encapsulates decoding to MCP specific types, including decoding your applications specific tool types.

The handling of the mcp requests is another `handle` function defined in the module `math_server/mcp`.
Separating `math_server/www/mcp` and `math_server/mcp` allows for the same server to be used with other transports.

```gleam
// math_server/www/mcp
import aide
import aide/definitions
import gleam/dynamic/decode
import gleam/http
import gleam/http/request.{Request}
import gleam/json
import gleam/option.{Some}
import gleam/string
import math_server/mcp
import wisp

pub fn handle(request, context) {
  let Request(method:, ..) = request
  case method {
    http.Delete -> wisp.no_content()
    http.Post -> {
      // decode input to a MCP request
      use mcp_request <- decode_json(request, aide.request_decoder())

      // create an mcp server config.
      // In this example the server is the same for all users, but if different tools are required for different users,
      // this is where you would create a user specific server.
      let server = server(context)

      // handle mcp request in the mcp module
      mcp.handle(mcp_request, server)
      // encode the response and return it
      |> option.map(aide.response_encode)
      |> option.map(json.to_string)
      |> option.map(wisp.json_response(_, 200))
      |> option.unwrap(wisp.response(202))
    }
    _ -> wisp.method_not_allowed([http.Post, http.Delete])
  }
}

fn decode_json(request, decoder, then) {
  use data <- wisp.require_json(request)
  case decode.run(data, decoder) {
    Ok(value) -> then(value)
    Error(reason) -> wisp.bad_request(string.inspect(reason))
  }
}

fn server(_context) {
  aide.Server(
    implementation: definitions.Implementation(
      name: "math_server",
      version: "0.1.0",
      title: Some("Math Server"),
    ),
    tools: mcp.tools(),
    resources: [],
    resource_templates: [],
    prompts: [],
  )
}

```

This server has the same tools for all users.

### 3. Implement server functionality.

Now we get to the business end of our MCP server.

Aide chooses an continuation passing style to implement the server functionality.
*This makes supporting JavaScript and BEAM runtimes easier.*
The details don't matter here as our example doesn't require promise or result types.

In the this snippet `call_tool`, `read_resource`, `get_prompt` and `complete` are all functions we need to implement.
As this server only implements tools we can create noop versions of all functions but `call_tool`.

```gleam
// math_server/mcp
import aide
import aide/effect
import aide/tool
import gleam/dict
import gleam/dynamic/decode
import gleam/int
import gleam/result
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

// continued in Implement tools
```

### 4. Implement tools

We need to implement the tools we want to expose to the client.
A tool in MCP has a specification and a decoder to decode the input from the client.
The specification is used to generate the OpenAPI schema for the tool, that the LLM will understand.

**Check out aide_generate to create encoders/decoders from the tool input/output schemas.**

MCP requires that input and output are objects.
There for the input/output schemas expect a list of json_schema fields, so you can't accidentally specify an invalid schema.

```gleam
// ...
// math_server/mcp

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
```

## Development

```sh
gleam test 
```

#### MCP definitions

The module `aide/definitions` is generated from a JSON Schema specification, maintained by the MCP project.
To run the generation run.

```
gleam run dev
```

OAS doesn't support list of types.

- type is changed to `true` on additionalProperties on ElicitResult
- RequestId is `true`
- ProgressToken is `true`

The `Request` type is not referenced anywhere in the definitions, but is used to specify a JSON RPC request
Most other `XRequest` definitions are a contant and parameters


# MCP

Model context protocol should allow for easy access from chats to tools and resources.
This doesn't seem to be the case so far.

## Claude

Seems to ignore `structured_content` field in response and only use `conent`

## Mistral

Connectors are limited to Gmail and Google Calendar for Free and Pro.
There is no mention of custom connectors, although no details are shared about the enterprise level.

## OpenAI

Needs a Pro or Team Plan 

https://aaronparecki.com/articles

## Credit

Created for [EYG](https://eyg.run/), a new integration focused programming language.