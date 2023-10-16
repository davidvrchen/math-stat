library("ggplot2")
library(hrbrthemes)

pdf(file = "C:/Users/Admin/Desktop/math-stat/figures/tdistr.pdf",   # The directory you want to save the file in
    width = 6, # The width of the plot in inches
    height = 5) # The height of the plot in inches

curve(dnorm(x), 
      from=-3, to=3, col=1, lwd=3, lty=6, 
      ylab= substitute(paste(bold('f(x)'))),
      xlab= substitute(paste(bold('x')))
)
curve(dt(x, 8), from=-3, to=3, add=TRUE, col=5, lwd=3, lty=1)
curve(dt(x, 3), from=-3, to=3, add=TRUE, col=6, lwd=3, lty=2)
curve(dt(x, 1), from=-3, to=3, add=TRUE, col=7, lwd=3, lty=4)

legend(x = "topright",         
       legend = c(substitute(paste(bold("normal"))),
                  substitute(paste(bold(paste(nu," = 8")))),
                  substitute(paste(bold(paste(nu," = 3")))),
                  substitute(paste(bold(paste(nu," = 1"))))),  
       lty = c(6,1,2,4),           
       col = c(1,5,6,7),      
       lwd = 3)            

dev.off()