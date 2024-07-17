
get_all_chapter_filenames <- function() {
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
}
