for(i in 1:5) {
  assign(paste0("cholera", i), cholera_merge[cholera_merge$area == i, ])
}
