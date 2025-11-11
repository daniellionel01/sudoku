import gleam/io
import sudoku

fn easy() {
  sudoku.from_pattern(
    "
003020600
900305001
001806400
008102900
700000008
006708200
002609500
800203009
005010300
",
  )
}

pub fn main() {
  sudoku.sudoku_to_string(easy())
  |> io.println
}
