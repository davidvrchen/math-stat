library("ggplot2")
library(hrbrthemes)
library(LaplacesDemon)
library(dplyr)
library(MASS)

pdf(file = "C:/Users/Admin/Desktop/math-stat/figures/2004-mean-est.pdf", width = 6, height = 5)


aex = read.csv("data/AEX.csv")
aex$Date = as.Date(aex$Date)

aex$Returns = ((aex$Close - aex$Open) / aex$Open)*100
aex$Year = format(aex$Date, "%Y")
aex_2004 = aex[aex$Year == 2004, ]


mean_2004 = mean(aex_2004$Returns) 
var_2004 = var(aex_2004$Returns)
sd_2004 = sd(aex_2004$Returns)
left_2004 = mean_2004 + qnorm(0.025)*sd_2004/sqrt(length(aex_2004))

right_2004 = mean_2004 + qnorm(1-0.025)*sd_2004/sqrt(length(aex_2004))
left_2004
mean_2004
right_2004

hist(aex_2004$Returns, prob=TRUE, breaks=20,, xlab=substitute(paste(bold("Returns (%)"))), ylab=substitute(paste(bold("Density"))),main=NULL)

abline(v=left_2004,col=6, lwd=3, lty='dashed')
abline(v=mean_2004,col=6, lwd=5)
abline(v=right_2004,col=6, lwd=3, lty='dashed')


dev.off()