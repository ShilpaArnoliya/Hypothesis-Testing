# hypothesis assnment Q 1

# A F&B manager wants to determine whether there is any significant difference in the diameter 
# of the cutlet between two units. A randomly selected sample of cutlets was collected from both
# units and measured? Analyze the data and draw inferences at 5% significance level. 
# Please state the assumptions and tests that you carried out to check validity of the assumptions.


#ANS. 
# here input(x) = unit.A & unit.B
#output (y) = significant difference in diameter = cont.
# Research Question:is there any significant difference in the diameter 
# of the cutlet between two units? (Ha)
# H0 : unit.A = unit.B
# Ha : unit.A =/= unit.B

# Step 1 : Install and load the necessary libraries
# if not installed, install the following packages
# For shapiro test for Normality & var.test for variance
install.packages("stats")
# import libraries into current session
library(stats)
## _______________________  End Step1  _______________________________________##

# Step 2 : Read the data from the input fi
Diameter <-read.csv(file.choose())    
View(Diameter)
attach(Diameter)
## _______________________  End Step2  _______________________________________##


# Step 3: Check for Normality  - Shapiro test 
# H0 : data is normal
# Ha : data is not normal
# Test returns a  p-value > 0.05 indicating that the probability of seeing 
# these values if the data is normal is quite high.
# So fail to reject H0
# ( p-high, accept null)

shapiro.test(Unit.A)

# p-value = 0.32 > 0.05 so p high null fly 
# unit.A follows normal distribution

shapiro.test(Unit.B)
# p-value = 0.5225 >0.05 so p high null fly 
# unit.B follows normal distribution
## _______________________  End Step2  _______________________________________##


#Step 4 :  Test for equal variances
# Variance test
# H0 : The variances are equal -> var(Unit.A) = var(Unit.B)
# Ha : Variances are not equal -> var(Unit.A) =/= var(Unit.B)
var.test(Unit.A, Unit.B)


# p-value = 0.3136 > 0.05 
# p high null fly => Equal variances

## _______________________  End Step4  _______________________________________##

# Step 5 Identify which test to perform
# Y continuous -> compare 2 populations -> Y1 & Y2 normal -> external circumstances not same
#we are dealing with two diffrent population -> Variances are equal -> 2 sample t-test

## _______________________  End Step5  _______________________________________##

# Step 6 : Perform 2 sample T.Test

#checking for equal and unequal means
t.test(Unit.A, Unit.B, alternative = "two.sided", conf.level = 0.95, correct = TRUE )
# H0 : unit.A = unit.B
# Ha : unit.A =/= unit.B
# p-value = 0.47 > 0.05
# p high null fly => we fail to reject null hypothesis =>accept null hypothesis 


## equal means

# CONCLUSION :There is any no significant difference in the diameter of the cutlet between two units 
