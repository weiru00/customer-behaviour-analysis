# 👜 365 Careers - Customer Behaviour Analysis

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

## 🔹 Key Insights

### Student Engagement  

We analyzed overall engagement levels across free and paid students to understand usage patterns and campaign impacts.  

**Findings:**  
- The platform recorded engagement from **~19k students**, including ~8k free-plan and ~2k paid-plan users.  
- Totals are higher than the sum of both categories due to **conversion activity** — students are counted once as free, then again as paid once they upgrade.  

![Engagement Overview](https://github.com/user-attachments/assets/03671e7e-5d49-4965-9a60-c97b1aa257bc)

- Engagement peaked in **August**, nearly **3x higher than average**, driven by a three-day free access campaign. Free users showed the strongest spike, while paid users were unaffected.  

![Engagement Spike](https://github.com/user-attachments/assets/f25db020-a998-4840-84b2-64a566d55113)

- Removing campaign peaks reveals a steady upward trend, with daily engagement growing from ~100 to ~400 students.  
- At the yearly level, **August, September, and October** were the strongest months, supported by (1) the free campaign in August, (2) gamification launch in September, and (3) targeted marketing in October.  

![Trend Without Peaks](https://github.com/user-attachments/assets/6a738f21-bd07-4660-a487-cce2a4cc3a67)  
![Yearly Engagement](https://github.com/user-attachments/assets/4f953113-715e-4974-81ef-5da7ef7acc20)

**Implications:**  
- Free campaigns significantly increase engagement but mainly among free users.  
- Paid users remain stable, indicating engagement is not easily swayed by promotions.  
- Sustained growth suggests increasing platform adoption, with campaigns acting as accelerators.  

### Onboarding & Retention  

We examined onboarding trends and retention cohorts to measure the effectiveness of gamification and marketing campaigns.  

**Findings:**  
- Onboarding rates increased sharply after **September 16**, coinciding with the gamified platform launch — suggesting gamification improved first-time adoption.  

![Onboarding Rate](https://github.com/user-attachments/assets/09a2060f-7177-4b4a-8968-fd281187de49)

- **Free students**: Retention is very low, with only **3% active after one month**. Most churn quickly or convert to paid.  
- **Paid students**: Retention is stronger, averaging **30%**, with ~50% retained after the first month. Many monthly subscribers churn, while quarterly/annual subscribers remain active longer.  

![Free Student Retention](https://github.com/user-attachments/assets/2ecc0d6c-625c-4399-9c5c-1620191401f2)  
![Paid Student Retention](https://github.com/user-attachments/assets/7da81e1d-6698-47f6-b169-6ceece094140)

- Campaign-linked cohorts (Jan, Mar, Jul, Sep) showed stronger onboarding, proving campaigns reached the right audiences.  
- However, **September retention was lower (35.4%)**, suggesting many users joined for the discount or to test gamification briefly, then churned.  

![Campaign Cohorts](https://github.com/user-attachments/assets/c8c3d810-6ab5-414f-bec1-8819defc33d1)  
![September Retention Drop](https://github.com/user-attachments/assets/76a84bf8-041a-455b-87cb-ba8b02eb8d94)

**Implications:**  
- Gamification boosted onboarding, but retention requires ongoing strategies.  
- Free users need stronger nudges to extend beyond their first month.  
- Paid retention depends on subscription tier — annual/quarterly plans provide more stability than monthly.  
- Campaigns successfully attracted new students but may not always ensure long-term retention.  


### Content Consumption  

We compared content consumption between free and paid students to understand viewing behavior and campaign effects.  

**Findings:**  
- **Free students** watched an average of **21.1 minutes**, compared with **30 minutes of unlocked content**. Most free students consumed nearly all of their available content, except those who never engaged.  
- **Paid students** watched an average of **543.7 minutes (~9 hours)**. With an average course length of 3.5 hours, this equates to **2–3 courses completed per membership period**.  

![Overall Minutes Watched](https://github.com/user-attachments/assets/4d35db94-9e98-4969-84db-e8adcddf845f)

- Minutes watched increased gradually throughout the year. **August** showed the highest spike, boosted by the free-access campaign. **October** followed strongly, fueled by new users from the September gamification launch.  

- For free students, August had the most significant boost, confirming campaign impact.  

![Free Student Minutes](https://github.com/user-attachments/assets/ee186099-b31d-426a-ad6c-fa6faa5bbf2d)

- Paid students were more stable, with **150–230 minutes watched per student monthly** — equivalent to completing one course per month. Campaigns had little effect on their behavior.  

![Paid Student Minutes](https://github.com/user-attachments/assets/0ae466b6-0214-471a-893b-07e6575d367a)

**Implications:**  
- Free users respond strongly to campaigns but lack long-term engagement.  
- Paid users show consistent consumption patterns, confirming steady learning habits.  
- Campaigns drive spikes in free consumption but have minimal impact on paid users.  


### Free-to-Paid (F2P) Conversion Rate  

We analyzed how much content free students consumed before deciding to subscribe, focusing especially on the first hour of watch time.  

**Findings:**  
- Conversion in the **0–5 minute buckets** is very low (3.0% at 0 minutes, 2.3% at 5 minutes). This reflects that most students prefer to sample content before committing. A small portion may convert immediately due to external factors such as discounts, referrals, or company accounts.  

![Conversion Buckets 0–5 Minutes](https://github.com/user-attachments/assets/9dcfd899-5cf1-4ee4-aa98-9a7dd79bcfb1)

- From **10 minutes onward**, the conversion rate increases steadily while sample size declines.  
- The **peak conversion rate occurs at 110–120 minutes**, where nearly **50% of students converted**, with adjacent buckets also showing high rates. This confirms that students who invest ~2 hours are much more likely to subscribe.  

![Conversion Buckets Trend](https://github.com/user-attachments/assets/3b98f12b-45b5-4e4c-be8f-35b72a8a72d9)

- Comparing specific buckets highlights the role of **content relevance**:  
  - 90–100 minutes → ~28% conversion  
  - 240–480 minutes → ~16% conversion (similar number of students but lower conversion)  
👉 Students are more likely to subscribe when they find content that matches their expectations, not simply by watching more hours.  

![Conversion Comparison](https://github.com/user-attachments/assets/869eca87-2dbf-4849-815f-2d14236afe2d)

**Implications:**  
- Early engagement is critical: the first 1–2 hours strongly influence subscription decisions.  
- Conversion depends on **content quality and relevance**, not just watch time.  
- Platform strategy should focus on surfacing the most appealing courses early in the student journey to maximize free-to-paid upgrades.  


### Courses Engagement

As part of the engagement analysis, we evaluated course performance using three key metrics:
1. **Total Minutes Watched**
2. **Minutes Watched per Student**
3. **Completion Rate**

**Findings:**
- The most watched courses were *Introduction to Data and Data Science, SQL, Statistics, Introduction to Excel,* and *Python Programmer Bootcamp*. These are fundamental courses, confirming their high demand among beginners.

![Top 5 Courses By Minutes Watched](https://github.com/user-attachments/assets/230266ce-fcf3-4604-bcf0-62b40e1bf159)

- *SQL* and *Python Bootcamp* also ranked highest for **minutes watched per student** (~110 minutes each). Other strong performers include *Data Pre-processing* and *Data Literacy*.  
- The *Negotiation* course is a notable outlier: short in length (~1.5 hours), newly added, and level-restricted.  

![Minutes Watched per Student](https://github.com/user-attachments/assets/04ceef21-d57a-449e-908c-9cf6b237010d)

- **Completion rate** was highest for shorter and newer courses. *Negotiation* leads with **95%**, followed by *Marketing Strategy* and *Data Literacy*. Longer courses showed lower completion, confirming the link between content length and dropout rates.  

![Completion Rate by Course](https://github.com/user-attachments/assets/0d8d06c9-2f2f-46c6-b3f7-9990762ba33a)

- Course satisfaction is very high overall, with an average rating of **4.8/5** across ~2,700 reviews (including 2,300+ five-star ratings).  

![Course Ratings Distribution](https://github.com/user-attachments/assets/5155af6a-231c-4da0-82be-23641b7a1473)

**Implications:**  
- **Core data science courses** (SQL, Python, Excel, Statistics) remain the backbone of platform engagement and should be prioritized for updates and promotion.  
- **Short, modular courses** achieve the highest completion rates, suggesting this format is effective for retention.  
- Monitoring **low-rated or underperforming courses** can help identify issues early and guide content improvements.  


### Exams & Certificates  

We analyzed student exam performance across three categories — **practice exams, course exams, and career track exams** — to measure learning progress and certification outcomes.  

**Findings:**  
- On average, **2,500 exams are attempted monthly**, with spikes in **August (~7,000 attempts)** and **October (~5,000)** due to platform-wide free access days and campaigns. The overall trend is upward, reflecting growing student engagement.  

![Monthly Exam Attempts](https://github.com/user-attachments/assets/ac9c0010-b2a7-4012-8b47-d60e9b1904ee)

- **Practice exams**: Designed as preparation rather than official grades, they show a **~70% pass rate**. Around 30% of attempts fall below the 60% benchmark, with failure rates slightly higher in August and October when exam activity surged.  

![Practice Exam Performance](https://github.com/user-attachments/assets/8605d985-721e-41ba-8b40-c554c5665d0b)

- **Course exams**: Pass rates are also ~70% on average, but dropped closer to **60% in August** due to a large influx of unprepared students attempting exams during free access days. This suggests that some students attempt official exams without completing prerequisite lectures.  

![Course Exam Performance](https://github.com/user-attachments/assets/1a61ac03-90a3-4c39-897d-cc0ac429b7d3)

- **Career track exams**: Much less frequent (**5–15 attempts per month**, 36 in August). Pass rates are noticeably lower than practice or course exams, reflecting the higher difficulty of integrating material from all seven courses in a track.  

![Career Track Exam Performance](https://github.com/user-attachments/assets/34a721e8-6d0a-4054-93fb-9240ce9096ba)

**Implications:**  
- Campaigns and free-access days increase exam activity but may **reduce pass rates**, as more unprepared students attempt exams.  
- **Practice exams** serve their role well, though failure rates highlight the need for better preparatory material or guidance.  
- **Career track exams** remain a bottleneck: low participation and pass rates suggest students focus more on individual courses than full tracks. Additional analysis (e.g., time spent on exams) could reveal whether extending exam duration improves results.  


### Certificates & Career Track Funnel  

We examined the issuance of course and career track certificates and analyzed the funnel from track enrollment to completion.  

**Findings:**  
- Over the full period, **~3,600 certificates** were issued (including both course and career track).  
- The number of **course certificates** increased steadily month-over-month, reflecting rising student registrations and sustained engagement. This trend closely follows the pattern of **course exam attempts**, since passing a course exam automatically issues a certificate.  

![Course Certificates Monthly](https://github.com/user-attachments/assets/2ad7d539-cb3f-4961-8943-9a246157b661)

- Some discrepancies exist between **exams passed** and **certificates issued** due to delays, corrections, or retakes. For example, in January 99 course exams were passed but only 91 certificates issued.  

![Course Certificates Discrepancies](https://github.com/user-attachments/assets/d7863c08-a568-4600-8046-e09bc14e966f)

- **Career track certificates** were far fewer and not present in all months. No certificates appeared in the first two months, which is expected given that completing nine courses typically takes ~9 months of study.  

![Career Track Certificates](https://github.com/user-attachments/assets/9313dcb9-e647-4f05-b83e-5a171186e7c7)

- Funnel analysis shows significant attrition:  
  - **7,900 students enrolled** in a career track.  
  - **<12% attempted a course exam** within their track.  
  - **~0.94% attempted a track exam**, reflecting the difficulty of completing nine courses.  
  - **43 students (0.54%) passed a track exam**, representing ~60% of those who attempted it.  

![Career Track Funnel](https://github.com/user-attachments/assets/91fe3721-365b-4368-a772-e79f8d62a8d2)

- Completion rates by track varied:  
  - **Business Analyst**: 1.0% completion (12 students)  
  - **Data Scientist**: 0.53% completion (16 students)  
  - **Data Analyst**: 0.38% completion (15 students)  
  Interest was highest in Data Analyst, but completion rates were lowest — highlighting the difficulty of this track.  

**Implications:**  
- The strong growth in **course certificates** reflects healthy student engagement and value delivered at the course level.  
- However, the **career track funnel has steep drop-offs**: most students disengage before their first exam, and fewer than 1% complete a track.  
- Factors include: the long time commitment (nine courses), exam difficulty, and low sustained engagement.  
- Initiatives such as **gamification** and **social learning features** were introduced to improve motivation and reduce attrition, but continued monitoring is required to evaluate their impact.  

---

## 🔹 Conclusion  

This analysis provided a comprehensive view of student behavior on the learning platform across engagement, retention, content consumption, course performance, conversion, and certification. Key takeaways include:  

- **Engagement Growth:** Student engagement showed a steady upward trend throughout the year, boosted by campaigns (free access in August, gamification in September, marketing in October).  
- **Retention Challenges:** Free users churn quickly, with only ~3% retained after one month, while paid users retain more steadily (~30% on average). Gamification improved onboarding but long-term retention still lags.  
- **Content Consumption:** Free students nearly consume all unlocked content (~21 of 30 minutes), while paid students average ~9 hours (~2–3 courses). Paid users consistently complete ~1 course per month.  
- **Course Performance:** Foundational courses (SQL, Python, Excel, Statistics) drive the most engagement. Shorter and newer courses achieve higher completion rates, while overall satisfaction remains high (4.8/5 average rating).  
- **Free-to-Paid Conversion:** Conversion likelihood peaks after ~2 hours of content, highlighting the importance of surfacing relevant, high-quality courses early in the student journey.  
- **Certificates & Career Tracks:** ~3,600 certificates were issued, mostly course-level. Career track completion remains low (<1% of enrollees), reflecting the difficulty and long time commitment required.  

**Overall, the platform demonstrates strong student demand and satisfaction, but opportunities remain to improve retention, optimize free-to-paid conversion, and support long-term certification outcomes.**  

---

✨ **Author:** Chin Wei Ru  
