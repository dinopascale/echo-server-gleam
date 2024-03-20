import gleam/erlang/os
import gleam/result
import gleam/int

const env_name = "PORT"

const default_port = 3000

pub fn setup() {
  os.get_env(env_name)
  |> result.map(int.parse)
  |> result.flatten
  |> result.unwrap(default_port)
}
