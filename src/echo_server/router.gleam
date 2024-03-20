import gleam/http/request.{type Request}
import gleam/http/response.{type Response}
import mist.{type Connection, type ResponseData}
import echo_server/echo_controller
import echo_server/not_found_controller

pub fn router(req: Request(Connection)) -> Response(ResponseData) {
  case request.path_segments(req) {
    ["echo"] -> echo_controller.handle(req)
    _ -> not_found_controller.handle()
  }
}
