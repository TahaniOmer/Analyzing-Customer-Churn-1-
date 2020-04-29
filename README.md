# Analyzing-Customer-Churn-1


#### Non-parametric Survival Analysis: Kaplan-Meier Model



###	Understanding how long customers survives and what actions can help it survive longer

## Abstract

Any company operates on any type of Software as a Service or subscription model, can understand the importance of customer churn to your bottom line. When a customer leaves, you lose not only a recurring source of revenue, but also the marketing dollars you paid out to bring them in. As such, small changes in customer churn can easily bankrupt a profitable business or turn a slow-mover into a powerhouse. This paper is an illustrative example of study where tools of survival analysis are used, to analyze customer churn.

## Introduction

NetLixx, an online startup which maintains a library of guitar tabs for popular rock hits. Guitar enthusiasts can pay $5 a month for a subscription to their library, which lets them display the tabs on their computer, tablet, or phone while they rock out. After a year of hard work, they’ve got a working site, an extensive database of music, and a couple thousand customers.
But they’re also concerned. they’ve had a lot of people sign up for their service, but many seem to be quitting in only a couple of months. In this paper we will use the survival analysis technique, to know how long their customers are likely to stay with them, and whether customers with a certain demographic profile tend to churn more slowly.

## Approach
Kaplan-Meier estimators predict survival probabilities over a given period of time for “right-censored” data. “Right-censored” just means that some of the observations in the data weren’t observed for as long as the period the researcher is interested in analyzing. (For example, we want to look at a year of churn, but some of our customers signed up a month ago). Kaplan-Meier estimators reliably incorporate all available data at each individual time interval to estimate how many observations are still “surviving” at that time.
To do simple survival analysis using these estimators, we will set up our features as follow:


#### •	The dependent variable is duration (time to event or time to being censored) so it is a combination of time and event/censoring.

o	Time variable = The number of days between the day customer subscribed and the day they unsubscribed. Otherwise, it’s just the number of days between the day they subscribed and the day the data was pulled.

o	The event variable = a binary value indicating whether they’ve churned

#### •	The hazard rate is the probability that the customer has unsubscribed at time t given that the customer is at risk to unsubscribed at time t
#### •	Hazard rate usually change over time


## Method

To do simple survival analysis using nonparametric Kaplan-meier estimators. We used survival fit function in R-studio. Then we summarized the survival fit and we plot it, where on the x-axis we have the time and the y-axis we have the survival probability. following is the plot:

![1](https://user-images.githubusercontent.com/58350018/80559264-9eca8080-89a2-11ea-9df9-715e2dd9db7a.png)

 
The line in the middle of the plot represents the best estimate of the percent of customers surviving at each time interval. The dashed lines represent a 95% confidence interval. The confidence interval spreads out as we get closer to 365 days, since we have less and less customers with that much data to work with.

## Log-Rank test 
Knowing how fast our customers churn is all well and good, but what we’re really interested in is understanding and analyzing churn.
We will create different Kaplan-Meier survival curves for each gender, then the statistical significance of the differences can be tested in many ways, including the Log-Rank test, which we’ll apply below:


![2](https://user-images.githubusercontent.com/58350018/80559834-8a878300-89a4-11ea-81e5-ee6f6737def2.png)


![3](https://user-images.githubusercontent.com/58350018/80559840-8fe4cd80-89a4-11ea-998e-c652725a4aed.jpg)


 
 

To perform the log-rank test we used servdiff function, we provide the survival object and the grouping variable, what we get in return as we can see chi-squre and p-value which is 0.0004 indicating that the difference between men and women in survival  all the time is highly significant.


## Conclusion

We have completed a simple survival analysis, the results as follow:
The survival carve plot indicate that they can expect about 75% of our customers to make it through their first year with them.
Their female customers sticking with them much longer than their male customer. 
Maybe they should do a survey to see why men don’t like their business as much. Or, perhaps, they should start marketing towards women so they can attract loyal customers. 

This is all very basic analysis. We’ll be getting a lot more complex in future papers. Future work includes: 
#### •	Cox Regression analysis to model churn on multiple explanatory variables
#### •	Restricted Mean Survival Time analysis to understand how churn impacts revenue
#### •	Pseudo-Observation creation, so we can do vanilla stats on restricted survival times (and revenue!)
