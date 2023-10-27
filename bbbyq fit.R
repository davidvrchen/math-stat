library("ggplot2")
library(hrbrthemes)
library(LaplacesDemon)
library(dplyr)
library(MASS)

pdf(file = "C:/Users/Admin/Desktop/math-stat/figures/bbbyq-fit.pdf", width = 6, height = 5)


x = read.csv("data/BBBYQ.csv")
x$Date = as.Date(x$Date)

x$Returns = ((x$Close - x$Open) / x$Open)*100
x$Year = format(x$Date, "%Y")



params = fitdistr(x$Returns, "t")
df =params$estimate[3]
mu = params$estimate[1]
sd = params$estimate[2]


ys <- seq(min(x$Returns), max(x$Returns), length=length(x$Returns)-1)
fun <- dst(ys, mu=mu, sigma=sd, nu=df)


hist(x$Returns, prob=TRUE, breaks=22, xlab=substitute(paste(bold("Returns (%)"))), ylab=substitute(paste(bold("Density"))),main=NULL, ylim=c(0,0.08))
lines(ys, fun, col=5,lwd=2)  
legend(x = "topright",         
       legend = c(substitute(paste(bold("fit")))), 
       col = c(5),      
       lwd = 3)   

VaR = qst(0.01, mu=params$estimate[1], sigma=params$estimate[2], nu=params$estimate[3])
VaR
quantile(x$Returns, probs=0.01)


dev.off()