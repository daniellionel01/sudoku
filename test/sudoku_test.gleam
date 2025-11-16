import birdie
import gleam/int
import gleam/list
import gleam/string
import gleeunit
import iv
import sudoku
import sudoku/patterns

pub fn main() -> Nil {
  gleeunit.main()
}

pub fn parse_easy_sudoku_test() {
  let easy_patterns = patterns.easy()
  let assert Ok(easy) = list.first(easy_patterns)
  easy
  |> sudoku.to_string
  |> birdie.snap(title: "the first easy sudoku is parsed successfully")
}

pub fn parse_hard_sudoku_test() {
  let hard_patterns = patterns.hard()
  let assert Ok(hard) = list.first(hard_patterns)
  hard
  |> sudoku.to_string
  |> birdie.snap(title: "the first hard sudoku is parsed successfully")
}

pub fn get_boxes_test() {
  let hard_patterns = patterns.hard()
  let assert Ok(hard) = list.first(hard_patterns)

  let box1 = sudoku.get_box(hard, 0)
  let box2 = sudoku.get_box(hard, 1)
  let box3 = sudoku.get_box(hard, 2)
  let box4 = sudoku.get_box(hard, 3)
  let box5 = sudoku.get_box(hard, 4)
  let box6 = sudoku.get_box(hard, 5)
  let box7 = sudoku.get_box(hard, 6)
  let box8 = sudoku.get_box(hard, 7)
  let box9 = sudoku.get_box(hard, 8)

  let text =
    "sudoku:\n"
    <> sudoku.to_string(hard)
    <> "\n\nbox 1: "
    <> string.join(list.map(iv.to_list(box1), int.to_string), ", ")
    <> "\nbox 2: "
    <> string.join(list.map(iv.to_list(box2), int.to_string), ", ")
    <> "\nbox 3: "
    <> string.join(list.map(iv.to_list(box3), int.to_string), ", ")
    <> "\nbox 4: "
    <> string.join(list.map(iv.to_list(box4), int.to_string), ", ")
    <> "\nbox 5: "
    <> string.join(list.map(iv.to_list(box5), int.to_string), ", ")
    <> "\nbox 6: "
    <> string.join(list.map(iv.to_list(box6), int.to_string), ", ")
    <> "\nbox 7: "
    <> string.join(list.map(iv.to_list(box7), int.to_string), ", ")
    <> "\nbox 8: "
    <> string.join(list.map(iv.to_list(box8), int.to_string), ", ")
    <> "\nbox 9: "
    <> string.join(list.map(iv.to_list(box9), int.to_string), ", ")

  birdie.snap(text, title: "boxes from first hard test are correctly extracted")
}
