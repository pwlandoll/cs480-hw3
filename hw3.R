# Homework 3 - hw3.R
# Author: Peter Landoll

install.packages("shiny")
library(ggplot2)
library(shiny)
library(rgl)

setwd("C:/Users/Peter/SkyDrive/College Work/Fall 2015/CS 480/")
load ("allcancers.RData")
dev.new()

# Graph 1: ggplot
# Assign age categories
cancer$agecat = "adult"
cancer$agecat[cancer$agedx >= 65] = "senior"
cancer$agecat[cancer$agedx <= 18] = "adolescent"
cancer$agecat[cancer$agedx <= 12] = "child"
# Make a boxplot of survival rate per age category, where survival is < 100
barplot(table(cancer$surv))
t1 <- subset(cancer, surv < 100, select = c("casenum", "agecat", "surv"))
ggplot(data=t1, aes(x = factor(agecat, c("child", "adolescent", "adult", "senior")), y = surv)) + 
  geom_boxplot() + labs(title="Survival per Age Category", x="Age Category", y="Survival")


# Graph 2: shiny
runApp("./")


# Graph #3: rgl
x <- cancer$cancer[cancer$surv<100]
y <- cancer$age[cancer$surv<100]
z <- cancer$surv[cancer$surv<100]
rgl.open()
rgl.points(x, y, z, color="lightgray")

