#1. View all data
SELECT * FROM student_impact;

#2. Show GPA before and after
SELECT "Student_ID", "Pre_Semester_GPA", "Post_Semester_GPA"
FROM student_impact;

#3. Students using AI more than 5 hours/week
SELECT *
FROM student_impact
WHERE "Weekly_GenAI_Hours" > 5;

#4. Students with GPA improvement
SELECT *
FROM student_impact
WHERE "Post_Semester_GPA" > "Pre_Semester_GPA";

#5. High performers (Post GPA > 3.88)
SELECT *
FROM student_impact
WHERE "Post_Semester_GPA" > 3.88;

#6. Sort by AI usage hours
SELECT *
FROM student_impact
ORDER BY "Weekly_GenAI_Hours" DESC;

#7. Top 5 students by GPA
SELECT *
FROM student_impact
ORDER BY "Post_Semester_GPA" DESC
LIMIT 5;

#8. Students with high anxiety
SELECT *
FROM student_impact
WHERE "Anxiety_Level_During_Exams" > 9;

#9. Students with paid subscription
SELECT *
FROM student_impact
WHERE "Paid_Subscription" = 'Yes';

#10. Sort by burnout risk
SELECT *
FROM student_impact
ORDER BY "Burnout_Risk_Level" DESC;

#11. Avg GPA by Major (Self Join)
SELECT s1."Major_Category", AVG(s2."Post_Semester_GPA") AS avg_gpa
FROM student_impact s1
JOIN student_impact s2 
ON s1."Student_ID" = s2."Student_ID"
GROUP BY s1."Major_Category";

#12. Total AI Hours by Year
SELECT s1."Year_of_Study", 
       SUM(s2."Weekly_GenAI_Hours") AS total_hours
FROM student_impact s1
JOIN student_impact s2 
ON s1."Student_ID" = s2."Student_ID"
GROUP BY s1."Year_of_Study";

#13. Avg Pre vs Post GPA by Year
SELECT s1."Year_of_Study",
       AVG(s2."Pre_Semester_GPA") AS avg_pre,
       AVG(s2."Post_Semester_GPA") AS avg_post
FROM student_impact s1
JOIN student_impact s2 
ON s1."Student_ID" = s2."Student_ID"
GROUP BY s1."Year_of_Study";

#14. Burnout Count by Major
SELECT s1."Major_Category", COUNT(*) AS burnout_count
FROM student_impact s1
JOIN student_impact s2 
ON s1."Student_ID" = s2."Student_ID"
WHERE s2."Burnout_Risk_Level" = 'High'
GROUP BY s1."Major_Category";

#15. Avg Skill Retention by Use Case
SELECT s1."Primary_Use_Case", AVG(s2."Skill_Retention_Score") AS avg_score
FROM student_impact s1
JOIN student_impact s2 
ON s1."Student_ID" = s2."Student_ID"
GROUP BY s1."Primary_Use_Case";

#16. Paid vs Free Users GPA
SELECT s1."Paid_Subscription", AVG(s2."Post_Semester_GPA") AS avg_gpa
FROM student_impact s1
JOIN student_impact s2 
ON s1."Student_ID" = s2."Student_ID"
GROUP BY s1."Paid_Subscription";

#17. Avg Anxiety by Year
SELECT s1."Year_of_Study", AVG(s2."Anxiety_Level_During_Exams") AS avg_anxiety
FROM student_impact s1
JOIN student_impact s2 
ON s1."Student_ID" = s2."Student_ID"
GROUP BY s1."Year_of_Study";

#18. Tool Diversity vs GPA
SELECT s1."Tool_Diversity", AVG(s2."Post_Semester_GPA") AS avg_gpa
FROM student_impact s1
JOIN student_impact s2 
ON s1."Student_ID" = s2."Student_ID"
GROUP BY s1."Tool_Diversity";

#19. Avg Traditional Study Hours by Major
SELECT s1."Major_Category", AVG(s2."Traditional_Study_Hours") AS avg_hours
FROM student_impact s1
JOIN student_impact s2 
ON s1."Student_ID" = s2."Student_ID"
GROUP BY s1."Major_Category";

#20. AI Dependency vs Burnout Count
SELECT s1."Perceived_AI_Dependency", COUNT(*) AS total
FROM student_impact s1
JOIN student_impact s2 
ON s1."Student_ID" = s2."Student_ID"
GROUP BY s1."Perceived_AI_Dependency";

#21. GPA Improvement by AI Usage
SELECT s1."Weekly_GenAI_Hours",
       AVG(s2."Post_Semester_GPA" - s2."Pre_Semester_GPA") AS improvement
FROM student_impact s1
JOIN student_impact s2 
ON s1."Student_ID" = s2."Student_ID"
GROUP BY s1."Weekly_GenAI_Hours";

#22.Policy Impact on GPA
SELECT s1."Institutional_Policy", AVG(s2."Post_Semester_GPA") AS avg_gpa
FROM student_impact s1
JOIN student_impact s2 
ON s1."Student_ID" = s2."Student_ID"
GROUP BY s1."Institutional_Policy";

#23. Anxiety vs GPA
SELECT s1."Anxiety_Level_During_Exams", 
       AVG(s2."Post_Semester_GPA") AS avg_gpa
FROM student_impact s1
JOIN student_impact s2 
ON s1."Student_ID" = s2."Student_ID"
GROUP BY s1."Anxiety_Level_During_Exams";

#24.Major vs AI Dependency
SELECT s1."Major_Category", 
       AVG(s2."Perceived_AI_Dependency") AS avg_dependency
FROM student_impact s1
JOIN student_impact s2 
ON s1."Student_ID" = s2."Student_ID"
GROUP BY s1."Major_Category";

#25. Combined Analysis
SELECT s1."Major_Category",
       s1."Paid_Subscription",
       AVG(s2."Post_Semester_GPA") AS avg_gpa,
       COUNT(*) AS total_students
FROM student_impact s1
JOIN student_impact s2 
ON s1."Student_ID" = s2."Student_ID"
GROUP BY s1."Major_Category", s1."Paid_Subscription";

#26. Avg GPA by Major
WITH gpa_cte AS (
    SELECT "Major_Category", "Post_Semester_GPA"
    FROM student_impact
)
SELECT "Major_Category", AVG("Post_Semester_GPA") AS avg_gpa
FROM gpa_cte
GROUP BY "Major_Category";

#27.Total AI Hours by Year
WITH usage_cte AS (
    SELECT "Year_of_Study", "Weekly_GenAI_Hours"
    FROM student_impact
)
SELECT "Year_of_Study", SUM("Weekly_GenAI_Hours") AS total_hours
FROM usage_cte
GROUP BY "Year_of_Study";

#28.GPA Improvement per Student
WITH improvement_cte AS (
    SELECT "Student_ID",
           "Post_Semester_GPA" - "Pre_Semester_GPA" AS improvement
    FROM student_impact
)
SELECT "Student_ID", AVG(improvement) AS avg_improvement
FROM improvement_cte
GROUP BY "Student_ID";

#29.Burnout Count by Major
WITH burnout_cte AS (
    SELECT "Major_Category", "Burnout_Risk_Level"
    FROM student_impact
)
SELECT "Major_Category", COUNT(*) AS burnout_count
FROM burnout_cte
WHERE "Burnout_Risk_Level" = 'High'
GROUP BY "Major_Category";

#30. Avg Skill Retention
WITH skill_cte AS (
    SELECT "Primary_Use_Case", "Skill_Retention_Score"
    FROM student_impact
)
SELECT "Primary_Use_Case", AVG("Skill_Retention_Score") AS avg_score
FROM skill_cte
GROUP BY "Primary_Use_Case";

#31.Paid vs Free GPA
WITH paid_cte AS (
    SELECT "Paid_Subscription", "Post_Semester_GPA"
    FROM student_impact
)
SELECT "Paid_Subscription", AVG("Post_Semester_GPA") AS avg_gpa
FROM paid_cte
GROUP BY "Paid_Subscription";

#32. Avg Anxiety by Year
WITH anxiety_cte AS (
    SELECT "Year_of_Study", "Anxiety_Level_During_Exams"
    FROM student_impact
)
SELECT "Year_of_Study", AVG("Anxiety_Level_During_Exams") AS avg_anxiety
FROM anxiety_cte
GROUP BY "Year_of_Study";

#33.Tool Diversity vs GPA
WITH tool_cte AS (
    SELECT "Tool_Diversity", "Post_Semester_GPA"
    FROM student_impact
)
SELECT "Tool_Diversity", AVG("Post_Semester_GPA") AS avg_gpa
FROM tool_cte
GROUP BY "Tool_Diversity";

#34.Avg Study Hours by Major
WITH study_cte AS (
    SELECT "Major_Category", "Traditional_Study_Hours"
    FROM student_impact
)
SELECT "Major_Category", AVG("Traditional_Study_Hours") AS avg_hours
FROM study_cte
GROUP BY "Major_Category";

#35.AI Dependency Distribution
WITH dependency_cte AS (
    SELECT "Perceived_AI_Dependency"
    FROM student_impact
)
SELECT "Perceived_AI_Dependency", COUNT(*) AS total_students
FROM dependency_cte
GROUP BY "Perceived_AI_Dependency";

#36. GPA Improvement by AI Usage
WITH improve_cte AS (
    SELECT "Weekly_GenAI_Hours",
           ("Post_Semester_GPA" - "Pre_Semester_GPA") AS improvement
    FROM student_impact
)
SELECT "Weekly_GenAI_Hours", AVG(improvement) AS avg_improvement
FROM improve_cte
GROUP BY "Weekly_GenAI_Hours";

#37. Policy Impact on GPA
WITH policy_cte AS (
    SELECT "Institutional_Policy", "Post_Semester_GPA"
    FROM student_impact
)
SELECT "Institutional_Policy", AVG("Post_Semester_GPA") AS avg_gpa
FROM policy_cte
GROUP BY "Institutional_Policy";

#38. Anxiety vs GPA
WITH anxiety_gpa AS (
    SELECT "Anxiety_Level_During_Exams", "Post_Semester_GPA"
    FROM student_impact
)
SELECT "Anxiety_Level_During_Exams", AVG("Post_Semester_GPA") AS avg_gpa
FROM anxiety_gpa
GROUP BY "Anxiety_Level_During_Exams";

#39. Major vs AI Dependency
WITH dep_cte AS (
    SELECT "Major_Category", "Perceived_AI_Dependency"
    FROM student_impact
)
SELECT "Major_Category", AVG("Perceived_AI_Dependency") AS avg_dependency
FROM dep_cte
GROUP BY "Major_Category";

#40. Combined Analysis
WITH base AS (
    SELECT "Major_Category",
           "Paid_Subscription",
           "Post_Semester_GPA",
           "Burnout_Risk_Level"
    FROM student_impact
),
agg AS (
    SELECT "Major_Category",
           "Paid_Subscription",
           AVG("Post_Semester_GPA") AS avg_gpa,
           COUNT(*) FILTER (WHERE "Burnout_Risk_Level" = 'High') AS burnout_count
    FROM base
    GROUP BY "Major_Category", "Paid_Subscription"
)
SELECT * FROM agg;

#41. Rank Students by Post GPA
SELECT "Student_ID",
       "Post_Semester_GPA",
       RANK() OVER (ORDER BY "Post_Semester_GPA" DESC) AS rank_gpa
FROM student_impact;

#42.Rank Students Within Each Major
SELECT "Student_ID",
       "Major_Category",
       "Post_Semester_GPA",
       RANK() OVER (
           PARTITION BY "Major_Category"
           ORDER BY "Post_Semester_GPA" DESC
       ) AS rank_in_major
FROM student_impact;

#43.Dense Rank by AI Usage Hours
SELECT "Student_ID",
       "Weekly_GenAI_Hours",
       DENSE_RANK() OVER (ORDER BY "Weekly_GenAI_Hours" DESC) AS dense_rank_ai
FROM student_impact;

#44.Running Total of AI Usage by Year
SELECT "Student_ID",
       "Year_of_Study",
       "Weekly_GenAI_Hours",
       SUM("Weekly_GenAI_Hours") OVER (
           PARTITION BY "Year_of_Study"
           ORDER BY "Student_ID"
       ) AS running_total
FROM student_impact;

#45.Moving Average of GPA by Year
SELECT "Student_ID",
       "Year_of_Study",
       "Post_Semester_GPA",
       AVG("Post_Semester_GPA") OVER (
           PARTITION BY "Year_of_Study"
           ORDER BY "Student_ID"
           ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
       ) AS moving_avg_gpa
FROM student_impact;

#46.GPA Difference from Average (Per Major)


#47.

#48.

#49.

#50.
