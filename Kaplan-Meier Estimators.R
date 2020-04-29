# Use the survival library

library(survival)

# Read in the NetLixx data.

mydata <- read.csv('C:/Users/tahan/OneDrive/Desktop/Customer Churn/NetLixx.csv')
attach(mydata)
dim(mydata)
head(mydata)
summary(mydata)
tail(mydata)
mydata[10:20,]

# Create a "survival object" for each observation, using time and churn data.

mydata$survival <- Surv(time,churned == 1)

# Fit a basic survival curve using the data

fit <- survfit(survival ~ 1, data = mydata)
summary(fit)

# Plot the survival curve and add a title!

plot(fit,lty = 1, mark.time = FALSE,ylim=c(.75,1),xlab = 'Days since Subscribing', ylab = 'Percent Surviving')
title(main = 'NetLixx Survival Curve')

# Fit survival curves based on the female binary

fit <- survfit(survival ~ female, data = mydata)

# Plot the results, add a legend, add a title

plot(fit, col=c("red","blue"),ylim=c(.75,1), xlab = 'Days since Subscribing', ylab = 'Percent Surviving')
title(main = "NetLixx Survival Curves by Gender")
legend("topright",c("Male","Female"),lty=1,col=c("red","blue"))

# And run a log-rank test

survdiff(survival ~ female, data = mydata)

