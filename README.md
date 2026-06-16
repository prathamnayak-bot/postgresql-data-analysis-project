📊 Student Performance Analysis using PostgreSQL
📌 Project Overview

This project analyzes student performance data to understand the impact of Generative AI usage, study habits, and other academic factors on GPA and skill retention. The analysis is performed using PostgreSQL with advanced SQL techniques such as JOINs, CTEs, and window functions.

📂 Dataset

The dataset contains the following attributes:

Student_ID
Major_Category
Year_of_Study
Pre_Semester_GPA
Post_Semester_GPA
Weekly_GenAI_Hours
Primary_Use_Case
Prompt_Engineering_Skill
Tool_Diversity
Paid_Subscription
Traditional_Study_Hours
Perceived_AI_Dependency
Anxiety_Level_During_Exams
Skill_Retention_Score
🛠️ Tools & Technologies
PostgreSQL
pgAdmin / psql
SQL (Joins, CTEs, Window Functions)
Git & GitHub
## 🚀 How to Run the Project

Follow these steps in sequence:

### 1️⃣ Create Database

Open PostgreSQL (pgAdmin or psql) and run:

```sql
CREATE DATABASE student_analysis;
```

---

### 2️⃣ Create Table

Run the following SQL to create the table:

```sql
CREATE TABLE "student_impact" (
    "Student_ID" INT PRIMARY KEY,
    "Major_Category" VARCHAR(50),
    "Year_of_Study" INT,
    "Pre_Semester_GPA" NUMERIC(3,2),
    "Weekly_GenAI_Hours" NUMERIC(4,2),
    "Primary_Use_Case" VARCHAR(100),
    "Prompt_Engineering_Skill" VARCHAR(20),
    "Tool_Diversity" INT,
    "Paid_Subscription" VARCHAR(5),
    "Traditional_Study_Hours" NUMERIC(4,2),
    "Perceived_AI_Dependency" VARCHAR(20),
    "Institutional_Policy" VARCHAR(50),
    "Anxiety_Level_During_Exams" VARCHAR(20),
    "Post_Semester_GPA" NUMERIC(3,2),
    "Skill_Retention_Score" NUMERIC(5,2),
    "Burnout_Risk_Level" VARCHAR(20)
);
```

---

### 3️⃣ Import Dataset (Using pgAdmin)

1. Right-click on the table **student_impact**
2. Select **Import/Export Data**
3. Choose your CSV file
4. Set:

   * Format: CSV
   * Header: Yes
5. Click **OK**

---

### 4️⃣ Verify Data

Run:

```sql
SELECT * FROM "student_impact" LIMIT 10;
```

---

### 5️⃣ Run Queries

* Open files from the `/queries` folder
* Execute them one by one in pgAdmin or psql

---

📊 Key Analysis Performed
🔹 Basic SQL Analysis
Filtering students based on GPA and study hours
Aggregations using GROUP BY
Identifying trends in AI usage
🔹 JOIN Operations
Combining multiple tables for deeper insights
Comparing student categories and performance
🔹 CTE (Common Table Expressions)
Breaking down complex queries
Reusable subquery logic for analysis
🔹 Window Functions
Ranking students by GPA
Comparing performance within each major
Identifying top and bottom performers
📈 Key Insights
Moderate use of Generative AI is associated with improved GPA
Excessive dependency on AI may reduce skill retention
Students with higher prompt engineering skills perform better academically
Balanced traditional study and AI usage yields the best results
