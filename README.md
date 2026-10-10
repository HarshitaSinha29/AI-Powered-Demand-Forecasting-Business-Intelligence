
# AI-Powered Demand Forecasting & Business Intelligence

An end-to-end data analytics and machine learning project that analyzes store sales, identifies business patterns, builds a demand forecasting model, and presents insights through Power BI and a Streamlit business assistant.

## Project Overview

This project follows an end-to-end analytics workflow:

Excel → SQL → Python/ML → Power BI → Business Assistant

The project focuses on understanding historical sales performance, identifying business patterns, comparing stores, forecasting demand, and translating analytical results into business insights.

## Project Objectives

- Analyze historical sales performance
- Identify important business patterns
- Analyze promotion and competition-distance relationships
- Compare store-level performance
- Build a machine learning demand forecasting model
- Evaluate forecasting performance
- Create an interactive Power BI dashboard
- Build a business-question answering assistant based on verified project findings

## Dataset

The project uses store sales and store information.

- Training records: 1,017,209
- Number of stores: 1,115
- Date range: 2013-01-01 to 2015-07-31

The raw dataset files are excluded from the public GitHub repository because of file size and repository management considerations.

## Excel Analysis

Excel was used for exploratory business analysis and KPI-based comparisons.

Key analyses include:

- Store type performance
- Promotion impact
- Day-of-week sales patterns
- Monthly sales trends
- Year-over-year sales
- Competition-distance analysis
- Top-performing stores
- Sales per Customer

## SQL Analysis

SQL Server was used to perform business queries, aggregations, joins, and store-level comparisons across the sales and store data.

Key analyses include:

- Store type performance
- Total sales
- Total customers
- Sales per Customer
- Average sales per store-day
- Store-level comparisons
- Data quality checks

## Key Business Insights

### Store Type Performance

Store Type D recorded the highest Sales per Customer:

**₹11.25 per customer**

### Promotion Impact

Promotional store-days recorded higher Sales per Customer than non-promotional store-days:

- Promotion: **₹9.74**
- No promotion: **₹8.51**
- Difference: **₹1.23**

This is a descriptive association and does not prove that promotions directly caused the increase.

### Competition Distance

The 0–1 km competition-distance group recorded the highest average sales per store-day:

**₹6,050.13**

The 2–5 km group recorded the lowest:

**₹5,529.88**

This represents an observed association rather than proof that competition distance directly causes differences in sales.

### Seasonal Sales Pattern

The highest observed monthly average sales per store-day was recorded in:

**December 2014 — ₹6,973.28**

The lowest observed monthly average was:

**January 2013 — ₹5,211.56**

The dataset contains only January–July 2015, so 2015 is not treated as a complete year.

### Year-over-Year Sales

Total sales in 2014 were approximately:

**5.30% lower than 2013**

The comparison uses complete calendar years. 2015 is excluded from the full-year comparison because only January–July data is available.

## Machine Learning

A Random Forest Regressor was developed to forecast store-level sales.

### Model Configuration

- Algorithm: Random Forest Regressor
- max_depth: 15
- n_estimators: 20
- random_state: 42

### Train-Test Strategy

A chronological split was used to avoid using future observations to predict the past.

- Training period: before 2015-06-01
- Test period: 2015-06-01 onward

### Model Performance

The model achieved the following results on the held-out test period:

- **MAE:** approximately ₹451.00
- **RMSE:** approximately ₹688.30
- **R²:** approximately 0.9672

These results indicate that the model was able to explain a large proportion of the variation in sales in the held-out period.

## Power BI Dashboard

The Power BI dashboard presents both forecasting results and business analysis.

Dashboard components include:

- Actual Sales KPI
- Predicted Sales KPI
- Average Absolute Error
- Forecast Accuracy
- Store filtering
- Actual vs Predicted Sales
- Forecast Error by Store
- Store Performance Details
- Key Business Insights

The dashboard uses a business-defined Forecast Accuracy metric of approximately **92.69%**.

This metric is based on aggregate absolute forecast error relative to aggregate actual sales. It should not be interpreted as classification accuracy or as a replacement for MAE, RMSE, or R².

## Business Assistant

A Streamlit-based business assistant was developed to answer predefined business questions using verified project findings.

Example questions include:

- Which store type has the highest Sales per Customer?
- What was the impact of promotions?
- How accurate was the forecasting model?
- Which competition distance band performed best?
- What was the year-over-year sales trend?
- Which store had the highest total sales?

The assistant uses controlled question-answering logic based on verified project results and is designed to avoid inventing project-specific values or conclusions.

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
AI-Powered-Demand-Forecasting-Business-Intelligence
│
├── 3. SQL
├── 4. Python
│   └── notebook
├── 5. Power Bi
├── 6. Ai
│   └── AI_Business_Assistant
├── 7. Reports
├── 8. Screenshots
├── .gitignore
└── README.md
```
