library("ggplot2")
library(hrbrthemes)
library(LaplacesDemon)
library(dplyr)
library(MASS)
library(car)

pdf(file = "C:/Users/Admin/Desktop/math-stat/figures/bbbyq-qq.pdf", width = 6, height = 5)


x = read.csv("data/BBBYQ.csv")
x$Date = as.Date(x$Date)

x$Returns = ((x$Close - x$Open) / x$Open)*100
x$Year = format(x$Date, "%Y")



qqPlot(x$Returns,xlab=substitute(paste(bold("Theoretical quantiles"))), ylab=substitute(paste(bold("BBBYQ quantiles"))))


dev.off()