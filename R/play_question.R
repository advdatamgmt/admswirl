#' @import swirl
#' @export
do_play.play_question <- function(e) {
  e$playing <- TRUE
}

#' @import swirl
#' @export
do_nxt.play_question <- function(e) {
  # resets environment to 'default' and does not
  # start the question over like the 'default' version
  if (length(e$snapshot) > 0)
    swirl:::xfer(as.environment(e$snapshot), globalenv())
  swirl:::swirl_out(swirl:::`%N%`(swirl:::s(), "Resuming lesson..."))
  class(e) <- c("environment", "default")
  e$playing <- FALSE
}

#' @import swirl
#' @export
waitUser.play_question <- function(current.row, e) {
  e$prompt <- TRUE
  e$iptr <- 1 + e$iptr
  # now when we use nxt() it will call nxt.play_question
  class(e) <- c("environment", "play_question")
  swirl:::do_play(e)
}

#' @import swirl
#' @export
testResponse.play_question <- function(current.row, e) {
  # act like it was answered correctly
  e$row <- e$row + 1
  e$iptr <- 1
  e$attempts <- 1
  e$skipped <- FALSE
}
