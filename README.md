# echo_server

Simple Echo server written with gleam, using mist as http server.

## How to

In a terminal start the server with

```bash
$ gleam run
```

then hit localhost:3000 with a POST request with plain text. Server should echoes exact same string

### Customize port

If you want to change default port (3000), you can setup a PORT env in your os. For example on Unix

```bash
$ PORT=8080 gleam run
```

## Development

```sh
gleam run   # Run the project
gleam test  # Run the tests
gleam shell # Run an Erlang shell
```
