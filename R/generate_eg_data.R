#' Generates a test benchmark dataset with varying degrees of wiggliness
#' 
#' @return data.frame with response column and explanatory variable x column with . It also contains a column truth which is the underlying function without added error. 
#' @importFrom stats dnorm rnorm
#' @export
#' @examples
#' test.data <- generate_eg_data()
#' plot(test.data$response~test.data$x, pch = 20)
#' lines(test.data$truth~test.data$x, col = 2, lwd = 1.5)
generate_eg_data <- function(){
  # Generate a function
  x <- seq(1, 100, length = 100)
  y <- dnorm(x, 0, 30)*75
  # Sin wave
  y.sin <- (sin(x/(0.5*pi))+20)/10-1.8
  # Logistic curve
  y.logistic <- 0.75/(1+exp(-0.2*(x-75)))
  y.combined <- y + y.sin*y.logistic*1.5
  # Add some error
  err <- rnorm(100, 0, 0.05)
  # Return the dataset
  data.frame(x = x, response = y+y.combined+err, truth = y+y.combined)
}

