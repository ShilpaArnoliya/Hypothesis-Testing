# Hpothesis testing Q3

#Sales of products in four different regions is tabulated for males and females.
#Find if male-female buyer rations are similar across regions.

#Ans.
# Research Question: Is male-female buyer rations are similar across regions. (Ha)

# H0 : All proportion are not equal
# Ha : All proportion are equal

# Step 1 : Install and load the necessary libraries
# if not installed, install the following packages
# For chisq.test 
# install.packages("stats")
# import libraries into current session
library(stats)
## _______________________  End Step1  _______________________________________##

# Step 2 : Read the data from the input fil
x<-read.csv(file.choose()) 

View(x)
attach(x)

stacked_ratio<-stack(x)
View(stacked_ratio)
attach(stacked_ratio)
## _______________________  End Step2  _______________________________________##



# Step 3 Identify which test to perform
# Y discrete -> compare more than two populations -> chisquare test


# Step 4: Perform the chi square test

table(stacked_ratio)
View(table(stacked_ratio))
chisq.test(table(stacked_ratio))

#it will convert stacked data into table formate on which we can apply chi square test

#chisq.test(table(stack_ratio))
#if i apply above code it will change the count value which may give slight change  in p-value=0.2931 
#with error massage"Warning message:In chisq.test(table(stack_info)) :Chi-squared approximation may be
#incorrect"
#------------------------------------------------------------------------------------------------------
#so chisq.test() do not take character value of table it takes only numerical value so we need to
#remove column conataining male female

#so chisq.test() do not take character value of table it takes only numerical value so we need to
#remove column conataining male female
East_new<-x$East
West_new<-x$West
North_new<-x$North
South_new<-x$South
View(East_new, West_new, North_new,South_new)
t<-data.frame(East_new, West_new, North_new,South_new)
View(t)
chisq.test(t)


# H0 : All proportion are not equal
# Ha : All proportion are equal
# p-value = 0.6603 > 0.05  => p high Null fly => fail to reject Null hypothesis=> Accept null hypothesis
# CONCLUSION - All proportion are not equal 