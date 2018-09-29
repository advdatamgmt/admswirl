# Code placed in this file fill be executed every time the
      # lesson is started. Any variables created here will show up in
      # the user's working directory and thus be accessible to them
      # throughout the lesson.

swirl_options(swirl_logging = TRUE)

l <- list(a = c(3, 4, 5), b = c("dogs", "cats"))
y <- c(5, 0, 6, 8, 9, 7, 3, 4, 4, 7)
n5 <- 1:5
set.seed(596)
letsamp <- sample(LETTERS, 100, replace = TRUE)
cdsamp <- data.frame(subject = c(2005, 5005, 4002, 3003, 3002),
                     disease = c(1, 0, 1, 1, 1))
