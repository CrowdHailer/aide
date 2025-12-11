import math_server/www/router
import mist
import wisp/wisp_mist

pub fn start() {
  let context = Nil
  let secret_key_base = ""
  router.handle(_, context)
  |> wisp_mist.handler(secret_key_base)
  |> mist.new
  |> mist.bind("0.0.0.0")
  |> mist.port(8080)
  |> mist.start
}
