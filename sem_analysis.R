
# Clear R environment

rm(list = ls(all = TRUE))
graphics.off()
shell("cls")

### DATA PREPRATION ###
library(lavaan)
dat <- read.csv("Final_Working_Files/SME_input.csv") 
#sample variance-covariance matrix 
# cov(dat) 


#structural regression (observed endogenous variable)
# war is not taken into account and there are 1 country missing from the OC and OP 
m6c <- '
  # measurement model
    epu =~ econ_uncer_idx.SCMP.China + econ_uncer_idx.France + econ_uncer_idx.Germany + econ_uncer_idx.UK + econ_uncer_idx.US
    ea =~ econ_act.000001.SS + econ_act..FTSE + econ_act..GSPC + econ_act.Kilian
    oc =~ consumption.China + consumption.India + consumption.Japan + consumption.United.States
    op =~ production.Algeria + production.Iran + production.Nigeria + production.Kuwait + production.Saudi.Arabia + production.Venezuela + production.United.Arab.Emirates
    PoOil =~ PoOil.OilComb
  # regressions
    oc ~ ea
    PoOil ~ epu + ea + op + oc
'

# Test - model does converge but it is not a good fitting model
m6c <- '
  # measurement model
    epu =~ econ_uncer_idx.France + econ_uncer_idx.Germany + econ_uncer_idx.UK + econ_uncer_idx.US
    ea =~ econ_act..FTSE + econ_act..GSPC + econ_act.Kilian
    oc =~ consumption.China + consumption.India + consumption.Japan + consumption.United.States
    op =~ production.Algeria + production.Iran + production.Nigeria + production.Kuwait + production.Saudi.Arabia + production.Venezuela + production.United.Arab.Emirates
    PoOil =~ PoOil.OilComb
  # regressions
    oc ~ ea
    PoOil ~ epu + ea + op + oc
'

m6c <- '
  # measurement model
    epu =~ econ_uncer_idx.France + econ_uncer_idx.Germany + econ_uncer_idx.UK + econ_uncer_idx.US
    ea =~ econ_act..FTSE + econ_act..GSPC + econ_act.Kilian
    oc =~ consumption.China + consumption.India + consumption.Japan + consumption.United.States
    op =~ production.Algeria + production.Iran + production.Nigeria + production.Kuwait + production.Saudi.Arabia + production.Venezuela + production.United.Arab.Emirates
    PoOil =~ PoOil.OilComb
'

colSums(is.na(dat))

m6c <- '
  # measurement model
    epu =~ econ_uncer_idx.France + econ_uncer_idx.UK + econ_uncer_idx.US
    PoOil =~ PoOil.OilComb 
  # regressions
    PoOil ~ epu
'

fit6c <- sem(m6c, data=dat)
summary(fit6c, standardized=TRUE, fit.measures=TRUE)
# inspect(fit6c,"partable")
modindices(fit6c,sort=TRUE)

library(AER)
library(MASS)
library(corrplot)



ivar <- dat[,3:22]
ivaricor <- ginv(cor(ivar))
colnames(ivaricor) <- colnames(ivar)
rownames(ivaricor) <- colnames(ivar)
this <- diag(ivaricor)
this
# ivaricor
# corrplot(corr = ivaricor, method = 'number', is.corr = FALSE)
