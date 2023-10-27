library("ggplot2")
library(hrbrthemes)
library(LaplacesDemon)
library(dplyr)
library(MASS)

pdf(file = "C:/Users/Admin/Desktop/math-stat/figures/bbbyq-acf.pdf", width = 6, height = 5)


x = read.csv("data/BBBYQ.csv")
x$Date = as.Date(x$Date)

x$Returns = ((x$Close - x$Open) / x$Open)*100
x$Year = format(x$Date, "%Y")


acf(x$Returns,
    xlab=substitute(paste(bold("Correlation"))), 
    ylab=substitute(paste(bold("Lag"))), lag.max=(length(x$Returns)-1)
    )


dev.off()