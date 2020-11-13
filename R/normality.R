#' Check the normaility of date
#' There is three components of the test
#' The first part is to create to histogram with desnity polt
#' The second part is to  create a qqplot
#' The part is to run the Shapiro-Wilk normality test
#' @param data A number vector of data values
#' @param alpha=0.05 A double numeric value, which is the significance level used for the Shapiro-Wilk test of normality.
#' @param plotting=TRUE A logical argument indicating whether or not to print the histogram and qq-plot.
#' @param Verbose=TRUE A logical argument on whether or not to give the users some feedbacks.
#'
#' @example
#' normarlity_test(mtcars$mpg, alpha=0.05,plotting = TRUE,verbose=TRUE)
#'
#' @return A string that tells the users whether the data is normal is not by the Shapiro-Wilk normality test
#'
#' @export
#'
normarlity_test <- function(data,alpha=0.05,plotting = TRUE,verbose=TRUE) {

  if(any(is.na(data))) warning('There are missing values in your data. NAs will be omited in the follows steps')

  if (is.infinite(data)) stop("there is Inf value")

  if(verbose) message("Test in progress...")
  if(plotting == TRUE) {

    par(mfrow=c(1,2))

    #Histogram and Desity Plot
    hist(data,freq = FALSE,main = "Histogram and Density pLot",col="lightgray",na.rm=TRUE)
    lines(density(data,na.rm=TRUE),lty=1,col="red",lwd=2)

    #Normal density plot for comparison
    x<-c(round(min(data,na.rm = TRUE)):round(max(data,na.rm = TRUE)))
    lines(x,dnorm(x,mean(data,na.rm = TRUE),sd(data,na.rm = TRUE)),col="blue",lwd=2,lty=2)
    legend("topright", legend=c("Density", "Normality"),
           col=c("red", "blue"), lty=1:2, cex=0.8)

    #QQ plot
    qqnorm(data,main="QQ-plot",col="blue")
    qqline(data,lty=1,col="red",lwd=2)
  }


  #Shapiro-Wilk's method
  result <- shapiro.test(data)
  p_value <- result$p.value

  if(p_value>alpha){
    print(paste("You data is normal,because your p_value =",p_value,">",alpha))

  }else{
    print(paste("You data is not normal,because your p_value =",p_value,"<=",alpha))
  }
}
