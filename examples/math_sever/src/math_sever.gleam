import gleam/erlang/process
import math_server/www/server

pub fn main() -> Nil {
  let assert Ok(_) = server.start()
  process.sleep_forever()
}
