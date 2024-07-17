# Current working directory must end with bevy_tdd_book

pwd <- getwd()

message(paste0("Current working directory: ", pwd))

if (!stringr::str_detect(pwd, "bevy_tdd_book$")) {
  stop("Run this script in the 'bevy_tdd_book' folder")
}



all_md_files <- list.files(pattern = "md")
md_files <- stringr::str_subset(all_md_files, "[A-Z]", negate = TRUE) 
md_files <- stringr::str_subset(md_files, "faq.md", negate = TRUE) 
md_files <- stringr::str_subset(md_files, "definitions.md", negate = TRUE) 
md_files <- stringr::str_subset(md_files, "introduction.md", negate = TRUE) 
md_files <- stringr::str_subset(md_files, "functions.md", negate = TRUE) 
md_files

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
