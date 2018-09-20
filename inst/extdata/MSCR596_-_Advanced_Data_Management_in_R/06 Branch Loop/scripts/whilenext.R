i <- 20
while(TRUE) {
  if(i < 5) break;
  if(i %% 2) {
    i <- i - 1
    next; # go to next iteration if odd
  }
  print(i)
  i <- i - 1
}
