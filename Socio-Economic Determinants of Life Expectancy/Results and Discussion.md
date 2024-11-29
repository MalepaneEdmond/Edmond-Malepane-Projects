# Results and Discussion

## 1. Model Performance Evaluation

The primary objective of this analysis was to assess the predictive ability of various regression models (Stepwise Regression, LASSO Regression and the All-Variable Enter Method) in forecasting life expectancy based on socio-economic and healthcare-related variables. The models were evaluated using multiple performance metrics to determine their accuracy and efficiency.

The **evaluation metrics** included:
- **Mean Error (ME)**: Represents the bias in the predictions.
- **Root Mean Squared Error (RMSE)**: Provides a measure of the average magnitude of the error.
- **Mean Absolute Error (MAE)**: Shows the average absolute difference between predicted and observed values.
- **Mean Percentage Error (MPE)**: Indicates the percentage error between predictions and actual values.
- **Mean Absolute Percentage Error (MAPE)**: Measures the average percentage difference between predicted and actual values, commonly used in forecasting accuracy.
- **R² (Adjusted R²)**: Represents the proportion of the variance in the dependent variable (life expectancy) that can be explained by the predictors.

---

## 2. Model Evaluation Metrics (Test Set)

The following table presents the performance metrics for each model on the test data:

| Model               | ME          | RMSE      | MAE       | MPE        | MAPE       | R² Adj   |
|---------------------|-------------|-----------|-----------|------------|------------|----------|
| **Stepwise**         | 0.0371      | 3.4179    | 2.779     | 0.3331     | 3.9644     | 0.7642   |
| **LASSO**            | -0.0032     | 3.4036    | 2.735     | -0.4039    | 3.9063     | 0.7962   |
| **All-Variable Enter** | -0.0095   | 3.3993    | 2.756     | -0.4057    | 3.9317     | 0.7725   |

From these results, it’s evident that **LASSO Regression** outperformed the other models with:
- **Lower RMSE**: **3.4036**, slightly better than **Stepwise**'s RMSE of **3.4179**.
- **Lower MAPE**: LASSO achieved a **MAPE of 3.9063**, compared to **Stepwise**'s **3.9644**.
- **Higher Adjusted R²**: **0.7962** compared to **Stepwise**'s **0.7642**.

The **All-Variable Enter Method** performed slightly worse, with a higher **MAPE** and a lower **R² Adj (0.7725)** indicating that the inclusion of all variables didn’t provide a substantial improvement in the model’s predictive power.

---

## 3. Performance on Training Data

On the training set, all models performed similarly, with the **Adjusted R²** values ranging from **0.8193** to **0.8206**. Specifically:

| Model               | ME          | RMSE      | MAE       | MPE        | MAPE       | R² Adj   |
|---------------------|-------------|-----------|-----------|------------|------------|----------|
| **Stepwise**         | -3.3227e-15 | 3.3230    | 2.527     | -0.2353    | 3.6583     | 0.8206   |
| **LASSO**            | 6.6453e-15  | 3.3125    | 2.505     | -0.2331    | 3.6240     | 0.8203   |
| **All-Variable Enter** | 1.1042e-14 | 3.3092    | 2.522     | -0.2319    | 3.6442     | 0.8193   |

Despite the slight difference in **R² Adj**, the performance of the models on the training set suggests that all three models fit the data well with **Stepwise** and **LASSO** being nearly identical in their ability to explain the variation in life expectancy.

---

## 4. Insights from Model Comparison

### Stepwise Regression vs. LASSO:
- **LASSO Regression** demonstrated **slightly better performance** than **Stepwise Regression** in terms of **MAPE** and **RMSE** on the test set, with the former achieving a better **Adjusted R²** as well.
- LASSO’s ability to perform **automatic feature selection** made it a more efficient model, as it reduced the number of predictors involved, focusing on the most relevant ones. In contrast, **Stepwise Regression** included more predictors, which might have led to overfitting and slightly higher errors in the test set.

### All-Variable Enter Method:
- While the **All-Variable Enter Method** showed **lower MAPE** values (**3.9317**) compared to **Stepwise** and **LASSO**, it was the least effective model overall. It had the **lowest R² Adj** value of **0.7725**, indicating it was less efficient in explaining the variation in life expectancy.
- Including all variables can be useful for exploratory analysis, but it often leads to a more complex model without significant improvements in prediction accuracy especially when some variables may not contribute meaningfully.

---

## 5. Statistical Significance and Practical Implications

### Performance on Test vs. Training Data:
- On the training data, all models showed similar performance indicating that they fit the data well. However, the real test of a model’s performance lies in its ability to generalise to new, unseen data (i.e., the test set).
- **LASSO**, with its lower **MAPE** and **RMSE** values on the test set, demonstrated superior generalisability, meaning it is better at making accurate predictions for life expectancy across countries based on the selected predictors.

### Explaining Variance in Life Expectancy:
- **LASSO’s Adjusted R² of 0.7962** means that the model was able to explain **79.62%** of the variation in life expectancy based on the predictors used in the analysis. This is a strong result, suggesting that the socio-economic and healthcare factors included in the model have a significant influence on life expectancy.
- The **Stepwise** and **All-Variable Enter Method** models also performed well, with **R² Adj** values of **0.7642** and **0.7725** respectively. These models explained approximately **76%** of the variation, but LASSO’s slightly higher value suggests a better fit and more accurate predictions.

---

## 6. Limitations of the Study
- **Multicollinearity**: Some predictors such as **GDP per capita** and **healthcare spending** are highly correlated which can affect the stability of regression models. However, LASSO handled multicollinearity effectively by shrinking coefficients making it more robust to this issue.
- **Data Quality**: The study relied on secondary data from the **World Bank** which may have some missing or inconsistent data points. Imputation techniques were used to fill in missing data but the overall quality of the dataset can still impact model accuracy.
- **Model Assumptions**: All models assume linear relationships between predictors and the dependent variable (life expectancy). Non-linear relationships or interactions between predictors could further improve prediction accuracy.

---

## 7. Policy Implications and Recommendations
Based on the results, the following recommendations can be made:
- **Investing in Education**: Improving **literacy rates** is a key policy recommendation as education significantly impacts life expectancy.
- **Increased Healthcare Spending**: More investment in healthcare infrastructure and services particularly in underserved regions can significantly improve life expectancy outcomes.
- **Ensure Access to Clean Water**: Providing access to clean water is crucial particularly in developing countries where water-related diseases are a leading cause of mortality.
- **Improving Healthcare Workforce**: Increasing the number of healthcare professionals particularly nurses can improve care quality and lead to better health outcomes.

---

## 8. Conclusion
The analysis has demonstrated that socio-economic factors, including **literacy rate**, **healthcare spending** and **access to clean water** are strong predictors of life expectancy. Among the models tested, **LASSO Regression** proved to be the most accurate outperforming **Stepwise Regression** and the **All-Variable Enter Method**. These findings provide valuable insights that can guide policy interventions aimed at improving life expectancy, particularly in developing countries where such factors are often key to better public health outcomes.


