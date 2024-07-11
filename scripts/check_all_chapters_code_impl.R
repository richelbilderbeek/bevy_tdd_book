# Current working directory must end with bevy_tdd_book

pwd <- getwd()

if (!stringr::str_detect(pwd, "bevy_tdd_book$")) {
  stop("Run this script in the 'bevy_tdd_book' folder")
  if (1 == 2) {
    setwd("..")
  }
}

get_all_chapter_filenames <- function() {
  all_md_files <- list.files(pattern = "md")
  md_files <- stringr::str_subset(all_md_files, "[A-Z]", negate = TRUE) 
  md_files <- stringr::str_subset(md_files, "faq.md", negate = TRUE) 
  md_files <- stringr::str_subset(md_files, "functions.md", negate = TRUE) 
  md_files
  
}
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

for (chapter_filename in chapter_filenames) {
  # chapter_filename <- "add_camera.md"
  testthat::expect_true(file.exists(chapter_filename))
  
  chapter_name <- stringr::str_sub(chapter_filename, end = -4)
  message(paste0("chapter: ", chapter_name))

  code_filename <- paste0(getwd(), "_", chapter_name, "/src/app.rs")
  testthat::expect_true(file.exists(code_filename))
  
  chapter_code <- extract_all_code_from_chapter(chapter_filename)
  code <- readr::read_lines(code_filename)

  if (length(chapter_code) == 0) {
    message("No code in chapter yet")
    next
  }
  
  trimmed_chapter_code <- stringr::str_trim(chapter_code)
  trimmed_code <- stringr::str_trim(code)
  
  if (all(trimmed_chapter_code %in% trimmed_code)) {
    message("OK")
    next
  }
  
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
}
