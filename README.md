# 🏨 Hotel Membership & Booking Analysis

A complete SQL and Power BI analytics project built to analyze hotel memberships, bookings, transactions, revenue, renewals, and customer behavior.

---

## 📌 Project Overview

This project analyzes a relational hotel membership and booking dataset using SQL and Power BI.

The goal is to transform raw CSV data into meaningful business insights by performing SQL-based analysis and creating an interactive Power BI dashboard.

The project covers:

- Member analysis
- Membership analysis
- Hotel and city performance
- Booking analysis
- Revenue analysis
- Payment method analysis
- Renewal analysis
- Customer segmentation
- Business performance insights

---

## 🎯 Project Objectives

- Practice SQL using real-world business scenarios.
- Analyze relational data using multiple tables.
- Understand relationships between members, memberships, bookings, hotels, and transactions.
- Calculate key business metrics such as revenue, bookings, memberships, and renewals.
- Identify top-performing products, hotels, cities, and members.
- Create an interactive Power BI dashboard.
- Generate actionable business insights from data.

---

## 🛠️ Tools & Technologies

- **SQL**
- **MySQL Workbench**
- **Microsoft Power BI Desktop**
- **Microsoft Excel**
- **CSV**
- **Git & GitHub**

---

## 🗂️ Dataset

The dataset contains 7 CSV files representing different entities in the hotel membership and booking system.

| Table | Description |
|---|---|
| `member` | Contains member information |
| `membership1` | Contains membership details and status |
| `bookings` | Contains hotel booking information |
| `hotels` | Contains hotel and city information |
| `transaction` | Contains transaction and payment details |
| `entitlements` | Contains membership entitlement information |
| `renewals` | Contains membership renewal information |

---

## 🗄️ Database Schema

The project uses a relational data model connecting members, memberships, bookings, hotels, transactions, entitlements, and renewals.

### Entity Relationship Diagram

![ER Diagram](docs/ER_Diagram.png)

---

## 🧮 SQL Analysis

The project contains **50 SQL practice problems** covering different levels of data analysis.

### SQL Concepts Covered

- SELECT
- WHERE
- ORDER BY
- GROUP BY
- HAVING
- Aggregate Functions
- INNER JOIN
- LEFT JOIN
- CASE Statements
- Date Functions
- Subqueries
- Window Functions
- Ranking Functions
- Running Totals
- Cumulative Revenue
- RFM Segmentation
- Retention Analysis
- Churn Analysis

### Key Analysis Areas

- Total members and memberships
- Membership status analysis
- Booking analysis
- Revenue analysis
- Payment method analysis
- Top members by bookings and revenue
- Top hotels and cities
- Members without memberships or bookings
- Revenue segmentation
- Renewal and churn analysis
- Monthly revenue growth
- Customer retention
- RFM customer segmentation

SQL queries are available in:

`SQL/analysis_queries.sql`

---

## 📊 Power BI Dashboard

An interactive Power BI dashboard was created to visualize important business KPIs and performance trends.

### Dashboard Includes

- 👥 Total Members
- 💳 Active Memberships
- 💰 Total Revenue
- 🏨 Total Bookings
- 🔄 Total Renewals
- 📈 Monthly Revenue Trend
- 🍩 Membership Status Distribution
- 📊 Revenue by Membership Product
- 🏆 Top 5 Hotels by Revenue
- 🔎 City-based Interactive Slicer

The Power BI dashboard file is available in:

`Dashboard/Hotel-Membership-Booking-Analysis.pbix`

---

## 📈 Key Business Insights

The dashboard helps identify:

- Which membership products generate the highest revenue.
- Which hotels perform best in terms of revenue.
- How revenue changes over time.
- The distribution of active, expired, and cancelled memberships.
- Overall booking and membership performance.
- The impact of city-level filtering on business performance.

---

## 📁 Project Structure

```text
Hotel-Membership-Booking-Analysis/
│
├── assets/
│   └── README.md
│
├── Dashboard/
│   ├── README.md
│   └── Hotel-Membership-Booking-Analysis.pbix
│
├── Dataset/
│   ├── bookings.csv
│   ├── entitlements.csv
│   ├── hotels.csv
│   ├── member.csv
│   ├── membership1.csv
│   ├── renewals.csv
│   ├── transaction.csv
│   └── README.md
│
├── docs/
│   ├── ER_Diagram.png
│   └── README.md
│
├── SQL/
│   ├── analysis_queries.sql
│   └── README.md
│
├── LICENSE
└── README.md