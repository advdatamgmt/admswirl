# first line was
# center <- function(x, type) {
# now we provide default
center <- function(x, type = "mean") {
  switch(type,
         mean = mean(x),
         median = median(x),
         trimmed = mean(x, trim = 0.1))
}
