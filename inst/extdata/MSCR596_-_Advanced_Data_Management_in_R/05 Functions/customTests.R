source(system.file("extdata/commonCustomTests.R", package = "admswirl"))

test_add2sub5 <- function() {
  try({
    func <- get('add2sub5', globalenv())
    tests <- c(
      identical(sapply(25:45, func), c(22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32,
                                       33, 34, 35, 36, 37, 38, 39, 40, 41, 42))
    )
    ok <- all(tests)
  }, silent = TRUE)
  exists('ok') && isTRUE(ok)
}

test_addysub5 <- function() {
  try({
    func <- get('addysub5', globalenv())
    assign("y", 2, envir = globalenv())
    tests <- c(
      identical(sapply(25:45, func), c(22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32,
                                       33, 34, 35, 36, 37, 38, 39, 40, 41, 42))
    )
    rm("y", envir = globalenv())
    ok <- all(tests)
  }, silent = TRUE)
  exists('ok') && isTRUE(ok)
}

test_add5 <- function() {
  try({
    func <- get('add5', globalenv())
    tests <- c(
      identical(sapply(25:45, func), 25:45 + 5)
    )
    ok <- all(tests)
  }, silent = TRUE)
  exists('ok') && isTRUE(ok)
}

test_cube <- function() {
  try({
    func <- get('cube', globalenv())
    tests <- c(
      identical(sapply(-5:5, func), (-5:5) ^ 3)
    )
    ok <- all(tests)
  }, silent = TRUE)
  exists('ok') && isTRUE(ok)
}
