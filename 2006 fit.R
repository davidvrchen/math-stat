library("ggplot2")
library(hrbrthemes)
library(LaplacesDemon)
library(dplyr)
library(MASS)

pdf(file = "C:/Users/Admin/Desktop/math-stat/figures/2006-fit.pdf", width = 6, height = 5)


aex = read.csv("data/AEX.csv")
aex$Date = as.Date(aex$Date)

aex$Returns = ((aex$Close - aex$Open) / aex$Open)*100
aex$Year = format(aex$Date, "%Y")
aex_2006 = aex[aex$Year == 2006, ]


returns_2006 <- aex_2006$Returns

params_2006 = fitdistr(returns_2006, "t")
df_2006 =params_2006$estimate[3]
mu_2006 = params_2006$estimate[1]
sd_2006 = params_2006$estimate[2]


x_2006 <- seq(min(returns_2006), max(returns_2006), length=length(returns_2006)-1)
fun_2006 <- dst(x_2006, mu=mu_2006, sigma=sd_2006, nu=df_2006)


hist(returns_2006, prob=TRUE, breaks=20, xlab=substitute(paste(bold("Returns (%)"))), ylab=substitute(paste(bold("Density"))),main=NULL)
lines(x_2006, fun_2006, col=5,lwd=2)  
legend(x = "topright",         
       legend = c(substitute(paste(bold("fit")))), 
       col = c(5),      
       lwd = 3)   

VaR_2006 = qst(0.01, mu=params_2006$estimate[1], sigma=params_2006$estimate[2], nu=params_2006$estimate[3])
VaR_2006
quantile(aex_2006$Returns, probs=0.01)


dev.off()