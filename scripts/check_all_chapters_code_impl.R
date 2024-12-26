# Current working directory must end with bevy_tdd_book

pwd <- getwd()

if (!stringr::str_detect(pwd, "bevy_tdd_book$")) {
  stop("Run this script in the 'bevy_tdd_book' folder")
  if (1 == 2) {
    setwd("..")
  }
}

source(file.path("scripts/helper_functions.R"))

chapter_filenames <- get_all_chapter_filenames()
if (length(chapter_filenames) == 0) {
  stop("No chapter filenames found")
}
testthat::expect_true(length(chapter_filenames) > 0)


#' Returns a vector of booleans whether a line is code
is_line_code <- function(lines) {
  lines
  n_lines <- length(lines)
  is_code <- rep(FALSE, n_lines)
  is_now_code <- FALSE
  for (i in seq_along(lines)) {
    if (lines[i] == "```rust") {
      is_now_code <- TRUE
      next
    }
    if (lines[i] == "```") {
      is_now_code <- FALSE
      next
    }
    if (is_now_code) is_code[i] <- TRUE
  }
  is_code
}

#' Returns all the code that is present in a chapter
extract_all_code_from_chapter <- function(chapter_filename) {
  testthat::expect_true(file.exists(chapter_filename))
  lines <- readr::read_lines(chapter_filename)
  code <- lines[is_line_code(lines)]
  code
}

#' On GHA the filenames suggested do not work on a local computer
convert_gha_filename_to_local <- function(filename) {
  stringr::str_replace_all(
    filename, 
    "/home/runner/work/bevy_tdd_book/bevy_tdd_book/working_folder",
    "/home/richel/GitHubs"
  )
}


  # mousepad docs/chapters/add_camera.md /home/runner/work/bevy_tdd_book/bevy_tdd_book/working_folder/bevy_tdd_book_add_camera/src/app.rs /home/runner/work/bevy_tdd_book/bevy_tdd_book/working_folder/bevy_tdd_book_add_camera/src/main.rs
  # mousepad docs/chapters/add_camera.md /home/richel/GitHubs/bevy_tdd_book_add_camera/src/app.rs /home/richel/GitHubs/bevy_tdd_book_add_camera/src/main.rs

testthat::expect_equal(
  convert_gha_filename_to_local("/home/runner/work/bevy_tdd_book/bevy_tdd_book/working_folder/bevy_tdd_book_add_camera/src/app.rs"),
  "/home/richel/GitHubs/bevy_tdd_book_add_camera/src/app.rs"
)
testthat::expect_equal(
  convert_gha_filename_to_local("/home/runner/work/bevy_tdd_book/bevy_tdd_book/working_folder/bevy_tdd_book_add_camera/src/main.rs"),
  "/home/richel/GitHubs/bevy_tdd_book_add_camera/src/main.rs"
)
testthat::expect_equal(
  convert_gha_filename_to_local("/home/runner/work/bevy_tdd_book/bevy_tdd_book/working_folder/bevy_tdd_book_add_player_sprite_with_texture/src/app.rs"),
  "/home/richel/GitHubs/bevy_tdd_book_add_player_sprite_with_texture/src/app.rs"
)


  

all_ok <- TRUE

for (chapter_filename in chapter_filenames) {
  # chapter_filename <- "add_camera.md"
  testthat::expect_true(file.exists(chapter_filename))
  
  md_filename <- basename(chapter_filename)
  chapter_name <- stringr::str_sub(md_filename, end = -4)

  app_code_filename <- paste0(getwd(), "_", chapter_name, "/src/app.rs")
  main_code_filename <- paste0(getwd(), "_", chapter_name, "/src/main.rs")

  if (!file.exists(app_code_filename)) {
    stop(
      paste0(
        "ERROR: cannot find 'app_code_filename': ", app_code_filename, " \n",
        "chapter_filename: ", chapter_filename, "\n",
        "md_filename: ", md_filename
      )
    )
  }
  if (!file.exists(main_code_filename)) {
    stop(paste0("ERROR: cannot find 'main_code_filename': ", main_code_filename))
  }
  testthat::expect_true(file.exists(app_code_filename))
  testthat::expect_true(file.exists(main_code_filename))
  
  chapter_code <- extract_all_code_from_chapter(chapter_filename)
  app_code <- readr::read_lines(app_code_filename)
  main_code <- readr::read_lines(main_code_filename)
  code <- c(app_code, main_code, "// ...")
  
  if (length(chapter_code) == 0) {
    all_ok <- FALSE
    message(paste0("chapter: ", chapter_name))
    message("No code in chapter yet")
    message("  Tip: run the following line:")
    message(" ")
    message(
      paste0("  mousepad ", chapter_filename, " ",
        convert_gha_filename_to_local(app_code_filename), " ",
        convert_gha_filename_to_local(main_code_filename)
      )
    )
    message(" ")
    next
  }
  
  trimmed_chapter_code <- stringr::str_trim(chapter_code)
  trimmed_code <- stringr::str_trim(code)
  
  if (all(trimmed_chapter_code %in% trimmed_code)) {
    next
  }
  
  all_ok <- FALSE

  message(paste0("chapter: ", chapter_name))
  message(
    paste0(
      "ERROR: ",
      sum(!trimmed_chapter_code %in% trimmed_code), 
      "x line found in chapter, but not in code"
    )
  )
  missing_lines <- trimmed_chapter_code[!trimmed_chapter_code %in% trimmed_code]
  for (i in seq_along(missing_lines)) {
    message(paste0(i, ": ", missing_lines[i]))
  }
  message(" ")
  message("  Tip: run the following line:")
  message(" ")
  # mousepad docs/chapters/add_camera.md /home/runner/work/bevy_tdd_book/bevy_tdd_book/working_folder/bevy_tdd_book_add_camera/src/app.rs /home/runner/work/bevy_tdd_book/bevy_tdd_book/working_folder/bevy_tdd_book_add_camera/src/main.rs
  # mousepad docs/chapters/add_camera.md /home/richel/GitHubs/bevy_tdd_book_add_camera/src/app.rs /home/richel/GitHubs/bevy_tdd_book_add_camera/src/main.rs
  message(
    paste0("  mousepad ", chapter_filename, " ", app_code_filename, " ", main_code_filename)
  )
  message(" ")
}

if (!all_ok) {
  stop("Not all chapters had copy-pasted tested code") 
}
