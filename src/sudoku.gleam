import gleam/list
import gleam/string

pub opaque type Sudoku {
  Sudoku(pattern: String)
}

pub fn from_pattern(pattern: String) -> Sudoku {
  let pattern =
    pattern
    |> string.trim
    |> string.replace(each: "0", with: ".")
    |> string.replace(each: " ", with: "")
    |> string.replace(each: "\n", with: "")

  assert string.length(pattern) == 81

  Sudoku(pattern:)
}

pub fn sudoku_to_string(sudoku: Sudoku) -> String {
  let assert [l1, l2, l3, l4, l5, l6, l7, l8, l9] =
    sudoku.pattern
    |> string.split("")
    |> list.index_map(fn(l, i) {
      case { i + 1 } % 3 {
        0 -> l <> " |"
        1 -> " " <> l <> " "
        _ -> l <> " "
      }
    })
    |> list.sized_chunk(9)
    |> list.map(string.join(_, ""))

  let edge_line = "-------------------------"
  let middle_line = "|-------+-------+-------|"

  [
    edge_line,
    "|" <> l1,
    "|" <> l2,
    "|" <> l3,
    middle_line,
    "|" <> l4,
    "|" <> l5,
    "|" <> l6,
    middle_line,
    "|" <> l7,
    "|" <> l8,
    "|" <> l9,
    edge_line,
  ]
  |> string.join("\n")
}

pub fn solve() {
  todo
}
