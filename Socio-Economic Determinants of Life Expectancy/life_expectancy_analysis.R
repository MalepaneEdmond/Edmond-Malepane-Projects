
# Load necessary libraries
library(MASS)      # For stepwise regression
library(glmnet)    # For LASSO regression
library(car)       # For diagnostic plots and VIF
library(caret)     # For train-test split
library(ggplot2)   # For enhanced visualisations

# Load the dataset (replace 'life_expectancy.csv' with your actual file path)
data <- read.csv("life_expectancy.csv")

# Check the structure and summary of the data
str(data)
summary(data)

# Split the data into training and testing sets (80% for training, 20% for testing)
set.seed(123)  # For reproducibility
trainIndex <- createDataPartition(data$Life.Expectancy, p = 0.8, 
                                  list = FALSE, 
                                  times = 1)

train_data <- data[trainIndex, ]  # Training data
test_data <- data[-trainIndex, ]  # Testing data

# Scale the data (optional but recommended for LASSO and regression models)
train_data_scaled <- train_data
train_data_scaled[,-1] <- scale(train_data[,-1])  # Exclude the response variable if scaling predictors

test_data_scaled <- test_data
test_data_scaled[,-1] <- scale(test_data[,-1])  # Ensure same scaling for test data

# --- Stepwise Regression (on Training Data) ---
# Fit the full model with all predictors on training data
full_model <- lm(Life.Expectancy ~ ., data = train_data)

# Perform stepwise regression
stepwise_model <- stepAIC(full_model, direction = "both", trace = FALSE)

# Summary of the final stepwise model
summary(stepwise_model)

# Predict on test data
stepwise_pred <- predict(stepwise_model, newdata = test_data)

# Evaluate the model: Mean Squared Error (MSE)
stepwise_mse <- mean((stepwise_pred - test_data$Life.Expectancy)^2)
cat("MSE (Stepwise):", stepwise_mse, "\n")

# Diagnostic plots for stepwise regression
par(mfrow = c(2, 2))
plot(stepwise_model)

# Residual plot for stepwise regression
plot(stepwise_model$residuals, main = "Residual Plot for Stepwise", ylab = "Residuals", xlab = "Index", col = "blue", pch = 19)
abline(h = 0, col = "red")

# --- LASSO Regression (on Training Data) ---
# Prepare data for LASSO (training set)
X_train <- model.matrix(Life.Expectancy ~ ., train_data)[, -1]  # Predictor matrix
y_train <- train_data$Life.Expectancy  # Response variable

# Prepare test data for prediction (matrix format)
X_test <- model.matrix(Life.Expectancy ~ ., test_data)[, -1]

# Perform LASSO with cross-validation
cv_lasso <- cv.glmnet(X_train, y_train, alpha = 1)

# Optimal lambda
best_lambda <- cv_lasso$lambda.min
cat("Optimal Lambda for LASSO:", best_lambda, "\n")

# Fit final LASSO model
lasso_model <- glmnet(X_train, y_train, alpha = 1, lambda = best_lambda)

# Coefficients of LASSO model
cat("LASSO Model Coefficients:\n")
print(coef(lasso_model))

# Predict on test data
lasso_pred <- predict(lasso_model, newx = X_test)

# Evaluate the model: Mean Squared Error (MSE)
lasso_mse <- mean((lasso_pred - test_data$Life.Expectancy)^2)
cat("MSE (LASSO):", lasso_mse, "\n")

# Residual plot for LASSO regression
lasso_resid <- test_data$Life.Expectancy - lasso_pred
plot(lasso_resid, main = "Residuals Plot for LASSO", ylab = "Residuals", xlab = "Index", col = "purple", pch = 19)
abline(h = 0, col = "red")

# --- Multiple Linear Regression (on Training Data) ---
# Fit multiple linear regression model on training data
mlr_model <- lm(Life.Expectancy ~ ., data = train_data)

# Summary of the model
summary(mlr_model)

# Predict on test data
mlr_pred <- predict(mlr_model, newdata = test_data)

# Evaluate the model: Mean Squared Error (MSE)
mlr_mse <- mean((mlr_pred - test_data$Life.Expectancy)^2)
cat("MSE (Multiple Linear Regression):", mlr_mse, "\n")

# Diagnostic plots for MLR
par(mfrow = c(2, 2))
plot(mlr_model)

# Variance Inflation Factor (VIF) to check multicollinearity
vif_values <- vif(mlr_model)
cat("VIF Values:\n")
print(vif_values)

# Check normality of residuals with Q-Q plot
qqPlot(mlr_model, main = "Q-Q Plot of Residuals")

# Residual plot for MLR
mlr_resid <- residuals(mlr_model)
plot(mlr_resid, main = "Residuals Plot for MLR", ylab = "Residuals", xlab = "Index", col = "darkgreen", pch = 19)
abline(h = 0, col = "red")

# --- Model Comparison (Evaluate All Models) ---
# Compare MSE for all models
cat("MSE (Stepwise):", stepwise_mse, "\n")
cat("MSE (LASSO):", lasso_mse, "\n")
cat("MSE (MLR):", mlr_mse, "\n")

# You can also compare the predicted vs actual values for a more visual comparison
# Stepwise
plot(test_data$Life.Expectancy, stepwise_pred, main = "Stepwise Regression: Actual vs Predicted", 
     xlab = "Actual", ylab = "Predicted", col = "blue", pch = 19)
abline(0, 1, col = "red")

# LASSO
plot(test_data$Life.Expectancy, lasso_pred, main = "LASSO: Actual vs Predicted", 
     xlab = "Actual", ylab = "Predicted", col = "purple", pch = 19)
abline(0, 1, col = "red")

# MLR
plot(test_data$Life.Expectancy, mlr_pred, main = "Multiple Linear Regression: Actual vs Predicted", 
     xlab = "Actual", ylab = "Predicted", col = "green", pch = 19)
abline(0, 1, col = "red")
