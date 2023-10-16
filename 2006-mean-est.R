library("ggplot2")
library(hrbrthemes)
library(LaplacesDemon)
library(dplyr)
library(MASS)

pdf(file = "C:/Users/Admin/Desktop/math-stat/figures/2006-mean-est.pdf", width = 6, height = 5)


aex = read.csv("data/AEX.csv")
aex$Date = as.Date(aex$Date)

aex$Returns = ((aex$Close - aex$Open) / aex$Open)*100
aex$Year = format(aex$Date, "%Y")
aex_2006 = aex[aex$Year == 2006, ]


mean_2006 = mean(aex_2006$Returns) 
var_2006 = var(aex_2006$Returns)
sd_2006 = sd(aex_2006$Returns)
left_2006 = mean_2006 + qnorm(0.025)*sd_2006/sqrt(length(aex_2006))

right_2006 = mean_2006 + qnorm(1-0.025)*sd_2006/sqrt(length(aex_2006))
left_2006
mean_2006
right_2006

hist(aex_2006$Returns, prob=TRUE, breaks=20,, xlab=substitute(paste(bold("Returns (%)"))), ylab=substitute(paste(bold("Density"))),main=NULL)

abline(v=left_2006,col=6, lwd=3, lty='dashed')
abline(v=mean_2006,col=6, lwd=5)
abline(v=right_2006,col=6, lwd=3, lty='dashed')


dev.off()