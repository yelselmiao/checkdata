
# We will test th model on a vector without NA values and a vector with NA values respectively In the first time, we
# will use the mpg column from the mtcars data. In the second test, we will use the Ozone column from the airquality
# dataset. The second test is to verify whether the NA filter (na.rm=TRUE) works well in our function.


##############################################################################
#Test 1

# Set up the expected output
expectation_1 <- function() {
  par(mfrow=c(1,2))

  hist(mtcars$mpg,freq = FALSE,main = "Histogram and Density pLot",col="lightgray")
  lines(density(mtcars$mpg),lty=1,col="red",lwd=2)

  x<-c(round(min(mtcars$mpg)):round(max(mtcars$mpg)))
  lines(x,dnorm(x,mean(mtcars$mpg),sd(mtcars$mpg)),col="blue",lwd=2,lty=2)

  qqnorm(mtcars$mpg,main="QQ-plot",col="blue")
  qqline(mtcars$mpg,lty=1,col="red",lwd=2)

  print("You data is normal,because your p_value = 0.122881358539443 > 0.05")
}

expected_output_1 <- expectation()

# Run the normarlity_test() function and save the to-be-tested object in "test_object"
test_object_1 <- suppressWarnings(
  normarlity_test(mtcars$mpg,alpha=0.05,plotting = TRUE,verbose=FALSE) )


# Testing
testthat::test_that("Test on a vector without NAs", {
  testthat::expect_equal(test_object_1,expected_output_1)
})

##############################################################################


#Test 2

# Set up the expected output
expectation_2 <- function() {
  par(mfrow=c(1,2))

  hist(airquality$Ozone,freq = FALSE,main = "Histogram and Density pLot",col="lightgray",na.rm=TRUE)
  lines(density(airquality$Ozone,na.rm=TRUE),lty=1,col="red",lwd=2)

  x<-c(round(min(airquality$Ozone,na.rm=TRUE)):round(max(airquality$Ozone,na.rm=TRUE)))
  lines(x,dnorm(x,mean(airquality$Ozone,na.rm=TRUE),sd(airquality$Ozone,na.rm=TRUE)),col="blue",lwd=2,lty=2)

  qqnorm(airquality$Ozone,main="QQ-plot",col="blue")
  qqline(airquality$Ozone,lty=1,col="red",lwd=2)

  print("You data is not normal,because your p_value = 2.78960157023717e-08 <= 0.05")
}

expected_output_2 <- expectation_2()

# Run the normarlity_test() function and save the to-be-tested object in "test_object"
test_object_2 <- normarlity_test(airquality$Ozone,alpha=0.05,plotting = TRUE,verbose=FALSE)


#Testing
testthat::test_that("Test on a vector with NAs", {
  testthat::expect_equal(test_object_1,expected_output_1)
})







