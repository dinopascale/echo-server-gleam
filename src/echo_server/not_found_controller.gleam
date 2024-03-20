import gleam/bytes_builder
import gleam/http/response.{type Response}
import mist.{type ResponseData}

const base_response = "Not Found"

pub fn handle() -> Response(ResponseData) {
  response.new(404)
  |> response.set_body(
    base_response
    |> bytes_builder.from_string()
    |> bytes_builder.append_string("\n")
    |> mist.Bytes(),
  )
}
