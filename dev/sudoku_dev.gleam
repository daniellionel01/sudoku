import gleam/erlang/process
import gleam/int
import gleam/io
import sudoku

const esc = "\u{001b}["

fn home() {
  io.print(esc <> "H")
}

fn clear_screen() {
  io.print(esc <> "2J")
}

fn clear_line() {
  io.print(esc <> "2K")
}

fn clear_below() {
  io.print(esc <> "J")
}

fn hide_cursor() {
  io.print(esc <> "?25l")
}

fn show_cursor() {
  io.print(esc <> "?25h")
}

fn wrap_off() {
  io.print(esc <> "?7l")
}

fn wrap_on() {
  io.print(esc <> "?7h")
}

fn alt_on() {
  io.print(esc <> "?1049h")
}

// optional, nicer UX
fn alt_off() {
  io.print(esc <> "?1049l")
}

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

fn draw_frame(i: Int) {
  let board =
    i
    |> int.to_string
    |> easy
    |> sudoku.sudoku_to_string

  home()
  wrap_off()

  clear_line()
  io.print("\r")
  io.print(board)
  clear_below()
  wrap_on()

  process.sleep(1000)
  draw_frame({ i + 1 } % 9)
}

pub fn main() {
  alt_on()
  hide_cursor()
  clear_screen()
  home()

  draw_frame(0)

  show_cursor()
  alt_off()
}
