# 🏥 Healthcare Denial Analytics  

**End-to-end healthcare claims denial analytics project using SQL, Python, Power BI, and Tableau.**  
This project uncovers patterns behind insurance claim denials and provides actionable insights to reduce revenue leakage in healthcare systems.

---

## 📌 Project Overview  

Hospitals and healthcare providers lose millions annually due to **insurance claim denials**.  
The goal of this project is to analyze claim denial trends, identify root causes, and recommend process improvements to minimize denials and optimize cash flow.

---

## 🎯 Objectives  

- Analyze healthcare claim denials by payer, reason, and claim type.  
- Identify the most common denial reasons and their financial impact.  
- Discover high-risk payers with the highest denial rates.  
- Track denial trends over time and evaluate the effectiveness of interventions.  
- Create interactive dashboards in **Power BI** and **Tableau** for stakeholders.  

---

## 🧰 Tools & Technologies  

| Tool | Purpose |
|------|----------|
| **SQL Server** | Data storage, exploration, and cleaning |
| **Python (Pandas, Matplotlib, Seaborn)** | Data analysis & visualization |
| **Power BI / Tableau** | Dashboard and storytelling |
| **Excel** | Initial data review and metric validation |
| **GitHub** | Version control and portfolio showcase |

---

## 📂 Project Structure  

```
healthcare-denial-analytics/
│
├── datasets/
│ └── healthcare_denial_dataset.csv
│
├── python/
│ └── 01_data_exploration.ipynb
│
├── reports/
│ └── visuals/
│
├── sql/
│ └── Create and query Claims denial table.sql
│
├── README.md
└── 
```

---

## 🗓️ Day 1 Progress — SQL Setup & Data Understanding  

### ✅ Tasks Completed:
- Uploaded and validated dataset (`healthcare_denial_dataset.csv`)
- Created SQL database: `HealthcareDenialDB`
- Created table: `ClaimDenials`
- Imported dataset into SQL Server
- Performed exploratory SQL queries to understand:
  - Total claims processed
  - Denials by payer
  - Denial rate and reason distribution
  - Claim type breakdown

---

## 📊 Key Metrics Summary  

| **Metric** | **Value** | **Key Insight** |
|-------------|------------|-----------------|
| Total Claims | 12,000 | Total claims processed |
| Denied Claims | 1,450 | High-value volume of denials |
| Denial Rate | 12.08% | Within expected benchmark |
| Highest Denial Rate Payer | Blue Cross | Priority payer for root-cause analysis |
| Top Denial Reason | CO-96 | Payment adjusted because of secondary coverage |
| Claim Type Split | Professional: 8,329, Institutional: 3,671 | Majority are professional claims |
| Avg A/R Days | 30 | Average time to resolve denials |

---

## 🧠 Insights Summary  

- **Blue Cross** shows the highest denial rate — a key payer for root-cause analysis.  
- **CO-96** (“Secondary coverage adjustment”) is the most frequent denial reason.  
- **Professional claims** form the majority, requiring workflow optimization in this area.  
- **Average A/R Days = 30**, which is within industry benchmarks but can be improved further.  

---

## 🚀 Next Steps — Day 2  

- Perform **in-depth SQL analysis** on denial trends by:
  - Payer, Reason, and Claim Type
  - Month-over-Month trend
  - A/R days distribution  
- Export SQL outputs to **Python (Pandas)** for deeper analytics & visualization.  

---

## 👨‍💻 Author  

**Mirigil Kumar M**  
*Data Analyst | SQL | Python | Power BI | Tableau | Excel*  
📧 **mirigilkumar@gmail.com**  
📍 **Coimbatore, Tamil Nadu, India**  

---

## ⭐ GitHub Project Tags  
`#SQL` `#DataAnalysis` `#HealthcareAnalytics` `#PowerBI` `#Python` `#Tableau` `#PortfolioProject`
