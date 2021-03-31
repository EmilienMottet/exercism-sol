library(stringr)
two_fer <- function(input = "you") {
  str_interp("One for ${input}, one for me.")
}
