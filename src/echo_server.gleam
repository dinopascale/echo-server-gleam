import gleam/erlang/process
import mist
import echo_server/router
import echo_server/port

pub fn main() {
  router.router
  |> mist.new()
  |> mist.port(port.setup())
  |> mist.start_http

  process.sleep_forever()
}
