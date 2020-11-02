#Hypothesis_assnment_Q2.

#A hospital wants to determine whether there is any difference in the average Turn Around Time (TAT)
#of reports of the laboratories on their preferred list. They collected a random sample and recorded
#TAT for reports of 4 laboratories. TAT is defined as sample collected to report dispatch.
#Analyze the data and determine whether there is any difference in average TAT among the different
#laboratories at 5% significance level.

#ANS.

# here input(x) = Turn Around Time (TAT) of reports of the laboratories = cont.
#output (y) = significant difference in average TAT = cont.
# Research Question:Is there any difference in the average Turn Around Time (TAT)
#of reports of the laboratories on their preferred list? (Ha)
# H0 : Lab.1 = Lab.2 = Lab.3 = Lab.4
# Ha : Lab.1=/=Lab.2=/=Lab.3=/=Lab.4 or atleast one is uequal

# Step 1 : Install and load the necessary libraries
# if not installed, install the following packages

# For Anderson Darling  test for Normality 
install.packages("nortest")
# For Levene test
install.packages("car")

# import libraries into current session
library(nortest)
library(car)

laboratories = read.csv(choose.files())
View(laboratories)
all.lab <- stack(laboratories)
View(all.lab)
attach(all.lab)

# Check for Normality  - Shapiro test 
# H0 : data is normal
# Ha : data is not normal
# Test returns a  p-value > 0.05 indicating that the probability of seeing 
# these values if the data is normal is quite high.
# So fail to reject H0
# ( p-high, accept null)

shapiro.test(all.lab$values)
# p-value = 0.1175 > 0.05 so p high null fly 
# laboratories.1 follows normal distribution
ad.test(all.lab$values)
# p-value = 0.0572 > 0.05 so p high null fly 
# laboratories.1 follows normal distribution


#Step 4 :  Test for equal variances
# Variance test
# H0 : The variances are equal -> var(lab 1)=var(lab 2)=var(lab 3)=var(lab 4)
# Ha : Variances are not equal -> var(lab 1)=/=var(lab 2)=/=var(lab 3)=/=var(lab 4)


leveneTest(all.lab$values~all.lab$ind, data = all.lab)

# p-value = 0.051 = 0.05 
# p high null fly <- fail to reject null hypothesis <- accept null hypothesis

# Step 5 Identify which test to perform
# Y continuous -> compare more than 2 populations -> Y1 , Y2 & Y3 normal 
# -> Variances are equal -> ANOVA

## _______________________  End Step5  _______________________________________##

# Step 6 : Perform one way anova
# Research Question:Is there any difference in the average Turn Around Time (TAT)
#of reports of the laboratories on their preferred list? (Ha)
# H0 : Lab.1 = Lab.2 = Lab.3 = Lab.4
# Ha : Lab.1=/=Lab.2=/=Lab.3=/=Lab.4 

#Anova_results <- aov(values~ind,data = Stacked_Data)
Anova_results <- aov(values~ind, data = all.lab)
summary(Anova_results)

#p-value =2e-16 < 0.05 
#p low null go <-  reject null hypothesis 

# CONCLUSION : there is difference in the average (TAT) of reports of the laboratories.
