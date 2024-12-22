# Current working directory must end with bevy_tdd_book

pwd <- getwd()

message(paste0("Current working directory: ", pwd))

if (!stringr::str_detect(pwd, "bevy_tdd_book$")) {
  stop("Run this script in the 'bevy_tdd_book' folder")
  if (1 == 2) {
    setwd("..")
  }
}

source("scripts/helper_functions.R")

# Have full path
chapter_filenames <- get_all_chapter_filenames()
if (length(chapter_filenames) == 0) {
  stop("No chapter filenames found")
}
testthat::expect_true(length(chapter_filenames) > 0)
testthat::expect_true(all(file.exists(chapter_filenames)))

# Only the markdown filename without any folder
md_files <- basename(chapter_filenames)

# The name of the chapters
chapter_names <- stringr::str_sub(md_files, end = -4)

message(paste0("Going up one folder"))

setwd("..")
pwd <- getwd()
message(paste0("Current working directory: ", pwd))

if (stringr::str_detect(pwd, "bevy_tdd_book$")) {
  stop(
    "ERROR: present working directory is still 'bevy_tdd_book'.\n", 
    "pwd: ", pwd
  )
}

testthat::expect_false(stringr::str_detect(pwd, "bevy_tdd_book$"))

args <- paste0("clone https://github.com/richelbilderbeek/bevy_tdd_book_", chapter_names)

for (arg in args) {
  system2(command = "git", args = arg)  
} 
