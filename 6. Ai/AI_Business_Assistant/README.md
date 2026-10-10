# AI Demand Forecasting & Business Intelligence Assistant

## Overview

This application provides a simple business-question answering interface for the demand forecasting and business intelligence project.

The assistant uses verified findings from the project to answer common business questions related to:

- Store performance
- Promotion impact
- Seasonality
- Competition distance
- Year-over-year sales
- Demand forecasting performance

## Technologies Used

- Python
- Streamlit
- Pandas
- OpenAI Python SDK
- Business knowledge base

## Features

- Interactive business question interface
- Suggested business questions
- Store performance insights
- Promotion analysis
- Forecasting performance insights
- Competition-distance analysis
- Year-over-year analysis
- Business recommendations

## Data Safety

The application uses a verified project knowledge file containing analyzed project results.

The application is designed not to invent project-specific numbers or conclusions.

## Important Note

The current portfolio version uses predefined business-question logic so that the application can run without API credits.

An OpenAI API integration was also developed and tested, but API usage requires available API credits.

## Project Structure

```text
AI_Business_Assistant/
│
├── app.py
├── business_knowledge.txt
├── requirements.txt
└── README.md
```
