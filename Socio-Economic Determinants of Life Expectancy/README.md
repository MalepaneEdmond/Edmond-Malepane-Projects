# Life Expectancy Analysis Project

## Overview:
This project aims to analyze and predict life expectancy based on various socio-economic and health-related factors using multiple regression techniques. The project includes **Stepwise Regression**, **LASSO Regression** and **Multiple Linear Regression** to identify significant predictors and evaluate model performance.

## Files:
- **scripts/analysis.R**: The main R script for loading data, preprocessing, training models, and evaluating performance.
- **data/life_expectancy.csv**: The dataset containing variables like GDP per capita, literacy rate, health spending and life expectancy.
- **results/plots/**: Contains visualizations such as residual plots predicted vs actual plots, and diagnostic plots.
- **results/metrics/**: Contains model evaluation metrics, including MSE for each model.

## Steps:
1. **Install dependencies**: Run the following in R to install required libraries:
    ```r
    install.packages(c("MASS", "glmnet", "caret", "car", "ggplot2"))
    ```

2. **Data Preparation**: The data is automatically loaded in the script from `life_expectancy.csv`. The dataset is split into **80% training** and **20% testing** for model validation.

3. **Run the Analysis**: Execute the `Script` script to train and evaluate models. It will output plots and evaluation metrics, including MSE.

4. **View Results**: Check the `Results and Discussion` folder for visualizations and the `results/metrics/model_comparison.csv` for model comparison metrics.

## Dependencies:
- **R version 4.0.0 or higher**.
- Libraries: `MASS`, `glmnet`, `caret`, `car`, `ggplot2`.



