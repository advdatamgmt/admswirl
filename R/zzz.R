.onLoad <- function(libname, pkgname) {
  library(swirl)
  install_course_directory(
    system.file("extdata/MSCR596_-_Advanced_Data_Management_in_R",
                package = "admswirl"))
}
