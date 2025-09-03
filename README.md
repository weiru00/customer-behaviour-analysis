# 👜 365 Careers - Customer Behaviour Analysis
<img width="1536" height="863" alt="Overview" src="https://github.com/user-attachments/assets/b88c8837-e34e-43af-952e-2e5520e92e23" />

## 🔹 Project Overview
The purpose of this project is to analyze **customer behavior on an online learning platform** in order to understand **student engagement, conversion from free-to-paid users, and learning outcomes**.  

The analysis is designed to answer key business questions:
- How engaged are the students inside the platform, and how can this metric be improved?
- How long do students stay engaged on the platform, and how can this period be extended? 
- How do **free vs. paid students** differ in terms of behaviour?  
- Which are the most popular courses on the platform?
- How many students sit for an exam?

By combining **SQL for data transformation** and **Tableau for visualization**, this project provides insights that can help e-learning companies improve:
- **Product design** (optimize course length and difficulty)  
- **Monetization strategies** (targeted campaigns to convert F2P users)  
- **Student retention** (identify early churn risks based on engagement buckets)  


👉 **[View Tableau Dashboard](https://public.tableau.com/views/CustomerBehaviourAnalysis_17562887064050/ExamsandCareerTrack?:language=en-US&publish=yes&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)**  
👉 **[SQL Scripts](./sql_scripts)**  

---

## 🔹 Dataset Description
The dataset (provided in the 365 Careers learning platform case study) contains multiple entities:

- **career_track_info** → mapping of tracks to courses and exams  
- **course_info** → course ID, title, duration  
- **student_info** → student ID, registration date  
- **student_learning** → student ID, date, minutes watched
- **student_purchases** → purchase ID, student ID, date purchased, date refunded
- **student_exams** → exam attempt ID, student ID, exam ID, pass or fail flag, date exam completed 
- **exam_info** → exam ID,  course ID, track ID, categories (practice/course/career track), duration
- **student_certificates** → certificates type (course-level or track-level), date issued, student ID, course ID, track ID
- **student_career_track_enrollments** → track ID, student ID
- **course_ratings** → course ID, student ID
- **student_engagement** → engagement ID, student ID, quizzes, exams, lessons, date

Granularity:  
- Time span: ~1 year of activity (1st Jan 2022 - 31 Oct 2022)

---

## 🔹 In-House Terminology
To keep the analysis clear, here are the key terms used throughout this project:

- **Free-to-Paid (F2P):** Students who converted from free to paid plan.  
- **Engagement:** Begins either one of the following activities such as: a lecture from a course, a quiz or an exam.
- **Onboarding:** First-time engagement.
- **Student Type:**
   1. Free-plan Student
   2. Paying Student
- **Buckets:** Predefined ranges of minutes watched (e.g., 0, (0–5], (5–10], … up to 6000+) used for segmenting students by engagement levels.  


---
## 🔹 SQL Deliverables
The project was structured into modular SQL result sets (saved as `.sql` files):

- **`career_track_funnel.sql`** → 15-row funnel table showing drop-off from enrollment → exam attempts → track certificate :contentReference[oaicite:1]{index=1}.  
- **`courses_engagement.sql`** → calculates `minutes_watched`, `minutes_per_student`, and `completion_rate` per course.  
- **`student_buckets_f2p.sql`** → assigns students into engagement buckets (0 min, (0–5], (5–10], … up to 6000+) with ~37,490 rows.  
- **`student_buckets_sub_duration.sql`** → segments paid students by subscription duration and watch-time buckets (~2,338 rows).  
- **`student_certificates.sql`** → all certificates with issuance date and paid/free status.  
- **`student_exam_attempts.sql`** → all exam attempts, category (course vs final), and pass/fail flag.  
- **`student_learning.sql`** → daily minutes watched with paid/free flag.  
- **`student_onboarding.sql`** → whether a student onboarded after registration.

---

## 🔹 Key Insights

### Student Engagement
The total number of engaged students on the platform is around 19k. The number of free-plan students (~8k) is significantly hogher than paid students (~2k). The sum of total engaged students is greater than the sum of both free and paid students because the conversion of students from free to paid plan, making them engaged as free and then paid students.
<img width="1536" height="863" alt="Overview" src="https://github.com/user-attachments/assets/c6b223f4-db51-4957-ae21-10c9d38ebbce" />

The number of engaged students peaked at August (almost 3x as compared to average) because the platform opened for free of charge to all students for 3 days.
<img width="1365" height="767" alt="Engagement Date" src="https://github.com/user-attachments/assets/f25db020-a998-4840-84b2-64a566d55113" />

The mid-August peak is even more emphasized for free students.
<img width="1520" height="383" alt="image" src="https://github.com/user-attachments/assets/39b58cec-a4d9-48ea-9104-ceaa5c1f73b0" />

However, these 3 days have not affected engagement for paid students, as user has already paid for the product and has no reason to engage more during this campaign.
<img width="1522" height="357" alt="image" src="https://github.com/user-attachments/assets/a475d037-cfb4-4ebc-8e03-1f98c8d8ac3d" />

By excluding the peak points, we can now better view the **general trend** of number of engaged students. The number of engaged students is in an **increasing trend** over time from ~100 to ~400. 
<img width="1520" height="291" alt="image" src="https://github.com/user-attachments/assets/6a738f21-bd07-4660-a487-cce2a4cc3a67" />

From the yearly view, it is obvious that Aug, Sep and Oct are stronger in terms of number of engaged students. This can be contributed by the "Three free-or-charge days" in Aug, Platform Gamification in Sep and Marketing Campaigns in Oct.
<img width="1532" height="825" alt="image" src="https://github.com/user-attachments/assets/4f953113-715e-4974-81ef-5da7ef7acc20" />








- How does this number differ bet

- **Free-to-play learners** watched ~30% fewer minutes on average than paying users.  
- Only **45% of students** who enrolled attempted at least one course exam.  
- The **Data Analyst track** achieved the highest certificate completion rate (12%).  
- A small set of courses drove **60% of total engagement** → critical for retention strategies.  

---

## 🔹 Next Steps
- Automate SQL → Tableau pipeline for scheduled updates.  
- Extend analysis with churn prediction models.  
- Conduct A/B tests on free-to-paid conversion strategies.  

---

✨ **Author:** Your Name  
📧 Contact: your.email@example.com  
🔗 Portfolio: [https://yourportfolio.com](https://yourportfolio.com)  
🔗 LinkedIn: [linkedin.com/in/yourname](https://linkedin.com/in/yourname)  
