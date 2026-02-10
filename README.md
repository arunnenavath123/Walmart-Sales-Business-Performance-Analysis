# 🛒 Walmart Sales Analysis – SQL | Python | Power BI

A complete end-to-end **data analytics project** exploring Walmart’s sales performance using **SQL, Python (Jupyter Notebook), and Power BI**.
This project uncovers key insights like top-performing categories, customer behavior trends, branch performance, and revenue patterns.

---

## 📂 Project Files Include:

| File                               | Description                                          |
| ---------------------------------- | ---------------------------------------------------- |
| **walmart.ipynb**                  | Exploratory Data Analysis, Cleaning, Transformations |
| **walmart_clean_data.csv**         | Final cleaned dataset used for SQL + Power BI        |
| **walmart_project.sql**            | All SQL queries + 7 business problem solutions       |
| **Walmart_Dashboard.pbix**         | Complete Power BI interactive dashboard              |

---

## 🚀 Project Workflow

### **1️⃣ Data Cleaning (Python – Jupyter Notebook)**

Performed inside **walmart.ipynb**:

* Removed missing values
* Standardized categories
* Converted `date` and `time` columns
* Added new columns:

  * **DayType, MonthSort, Month**
  * **Shift (Morning/Afternoon/Evening)**
* Created **total → `total = unit_price * quantity`**
* Final dataset saved as: **`walmart_clean_data.csv`**

---

## 🧠 2️⃣ SQL Analysis (walmart_project.sql)

All SQL queries + insights are included


### **Business Problems Solved**

### 1. Most Profitable Category in Each Branch

**Insight:**
**Home & Lifestyle** is the highest-revenue category consistently across branches.

### 2. Branches With Declining Month-Over-Month Sales

**Insight:**
Branch **WALM001** has multiple declining months → performance instability.


### 3. Customer Spending Pattern by Time of Day

**Insight:**
**Evening** has the highest revenue and maximum invoices.


### 4. Categories With High Sales but Low Ratings

**Insight:**

* Fashion Accessories
* Home & Lifestyle
* Electronic Accessories
  These generate high revenue but have ratings below 6 → customer dissatisfaction.


### 5. Payment Method With Highest Average Order Value

**Insight:**
**Cash** users have the highest average order value.


### 6. Branch With Highest Customer Satisfaction

**Insight:**
**WALM004** has the highest average rating (≈7.0).


### 7. Weekend vs Weekday Revenue

**Insight:**
**Weekdays outperform weekends** in both sales volume and revenue.

---

## 📊 3️⃣ Power BI Dashboard

The **Walmart Power BI Dashboard**:

![Dashboard Overview](Dashboard.png)

---


## 🔍 Key Insights Summary

| Insight Category              | Key Finding                            |
| ----------------------------- | -------------------------------------- |
| 🔝 Highest Revenue Category   | Home & Lifestyle                       |
| 🏬 Most Inconsistent Branch   | WALM001                                |
| ⏰ Busiest Time of Day         | Evening                                |
| 😕 High Sales but Low Ratings | Fashion, Electronics, Home & Lifestyle |
| 💰 Highest Avg Order          | Cash payment                           |
| 😀 Best Customer Satisfaction | WALM004                                |
| 📅 Higher Revenue             | Weekdays                               |

---

## 🛠️ Tech Stack Used

### 🔹 **Python**

Pandas, NumPy

### 🔹 **SQL**

Window functions, Aggregations, CTEs, Rankings

### 🔹 **Power BI**

Interactive visuals, slicers, KPIs, DAX basics

### 🔹 **Tools**

VS Code, Jupyter Notebook, MySQL Workbench

---

## ▶️ How to Run the Project Locally

### **1. Clone the repo**

```bash
git clone https://github.com/yourusername/Walmart-Sales-Analysis.git
cd Walmart-Sales-Analysis
```

### **2. Run the Notebook**

Open **walmart.ipynb** in Jupyter Notebook or VS Code.

### **3. Execute SQL**

Open **walmart_project.sql** in MySQL Workbench
Use database:

```sql
USE walmart_db;
```

### **4. Open Power BI Dashboard**

Download **Power BI Desktop**, then open:

```
Walmart_Dashboard.pbix
```

---

## 🌟 Future Enhancements

* Add sales forecasting using ML
* Convert insights into a Streamlit dashboard
* Deploy dashboard online
* Build automated ETL pipelines

---

## 👩‍💻 Author

**Harshita Pandey** 
| SQL | Python | Power BI
📧 harshitapandey2910@gmail.com
