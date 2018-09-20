# define a new x
x <- c(5, 0, 6, 8, 9, 7, 3, 4, 4, 7)

# define a function center that uses a switch
# statement - please note that the x above
# and the use of the name x below are NOT
# connected to each other - if all instances
# of x are changed to another name below then
# the function will still work in the same way
center <- function(x, type) {
  switch(type,
         mean = mean(x),
         median = median(x),
         trimmed = mean(x, trim = 0.1))
}
