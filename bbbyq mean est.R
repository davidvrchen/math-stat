library("ggplot2")
library(hrbrthemes)
library(LaplacesDemon)
library(dplyr)
library(MASS)

pdf(file = "C:/Users/Admin/Desktop/math-stat/figures/bbbyq-mean-est.pdf", width = 6, height = 5)


x = read.csv("data/BBBYQ.csv")
x$Date = as.Date(x$Date)

x$Returns = ((x$Close - x$Open) / x$Open)*100
x$Year = format(x$Date, "%Y")


mu = mean(x$Returns) 
var = var(x$Returns)
sd = sd(x$Returns)
left = mu + qnorm(0.025)*sd/sqrt(length(x$Returns))

right = mu + qnorm(1-0.025)*sd/sqrt(length(x$Returns))
left
mu
right

hist(x$Returns, prob=TRUE, breaks=22, xlab=substitute(paste(bold("Returns (%)"))), ylab=substitute(paste(bold("Density"))),main=NULL)

abline(v=left,col=6, lwd=3, lty='dashed')
abline(v=mu,col=6, lwd=5)
abline(v=right,col=6, lwd=3, lty='dashed')


dev.off()