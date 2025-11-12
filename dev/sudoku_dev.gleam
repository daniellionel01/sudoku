import gleam/erlang/process
import gleam/int
import gleam/option.{Some}
import shore
import shore/key
import shore/layout
import shore/style
import shore/ui
import sudoku

fn easy(i: String) {
  sudoku.from_pattern("
003020600
900305001
001806400
008102900
700000008
006708200
002609500
800203009
00501030" <> i)
  // i should be 0
}

pub fn main() {
  let board =
    0
    |> int.to_string
    |> easy
    |> sudoku.sudoku_to_string

  let exit = process.new_subject()
  let assert Ok(_actor) =
    shore.spec(
      init:,
      update:,
      view:,
      exit:,
      keybinds: shore.default_keybinds(),
      redraw: shore.on_timer(16),
    )
    |> shore.start
  exit |> process.receive_forever
}

type Model {
  Model(counter: Int)
}

fn init() -> #(Model, List(fn() -> Msg)) {
  let model = Model(counter: 0)
  let cmds = []
  #(model, cmds)
}

type Msg {
  Increment
  Decrement
}

fn update(model: Model, msg: Msg) -> #(Model, List(fn() -> Msg)) {
  case msg {
    Increment -> #(Model(counter: model.counter + 1), [])
    Decrement -> #(Model(counter: model.counter - 1), [])
  }
}

fn view(model: Model) -> shore.Node(Msg) {
  ui.box(
    [
      ui.text(
        "keybinds

i: increments
d: decrements
ctrl+x: exits
      ",
      ),
      ui.text(int.to_string(model.counter)),
      ui.br(),
      ui.row([
        ui.button("increment", key.Char("i"), Increment),
        ui.button("decrement", key.Char("d"), Decrement),
      ]),
    ],
    Some("counter"),
  )
  |> ui.align(style.Center, _)
  |> layout.center(style.Px(50), style.Px(12))
}
