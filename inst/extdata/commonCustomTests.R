# Put custom tests in this file.

# Uncommenting the following line of code will disable
# auto-detection of new variables and thus prevent swirl from
# executing every command twice, which can slow things down.

# AUTO_DETECT_NEWVAR <- FALSE

# However, this means that you should detect user-created
# variables when appropriate. The answer test, creates_new_var()
# can be used for for the purpose, but it also re-evaluates the
# expression which the user entered, so care must be taken.

# Get the swirl state
getState <- function(){
  # Whenever swirl is running, its callback is at the top of its call stack.
  # Swirl's state, named e, is stored in the environment of the callback.
  environment(sys.function(1))$e
}

getVal <- function(){
  getState()$val
}

getExpr <- function(){
  getState()$expr
}

# Retrieve the log from swirl's state
getLog <- function(){
  getState()$log
}


expr_uses_function <- function(f) {
  expr <- getExpr()
  func <- trimws(f)
  results <- swirl:::expectThat(expr, swirl:::uses_func(f, label = f),
                        label = deparse(expr))
  return(results$passed)
}

is_logical_vector <- function() {
  v <- getVal()
  length(v) > 1 && is.logical(v)
}

is_testing_vector_type <- function() {
  (expr_uses_function('is.numeric') ||
    expr_uses_function('is.logical') ||
    expr_uses_function('is.character')) &&
    expr_uses_function('c')
}

submit_log <- function(assign_id) {

  # Please edit the link below
  pre_fill_link <- "https://docs.google.com/forms/d/e/1FAIpQLSc-1D6a7mGA6nS3YQGiMpCLrFBbsPWz-CCh0Ua8dZHJfkAXCQ/viewform?usp=pp_url&entry.1317275434"

  # Do not edit the code below
  if(!grepl("=$", pre_fill_link)){
    pre_fill_link <- paste0(pre_fill_link, "=")
  }

  p <- function(x, p, f, l = length(x)){if(l < p){x <- c(x, rep(f, p - l))};x}

  temp <- tempfile("swirl", fileext = ".csv")
  log_ <- getLog()
  nrow_ <- max(unlist(lapply(log_, length)))
  log_tbl <- data.frame(user = rep(log_$user, nrow_),
                        course_name = rep(log_$course_name, nrow_),
                        lesson_name = rep(log_$lesson_name, nrow_),
                        question_number = p(log_$question_number, nrow_, NA),
                        correct = p(log_$correct, nrow_, NA),
                        attempt = p(log_$attempt, nrow_, NA),
                        skipped = p(log_$skipped, nrow_, NA),
                        datetime = p(log_$datetime, nrow_, NA),
                        stringsAsFactors = FALSE)
  write.csv(log_tbl, file = temp, row.names = FALSE)
  encoded_log <- base64encode(temp)
  #browseURL(paste0(pre_fill_link, encoded_log))
  set_canvas_domain("https://canvas.emory.edu")
  try(submit_file_upload_assignment(123061, assign_id, "self", temp))
  cat("Scroll back up and see if you submission was successful\n",
      "or if there was an error.\n",
      "If your submission did not work for any reason, please cut and paste\n",
      "the following and email to the professor in Canvas:\n",
      "filename = ", temp, "\n",
      "submission = read_csv(rawToChar(base64decode(\"", encoded_log, "\")))\n",
      sep = "")
}

