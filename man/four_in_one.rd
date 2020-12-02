\name{four_in_one}
\alias{four_in_one}

\title{Create a four in one plot!

}
\description{
Provide a y variable and a x variable, preferably from a timeseries.
}
\usage{

}

\arguments{

}
\details{

}
\value{


}
\references{
}
\author{

}
\note{

}

\seealso{

}
\examples{
library(fourinone)

## Example 1
df<-data.frame(year = seq(1900,2020,1), value = rnorm(121, 5, 2.5))
four_in_one(lm(value~year,data = df)) # Input is a model

## Example 2
sample_data<-100 # creating x^2 sample data
for(i in -10:10){
  sample_data<-c(rnorm(10,i^2,20), sample_data)
}
df<-data.frame(time=1800:2010, value=sample_data)

four_in_one(lm(value~time,data = df)) # Bad fit

ggplot(df, aes(time,value))+ # Clearly x^2 shape
  geom_point()+
  geom_smooth(method = "lm",se = FALSE)
  
df$time2<-df$time^2 
four_in_one(lm(value~time+time2,data = df)) # Great fit

}
