library("ggplot2")
library(hrbrthemes)
library(LaplacesDemon)
library(dplyr)
library(MASS)

pdf(file = "C:/Users/Admin/Desktop/math-stat/figures/2004-fit.pdf", width = 6, height = 5)


aex = read.csv("data/AEX.csv")
aex$Date = as.Date(aex$Date)

aex$Returns = ((aex$Close - aex$Open) / aex$Open)*100
aex$Year = format(aex$Date, "%Y")
aex_2004 = aex[aex$Year == 2004, ]


returns_2004 <- aex_2004$Returns

params_2004 = fitdistr(returns_2004, "t")
df_2004 =params_2004$estimate[3]
mu_2004 = params_2004$estimate[1]
sd_2004 = params_2004$estimate[2]


x_2004 <- seq(min(returns_2004), max(returns_2004), length=length(returns_2004)-1)
fun_2004 <- dst(x_2004, mu=mu_2004, sigma=sd_2004, nu=df_2004)


hist(returns_2004, prob=TRUE, breaks=20, xlab=substitute(paste(bold("Returns (%)"))), ylab=substitute(paste(bold("Density"))),main=NULL)
lines(x_2004, fun_2004, col=5,lwd=2)  
legend(x = "topright",         
       legend = c(substitute(paste(bold("fit")))), 
       col = c(5),      
       lwd = 3)   

VaR_2004 = qst(0.01, mu=params_2004$estimate[1], sigma=params_2004$estimate[2], nu=params_2004$estimate[3])
VaR_2004
quantile(aex_2004$Returns, probs=0.01)

dev.off()