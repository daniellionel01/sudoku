import gleam/bool
import gleam/int
import gleam/list
import gleam/result
import gleam/string
import iv

pub fn solve(sudoku: Sudoku) -> Result(Sudoku, Nil) {
  todo
}

pub fn is_solved(sudoku: Sudoku) -> Bool {
  todo
}

/// Boxes are counted left to right, top to bottom, starting at 0.
///
/// ┌───────┬───────┬───────┐
/// │ . . . │ . . . │ . . . │
/// │ Box 0 │ Box 1 │ Box 2 │
/// │ . . . │ . . . │ . . . │
/// ├───────┼───────┼───────┤
/// │ . . . │ . . . │ . . . │
/// │ Box 3 │ Box 4 │ Box 5 │
/// │ . . . │ . . . │ . . . │
/// ├───────┼───────┼───────┤
/// │ . . . │ . . . │ . . . │
/// │ Box 6 │ Box 7 │ Box 8 │
/// │ . . . │ . . . │ . . . │
/// └───────┴───────┴───────┘
///
pub fn get_box(sudoku: Sudoku, n: Int) -> iv.Array(Int) {
  let row = n / 3
  let col = n % 3
  let idx = row * 27 + col * 3

  let assert Ok(row1) = iv.slice(sudoku.cells, start: idx, size: 3)
  let assert Ok(row2) = iv.slice(sudoku.cells, start: idx + 9, size: 3)
  let assert Ok(row3) = iv.slice(sudoku.cells, start: idx + 18, size: 3)

  iv.new()
  |> iv.concat(row1)
  |> iv.concat(row2)
  |> iv.concat(row3)
}

pub opaque type Sudoku {
  Sudoku(cells: iv.Array(Int))
}

pub fn from_pattern(pattern: String) -> Result(Sudoku, Nil) {
  let cells =
    pattern
    |> string.trim
    |> string.replace(each: "\n", with: "")
    |> string.replace(each: " ", with: "")
    |> string.replace(each: ".", with: "0")
    |> string.to_graphemes
    |> list.map(int.parse)
    |> result.values

  use <- bool.lazy_guard(when: !is_valid(cells), return: fn() { Error(Nil) })

  let cells = iv.from_list(cells)
  Ok(Sudoku(cells:))
}

pub fn to_string(sudoku: Sudoku) -> String {
  let assert [l1, l2, l3, l4, l5, l6, l7, l8, l9] =
    sudoku.cells
    |> iv.index_map(fn(l, i) {
      let l = case l {
        0 -> "."
        l -> int.to_string(l)
      }
      case { i + 1 } % 3 {
        0 -> l <> " │"
        1 -> " " <> l <> " "
        _ -> l <> " "
      }
    })
    |> iv.to_list
    |> list.sized_chunk(9)
    |> list.map(string.join(_, ""))

  let top_line = "┌───────┬───────┬───────┐"
  let bottom_line = "└───────┴───────┴───────┘"
  let middle_line = "├───────┼───────┼───────┤"

  [
    top_line,
    "│" <> l1,
    "│" <> l2,
    "│" <> l3,
    middle_line,
    "│" <> l4,
    "│" <> l5,
    "│" <> l6,
    middle_line,
    "│" <> l7,
    "│" <> l8,
    "│" <> l9,
    bottom_line,
  ]
  |> string.join("\n")
}

fn is_valid(pattern: List(Int)) -> Bool {
  do_check_character(pattern) && list.length(pattern) == 81
}

fn do_check_character(pattern: List(Int)) -> Bool {
  case pattern {
    [] -> True
    [digit, ..rest] if digit >= 0 && digit <= 9 -> do_check_character(rest)
    _ -> False
  }
}
