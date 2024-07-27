
# Clear R environment

rm(list = ls(all = TRUE))
graphics.off()
shell("cls")

# Call Necessary Libraries
library(tempdisagg)
library(dplyr)
library(tsbox)

#### Extending Data Frequency for Oil Consumption

# denton-cholette/Chow-Lin regression 
annual_data <- read.csv("Final_Working_Files/Annual_Oil_Consumption.csv") 
# monthly_bm <- read.csv("Montly_consumption_predict.csv")

# Testing
# ts_mbm = ts(monthly_bm$amount, start=c(1980, 1), end=c(2023,12), frequency=12)
ts_adv = ts(annual_data$United.States, start=c(1997), end=c(2023), frequency=1)
plot(annual_data$United.States)
plot(ts_adv)
ts_adv

# Declaring dependencies for the loop
df = data.frame(sample(0:323, replace=TRUE))
z <- 0

# Moving through all the Columns of the Annual Data and converting it to a Monthly equivalent for scale normalization 
for (i in colnames(annual_data)){
  if (z > 1) {
    print(z)
    # print(annual_data[[i]])
    ts_adv = ts(annual_data[[i]], start=c(1997), end=c(2023), frequency=1)
    m1 <- td(ts_adv ~ 1, to = "monthly", method = "denton-cholette")
    
    x <- predict(m1)

    vect <- as.numeric(x)
    # df[i] <- rep(NA, 528)
    df[i] <- vect
    # x2 <- x
    print(x)
  } 

  z <- z + 1 
}
df
df[1] <- NULL
write.csv(df, "Final_Working_Files/Monthly_Oil_Consumption.csv", row.names=FALSE)
### Code is done at this point





### Tinkering with the base of the loop
clm <- list(colnames(annual_data))
m1 <- td(ts_adv ~ 1, to = "monthly", method = "denton-cholette")
# m3 <- td(ts_adv ~ ts_mbm)

summary(m1)

plot(ts_adv)
plot(predict(m1))

x <- predict(m1)
x
class(x)
length(x) 


