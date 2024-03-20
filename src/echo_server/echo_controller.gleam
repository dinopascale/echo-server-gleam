import gleam/bytes_builder
import gleam/http/request.{type Request}
import gleam/http/response.{type Response}
import gleam/result
import mist.{type Connection, type ResponseData}

const max_content_size = 10_485_760

pub fn handle(request: Request(Connection)) -> Response(ResponseData) {
  let success_response = fn(req: Request(BitArray)) {
    let content_type =
      request
      |> request.get_header("content-type")
      |> result.unwrap("text/plain")

    response.new(200)
    |> response.set_body(
      req.body
      |> bytes_builder.from_bit_array()
      |> bytes_builder.append_string("\n")
      |> mist.Bytes(),
    )
    |> response.set_header("content-type", content_type)
  }

  let error_response = fn() {
    response.new(400)
    |> response.set_body(mist.Bytes(bytes_builder.new()))
  }

  request
  |> mist.read_body(max_content_size)
  |> result.map(success_response)
  |> result.lazy_unwrap(error_response)
}
