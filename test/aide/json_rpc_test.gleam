import aide
import gleam/json
import gleeunit/should

pub fn notification_decode_test() {
  json.parse(
    "{ \"method\": \"notifications/initialized\", \"jsonrpc\": \"2.0\" }",
    aide.request_decoder(),
  )
  |> should.be_ok
  |> echo
}
