# AI-Powered Demand Forecasting & Business Intelligence

## Project Overview

This project combines data analysis, SQL, machine learning, business intelligence, and an AI-powered business assistant to analyze store sales and support demand forecasting.

The project follows an end-to-end workflow:

Excel → SQL → Python/ML → Power BI → AI Business Assistant

## Project Objectives

- Analyze historical sales performance
- Identify important business patterns
- Analyze promotion and competition effects
- Compare store-level performance
- Build a machine learning demand forecasting model
- Evaluate forecasting performance
- Create an interactive Power BI dashboard
- Build a business-question answering assistant

## Dataset

- Training records: 1,017,209
- Number of stores: 1,115
- Date range: 2013-01-01 to 2015-07-31

## Excel Analysis

The Excel analysis covers:

- Store type performance
- Promotion impact
- Day-of-week sales patterns
- Monthly sales trends
- Year-over-year sales
- Competition-distance analysis
- Top-performing stores
- Sales per Customer

## SQL Analysis

SQL Server was used to perform business queries and aggregations across the sales and store data.

Key analyses include:

- Store type performance
- Total sales
- Total customers
- Sales per Customer
- Average sales per store-day
- Store-level comparisons

## Machine Learning

A Random Forest Regressor was developed for demand forecasting.

### Model Configuration

- Algorithm: Random Forest Regressor
- max_depth: 15
- n_estimators: 20
- random_state: 42

### Train-Test Strategy

A chronological split was used:

- Training period: before 2015-06-01
- Test period: 2015-06-01 onward

### Model Performance

- MAE: approximately ₹451.00
- RMSE: approximately ₹688.30
- R²: approximately 0.9672

## Power BI Dashboard

The Power BI dashboard contains:

- Actual Sales KPI
- Predicted Sales KPI
- Average Absolute Error
- Forecast Accuracy
- Store filtering
- Actual vs Predicted Sales
- Forecast Error by Store
- Store Performance Details
- Business Insights

The dashboard uses a business-defined Forecast Accuracy metric of approximately 92.69%.

## AI Business Assistant

A Streamlit-based business assistant was developed to answer questions using verified project findings.

Example questions:

- Which store type has the highest Sales per Customer?
- What was the impact of promotions?
- How accurate was the forecasting model?
- Which competition distance band performed best?
- What was the year-over-year sales trend?
- Which store had the highest total sales?

The assistant is designed not to invent project-specific values or conclusions.

## Technologies Used

- Microsoft Excel
- SQL Server
- Python
- Pandas
- Scikit-learn
- Streamlit
- Power BI
- OpenAI Python SDK

## Project Structure

```text
AI-Powered Demand Forecasting & Business Intelligence
│
├── 1. Raw Data
├── 2. Excel
├── 3. SQL
├── 4. Python
├── 5. Power BI
├── 6. AI
│   └── AI_Business_Assistant
├── 7. Reports
├── 8. Screenshots
└── README.md
```
