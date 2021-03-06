#### Four in one plot #### 

# Paket
library(tidyverse)
library(gridExtra)


#### The function expects a model as input, it is possible to use multiple x-variables
four_in_one<-function(model = lm(y~x)){
  augment<-broom::augment(model)
  
  p1<-ggplot(augment, aes(sample=.std.resid))+stat_qq(color="lightblue")+
    geom_abline(slope = 1,intercept = 0,color="red")+
    labs(x="Standardized Residual", y="Sample", title= "Normal Probability Plot")+
    theme_bw() + 
    theme(plot.title =
            element_text(
              hjust = 0.5,
              vjust = 0.2,
              size = 14
            ))
  
  p2<-ggplot(augment, aes(.fitted,.std.resid))+
    geom_point(color="lightblue") +
    geom_hline(yintercept = 0, linetype = "dashed", color = "red")+
    labs(x="Fitted Value", y="Standardized Residual", title="Versus Fits")+
    theme_bw()+ 
    theme(plot.title =
            element_text(
              hjust = 0.5,
              vjust = 0.2,
              size = 14
            ))
  
  p3<-ggplot(augment, aes(.std.resid))+
    geom_histogram(bins = 12, color = "black", fill = "lightblue")+
    labs(y="Frequency", x="Standardized Residual", title="Histogram")+
    theme_bw()+ 
    theme(plot.title =
            element_text(
              hjust = 0.5,
              vjust = 0.2,
              size = 14
            ))
  
  p4<-ggplot(augment, aes(seq(1,length(.std.resid),1),.std.resid))+
    geom_point(color="lightblue")+
    geom_line()+
    geom_hline(yintercept = 0, linetype = "dashed", color = "red")+
    labs(x="Observation Order", y="Standardized Residual", title="Versus Order")+
    theme_bw()+ 
    theme(plot.title =
            element_text(
              hjust = 0.5,
              vjust = 0.2,
              size = 14
            ))
  
  grid.arrange(p1, p2, p3, p4, nrow = 2)
}

