# SEM

The code is meant to be run thought a Python 3.9 virtual environment, the required packages for which are given in the folder with the same name (requirements.txt). 

This model was created based on an analysis done by Qingfeng Wanga, Xu Sun in which they used the Structural Equation Model (SEM) to predict Crude oil prices using data from 1997 to 2017.

Upon running the model on the updated data with the factors which were selected in their initial analysis using the varimax rotation factor analysis, it showed that the factors which were selected by them although logical (for example, the countries selected for determining oil production were actually the ones which in realty based on common knowledge hold the most reserves and produce the most) and correct at the time did not result in a good fitting model based on the various fit statistics with the updated data. Some reasons for this likely has to do with the fact that the data has been heavily influenced by the events of covid, wars and other geopolitical events since the creation of the initial paper.  

The main issues with the current model have to do with the initial assumption made about the factors which was mentioned before. Next steps will be running the varimax rotation factor analysis on the observed variables to see which ones should be selected for our latent variable creation.
Running a CFA fit of each model, and checking for the magnitude of factor loadings is what I will be doing when I have some spare time.

The current model as is not a well-fitting model and this is due to a multitude of factors, the most important ones of them being collinearity of the different variables and the magnitude of the factor loadings.

Although the model in its current state is not appropriate, the SEM approach to modeling Oli Supply and Demand is a valid one with the right inputs as observed variables it has the position to give traders additional information upon which they would be able to base their market outlook.
