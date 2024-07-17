# Current working directory must end with bevy_tdd_book

pwd <- getwd()

message(paste0("Current working directory: ", pwd))

if (!stringr::str_detect(pwd, "bevy_tdd_book$")) {
  stop("Run this script in the 'bevy_tdd_book' folder")
}

source("scripts/helper_functions.R")

md_files <- get_all_chapter_filenames()

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

superfolder_path <- pwd

testthat::expect_false(stringr::str_detect(superfolder_path, "bevy_tdd_book$"))

for (chapter_name in chapter_names) {
  chapter_path <- paste0(superfolder_path, "/bevy_tdd_book_", chapter_name)
  message(paste0("Set working directory to ", chapter_path))
  setwd(chapter_path)
  system2(command = "git", args = "add .")  
  system2(command = "git", args = "commit -m 'Before using cargo fmt'")  
  system2(command = "cargo", args = "fmt")  
  system2(command = "git", args = "add .")  
  system2(command = "git", args = "commit -m 'Use cargo fmt'")  
  system2(command = "git", args = "push")  
  setwd(superfolder_path)
}

