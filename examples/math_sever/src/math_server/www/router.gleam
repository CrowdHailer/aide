import gleam/http
import gleam/http/request.{Request}
import math_server/www/mcp
import wisp

pub fn handle(request, context) {
  use <- wisp.log_request(request)
  let Request(method:, ..) = request
  echo request
  case wisp.path_segments(request), method {
    [], http.Get -> wisp.html_response("Check out our MCP server", 200)

    ["mcp"], _any -> mcp.handle(request, context)
    _, _ -> wisp.not_found()
  }
}
