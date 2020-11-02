#Hypothesis testing Q4


# TeleCall uses 4 centers around the globe to process customer order forms. 
#They audit a certain %  of the customer order forms. Any error in order form renders it defective
#and has to be reworked before processing.  The manager wants to check whether the defective % 
#varies by centre. Please analyze the data at 5% significance level 
#and help the manager draw appropriate inferences

#Ans.
#output(y): comparing more than 2 population with eac h other <- Discreat
#Reserch Question:whether the defective % varies by centre.
#H0:def % (Phillippines)= def% (Indonesia)= def% (Malta)= def% (India)
#Ha:def %(Phillippines) =/= def %(Indonesia) =/= def %(Malta) =/= def %(India)
#      --------------OR------------

# Research Question: Does the defective % vary by centre? (Ha)

# H0 : Defect % same for all centres
# Ha : Defect % varies with centres

# Step 1 : Install and load the necessary libraries
# For chisq.test 
# install.packages("stats")


library(stats)
# Step 2 : Read the data from the input file 


cof <- read.csv(file.choose())
View(cof) 

Phillippines.N <- as.numeric(cof$Phillippines)
Indonesia.N <- as.numeric(cof$Indonesia)
Malta.N <- as.numeric(cof$Malta)
India.N <- as.numeric(cof$India)

New_cof <- data.frame(Phillippines.N, Indonesia.N, Malta.N, India.N)
View(New_cof)
stacked_Newcof <-stack(New_cof)
View(stacked_Newcof)
attach(stacked_Newcof)

# Step 3 Identify which test to perform
# Y discrete -> compare more than two populations -> chisquare test

# Step 4: Perform the chi square test

table(stacked_Newcof)
chisq.test(table(stacked_Newcof))

# P VALUE = 0.2771 >0.05 -> p high null fly -> accept null hypothesis
# Research Question: Does the defective % vary by centre? 

# H0 : Defect % same for all centres
# Ha : Defect % varies with centres
# CONCLUTION: yes the defective % vary by centre

