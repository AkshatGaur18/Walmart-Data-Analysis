# Data Analytics at Walmart: A Capstone Project

This repository contains the complete end-to-end data analytics capstone project for Walmart. The project simulates real-world challenges faced by a data analyst, transforming raw transactional data into actionable business insights through advanced SQL querying, interactive business intelligence dashboards, and predictive machine learning models.

## 📌 Introduction

The primary goal of this project is to analyze Walmart's operational and transactional data to identify key business drivers, customer behaviors, and opportunities for strategic improvement. The workflow is divided into three key phases that mirror a professional data analytics pipeline:

1.  **Advanced Data Extraction & Analysis with SQL:** Exploring business health, sales performance, and operational bottlenecks.
2.  **Business Visualization with Power BI:** Building an interactive executive dashboard for data-driven decision-making.
3.  **Predictive & Prescriptive Modeling with Python:** Forecasting future trends and segmenting customers to inform strategic initiatives.

---

## 📊 Dataset

The dataset captures Walmart’s operations across multiple regions and is composed of the following tables:

* `customers.csv`
* `orders.csv`
* `order_items.csv`
* `products.csv`
* `payments.csv`
* `sellers.csv`
* `geolocation.csv`

---

## 🚀 Phase 1: Advanced SQL Analysis

In this phase, advanced SQL queries were used to extract critical insights from the database. The analysis focused on sales performance, customer loyalty, operational efficiency, and regional trends.

### 🔍 Key Questions Answered:

* Total sales revenue and quantity sold by **product category** and **customer state**.
* The **top 5 products** by total sales revenue.
* Walmart's most valuable customers, ranked by **order count and total spend**.
* Customer states with the **highest Average Order Value (AOV)**.
* **Average delivery time** (in days) by seller state.
* The **top 5 sellers** based on total revenue.
* **Monthly revenue trends** to track growth over time.
* **New unique customers** acquired each month.
* Customer lifetime spend ranking within each state using **window functions**.
* **Rolling 3-month average revenue** to visualize sales momentum.

### 📁 Deliverable:

* [`Walmart SQL SCRIPT.sql`](Walmart%20SQL%20SCRIPT.sql): A SQL script containing all the queries used for the analysis.

---

## 📊 Phase 2: Business Visualization – Power BI

An interactive and dynamic dashboard was built using Power BI to provide Walmart's executive team with a comprehensive overview of the business. The dashboard enables users to drill down into specific areas of concern or opportunity.

### 📚 Key Metrics & Visuals:

* **Sales Performance:** Total Revenue, Total Quantity Sold, Average Order Value (AOV), and Sales by Product Category & State.
* **Customer Insights:** Customer Lifetime Value (CLV), Top 10 Loyal Customers, Customer Segments (from ML model), and AOV by State.
* **Regional & Seller Metrics:** Revenue by Customer State, Average Delivery Time by Seller State, and Top Sellers by Revenue.
* **Time Trends & Seasonality:** Monthly Revenue Trend, Rolling 3-Month Average Sales, and Monthly New Customer Acquisition.

### 🖥️ Dashboard Previews

*(Please add your own screenshots of the Power BI dashboard here. Below are placeholder sections for you to fill.)*

**Sales Overview Page**
<br>
**
<br>
*This page provides a high-level summary of key sales metrics, allowing executives to quickly assess overall performance.*

**Customer Insights Page**
<br>
**
<br>
*This page focuses on customer behavior, highlighting top spenders, loyalty, and the distribution of customer segments across different regions.*

### 📁 Deliverable:

* [`Walmart Visualization.pbix`](Walmart%20Visualization.pbix): The complete Power BI dashboard file.

---

## 🤖 Phase 3: Predictive Analytics & Machine Learning with Python

In the final phase, machine learning models were deployed to strengthen future planning, optimize operations, and enhance customer strategies.

### Tasks & Models Implemented:

#### 📈 1. Sales & Customer Forecasting
* **Objective:** Forecast overall sales and new customer acquisition for the next 6 months.
* **Method:** A linear regression model was used on time-series data, which was first decomposed to identify underlying trend and seasonality patterns.
* **Outcome:** The model successfully predicts a continued growth trend and identifies seasonal peaks, allowing for better inventory and marketing planning.

#### 🧩 2. Customer Segmentation
* **Objective:** Group customers into meaningful segments to enable targeted marketing campaigns.
* **Method:** RFM (Recency, Frequency, Monetary) analysis was combined with K-Means clustering.
* **Outcome:** Three distinct customer segments were identified: **Loyal High-Value**, **Churn Risks**, and **Discount-Seekers**, each with a clear profile for strategic engagement.

#### ⚠️ 3. Return Prediction
* **Objective:** Build a model to predict the likelihood of a product being returned.
* **Method:** A classification model was trained using features like product category, price, and delivery time.
* **Outcome:** The model provides a baseline for identifying products or operational factors (like long delivery times) that contribute to higher return rates.

### 📁 Deliverables:

* [`Walmart ML Project 2.ipynb`](Walmart%20ML%20Project%202.ipynb): A Python notebook with the complete code for data preprocessing, model training, evaluation, and visualization.
* **Visualizations:** Includes forecast plots, cluster segment visualizations, and a model confusion matrix.
* **Business Recommendations:** A summary of actionable insights derived from the models is included at the end of the notebook.

---

## 🛠️ Technologies Used

* **Database:** SQL
* **Data Analysis & Modeling:** Python (Pandas, Scikit-learn, Matplotlib, Seaborn)
* **Business Intelligence:** Power BI
* **Development Environment:** Jupyter Notebook
