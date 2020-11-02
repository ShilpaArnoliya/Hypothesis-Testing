#Hypothesis Testing Q5

# Fantaloons Sales managers commented that % of males versus females walking in to the store
#differ based on day of the week. Analyze the data and determine whether there is 
#evidence at 5 % significance level to support this hypothesis.

#Ans.
#output: % of males versus females walking in to the store <- discreat
#Reserch Q: Is % of males versus females walking in to the store differ.
#Ho:% males vs female on weekdays = % males vs female on weekends
#H1:% males vs female on weekdays =/= % males vs female on weekends
 
#y is discreat and we are comparing 2 population with each other
# so we will perform 2 proportion Test


# For prop.test 
install.packages("stats")
# import libraries into current session
library(stats)

x <- read.csv(file.choose())
View(x)
attach(x)
table(x)
table(x)
table(x)

# c- > success cases (i.e sale on weekdays),
#n -> total number of adults and children respectively

prop.test(x=c(167,113),n=c(400,400),conf.level = 0.95,correct = FALSE,alternative = "two.sided") 
# male on weekday differ from male on weekends


prop.test(x=c(167,113),n=c(400,400),conf.level = 0.95,correct = FALSE,alternative = "greater")

#pvalue < 0.05
#p low null go => reject null hypothesis
#CONCLUSION: % of males versus females walking in to the store differ based on day of the week.
