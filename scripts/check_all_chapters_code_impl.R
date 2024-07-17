# Current working directory must end with bevy_tdd_book

pwd <- getwd()

if (!stringr::str_detect(pwd, "bevy_tdd_book$")) {
  stop("Run this script in the 'bevy_tdd_book' folder")
  if (1 == 2) {
    setwd("..")
  }
}

source("scripts/helper_functions.R")

/*
get_all_chapter_filenames <- function() {
  all_md_files <- list.files(pattern = "md")
  md_files <- stringr::str_subset(all_md_files, "[A-Z]", negate = TRUE) 
  md_files <- stringr::str_subset(md_files, "faq.md", negate = TRUE) 
  md_files <- stringr::str_subset(md_files, "definitions.md", negate = TRUE) 
  md_files <- stringr::str_subset(md_files, "introduction.md", negate = TRUE) 
  md_files <- stringr::str_subset(md_files, "functions.md", negate = TRUE) 
  md_files
}
*/

chapter_filenames <- get_all_chapter_filenames()


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

all_ok <- TRUE

for (chapter_filename in chapter_filenames) {
  # chapter_filename <- "add_camera.md"
  testthat::expect_true(file.exists(chapter_filename))
  
  chapter_name <- stringr::str_sub(chapter_filename, end = -4)

  app_code_filename <- paste0(getwd(), "_", chapter_name, "/src/app.rs")
  main_code_filename <- paste0(getwd(), "_", chapter_name, "/src/main.rs")

  if (!file.exists(app_code_filename)) {
    stop(paste0("ERROR: cannot find 'app_code_filename': ", app_code_filename))
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
      paste0("  mousepad ", chapter_filename, " ", app_code_filename, " ", main_code_filename)
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
  message(
    paste0("  mousepad ", chapter_filename, " ", app_code_filename, " ", main_code_filename)
  )
  message(" ")
}

if (!all_ok) {
  stop("Not all chapters had copy-pasted tested code") 
}
