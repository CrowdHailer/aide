# aide

Build Model Context Protocol (MCP) Servers (clients coming soon).

[![Package Version](https://img.shields.io/hexpm/v/aide)](https://hex.pm/packages/aide)
[![Hex Docs](https://img.shields.io/badge/hex-docs-ffaff3)](https://hexdocs.pm/aide/)

```sh
gleam add aide@1
```
```gleam
import aide

pub fn main() -> Nil {
  // TODO: An example of the project in use
}
```

Further documentation can be found at <https://hexdocs.pm/aide>.

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