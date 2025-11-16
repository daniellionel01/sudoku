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

pub fn get_rows_test() {
  let hard_patterns = patterns.hard()
  let assert Ok(hard) = list.first(hard_patterns)

  let row1 = sudoku.get_row(hard, 0)
  let row2 = sudoku.get_row(hard, 1)
  let row3 = sudoku.get_row(hard, 2)
  let row4 = sudoku.get_row(hard, 3)
  let row5 = sudoku.get_row(hard, 4)
  let row6 = sudoku.get_row(hard, 5)
  let row7 = sudoku.get_row(hard, 6)
  let row8 = sudoku.get_row(hard, 7)
  let row9 = sudoku.get_row(hard, 8)

  let text =
    "sudoku:\n"
    <> sudoku.to_string(hard)
    <> "\nrow 1: "
    <> string.join(list.map(iv.to_list(row1), int.to_string), ", ")
    <> "\nrow 2: "
    <> string.join(list.map(iv.to_list(row2), int.to_string), ", ")
    <> "\nrow 3: "
    <> string.join(list.map(iv.to_list(row3), int.to_string), ", ")
    <> "\nrow 4: "
    <> string.join(list.map(iv.to_list(row4), int.to_string), ", ")
    <> "\nrow 5: "
    <> string.join(list.map(iv.to_list(row5), int.to_string), ", ")
    <> "\nrow 6: "
    <> string.join(list.map(iv.to_list(row6), int.to_string), ", ")
    <> "\nrow 7: "
    <> string.join(list.map(iv.to_list(row7), int.to_string), ", ")
    <> "\nrow 8: "
    <> string.join(list.map(iv.to_list(row8), int.to_string), ", ")
    <> "\nrow 9: "
    <> string.join(list.map(iv.to_list(row9), int.to_string), ", ")

  birdie.snap(text, title: "rows from first hard test are correctly extracted")
}

pub fn get_columns_test() {
  let hard_patterns = patterns.hard()
  let assert Ok(hard) = list.first(hard_patterns)

  let col1 = sudoku.get_col(hard, 0)
  let col2 = sudoku.get_col(hard, 1)
  let col3 = sudoku.get_col(hard, 2)
  let col4 = sudoku.get_col(hard, 3)
  let col5 = sudoku.get_col(hard, 4)
  let col6 = sudoku.get_col(hard, 5)
  let col7 = sudoku.get_col(hard, 6)
  let col8 = sudoku.get_col(hard, 7)
  let col9 = sudoku.get_col(hard, 8)

  let text =
    "sudoku:\n"
    <> sudoku.to_string(hard)
    <> "\ncol 1: "
    <> string.join(list.map(iv.to_list(col1), int.to_string), ", ")
    <> "\ncol 2: "
    <> string.join(list.map(iv.to_list(col2), int.to_string), ", ")
    <> "\ncol 3: "
    <> string.join(list.map(iv.to_list(col3), int.to_string), ", ")
    <> "\ncol 4: "
    <> string.join(list.map(iv.to_list(col4), int.to_string), ", ")
    <> "\ncol 5: "
    <> string.join(list.map(iv.to_list(col5), int.to_string), ", ")
    <> "\ncol 6: "
    <> string.join(list.map(iv.to_list(col6), int.to_string), ", ")
    <> "\ncol 7: "
    <> string.join(list.map(iv.to_list(col7), int.to_string), ", ")
    <> "\ncol 8: "
    <> string.join(list.map(iv.to_list(col8), int.to_string), ", ")
    <> "\ncol 9: "
    <> string.join(list.map(iv.to_list(col9), int.to_string), ", ")

  birdie.snap(
    text,
    title: "columns from first hard test are correctly extracted",
  )
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

pub fn correct_sets_test() {
  assert False == sudoku.correct_set(iv.from_list([]))
  assert False == sudoku.correct_set(iv.from_list([1, 0, 3, 4, 5, 6, 0, 8, 9]))
  assert True == sudoku.correct_set(iv.from_list([1, 2, 3, 4, 5, 6, 7, 8, 9]))
  assert True == sudoku.correct_set(iv.from_list([3, 2, 6, 5, 9, 1, 4, 8, 7]))
}

pub fn is_solved_test() {
  let hard_patterns = patterns.hard()
  let assert Ok(hard) = list.first(hard_patterns)
  assert False == sudoku.is_solved(hard)

  assert True == sudoku.is_solved(patterns.solved())
}
