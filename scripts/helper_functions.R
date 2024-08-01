
get_all_chapter_filenames <- function() {
  if (!stringr::str_detect(getwd(), "bevy_tdd_book$")) {
    stop("Run this script in the 'bevy_tdd_book' folder")
  }

  all_md_files <- list.files(pattern = "md", path = "docs/chapters", full.names = TRUE)
  
  # Remove some files that are not in chapters
  # Check that they exist
  
  # md_files <- stringr::str_subset(all_md_files, "faq.md", negate = TRUE) 
  # testthat::expect_equal(length(all_md_files)- 1, length(md_files))
  
  # md_files <- stringr::str_subset(md_files, "definitions.md", negate = TRUE) 
  # testthat::expect_equal(length(all_md_files)- 2, length(md_files))
  
  # md_files <- stringr::str_subset(md_files, "introduction.md", negate = TRUE) 
  # testthat::expect_equal(length(all_md_files)- 3, length(md_files))
  
  # md_files <- stringr::str_subset(md_files, "functions.md", negate = TRUE) 
  # testthat::expect_equal(length(all_md_files)- 4, length(md_files))
  
  all_md_files
}
