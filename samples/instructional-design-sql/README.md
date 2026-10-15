# Retrieve data with SQL: a 2-hour beginner lesson

A complete lesson package for teaching beginners to answer questions from a
database with SQL. It includes learning objectives, a timed lesson plan, a
hands-on lab, an assessment with an answer key, and an evaluation plan.

> **Sample project.** I designed this lesson to show my instructional design
> process from objectives through to evaluation. The booking data is made up.
> I ran every query in the lab, assessment and answer key to check the results.

## At a glance

| | |
| --- | --- |
| **Audience** | New analysts, support staff and business users who work with booking data and have never written SQL |
| **Prerequisites** | Comfortable with spreadsheets (sorting, filtering and totals). No programming experience needed |
| **Duration** | 2 hours, in one session |
| **Format** | Facilitator-led, with live demonstrations and hands-on practice |
| **Tools** | A free SQLite tool, such as DB Browser for SQLite, or any SQL tool the organisation already uses |
| **Group size** | Up to 12 learners, so the facilitator can check each learner's work during practice |

## The learning need

People who work with booking data often need quick answers, such as "How many
bookings are still pending?" or "Which room type earns the most?" They wait for
a developer or analyst to run the query. This lesson teaches them to answer
these questions themselves.

## Learning objectives

By the end of the lesson, learners will be able to:

| # | Objective | Level of thinking |
| --- | --- | --- |
| 1 | **Describe** a table, a row and a column in a relational database | Understand |
| 2 | **Write** a `SELECT` statement that returns chosen columns from a table | Apply |
| 3 | **Filter** rows using `WHERE` with comparison operators, `AND` and `OR` | Apply |
| 4 | **Sort** results using `ORDER BY` in ascending and descending order | Apply |
| 5 | **Summarise** data using `COUNT`, `SUM` and `AVG`, and group the results with `GROUP BY` | Apply |

## How the parts fit together

Every objective is taught, practised and assessed. This table checks that
nothing is taught without being assessed, and nothing is assessed without being
taught.

| Objective | Lesson segment | Lab part | Assessment items |
| --- | --- | --- | --- |
| 1. Describe tables, rows and columns | 2. Tables, rows and columns | Part 1 | Questions 1 and 2 |
| 2. Choose columns with `SELECT` | 3. Choosing columns with SELECT | Part 1 | Question 3, Task 1 |
| 3. Filter with `WHERE`, `AND`, `OR` | 4. Filtering rows with WHERE | Part 2 | Questions 4 and 5, Task 1 |
| 4. Sort with `ORDER BY` | 6. Sorting and summarising | Part 3 | Question 6, Task 2 |
| 5. Summarise and group | 6. Sorting and summarising | Part 4 | Questions 7 and 8, Task 3 |

## What is in this package

| File | Who uses it | Purpose |
| --- | --- | --- |
| [Lesson plan](lesson-plan.md) | Facilitator | Timed agenda, demonstrations, questions to ask and what to do if time runs short |
| [Hands-on lab](hands-on-lab.md) | Learners | Guided practice with the booking data and a way to check each result |
| [Assessment](assessment.md) | Learners | 8 multiple-choice questions and 3 practical tasks |
| [Answer key](answer-key.md) | Facilitator | Correct answers, scoring guide and what to review when a learner struggles |
| [Practice data](lab-data/stayeasy-lab.sql) | Facilitator and learners | A script that creates the `bookings` table with 20 rows |

## Evaluation plan

| Level | Question | Method | Success measure |
| --- | --- | --- | --- |
| Reaction | Did learners find the lesson useful and clear? | A 3-question survey at the end of the session | At least 80% rate the lesson 4 or 5 out of 5 |
| Learning | Can learners write queries correctly? | The assessment, scored with the answer key | At least 70% of learners score 14 out of 20 or more |
| Behaviour | Do learners use SQL in their work? | A short follow-up message 4 weeks later, asking for one query they wrote at work | At least half of learners report using SQL |

**Survey questions**

1. The lesson was clear and easy to follow. (1 to 5)
2. The practice activities helped me learn. (1 to 5)
3. What is one thing that would make this lesson better? (open answer)

## Pilot results

> **Status: not yet piloted.** This lesson was designed on paper and has not been
> run with learners. The tables below are ready to fill in after the first
> session. Results go in only when they come from real learners.

### Session details

| Item | Details |
| --- | --- |
| Date | [add] |
| Learners | [number of learners and their job roles] |
| Facilitator | [add] |
| Format | [in person or online] |
| SQL tool used | [add] |

### Level 1: Reaction

| Measure | Target | Result |
| --- | --- | --- |
| Learners who rated survey question 1 as 4 or 5 | At least 80% | [add] |
| Learners who rated survey question 2 as 4 or 5 | At least 80% | [add] |
| Average rating for question 1 and question 2 | No target | [add] |
| Main themes in the answers to question 3 | No target | [add] |

### Level 2: Learning

| Measure | Target | Result |
| --- | --- | --- |
| Learners who took the assessment | All learners | [add] |
| Average score, out of 20 | No target | [add] |
| Learners who scored 14 or more | At least 70% of learners | [add] |

**Score for each objective**

| Objective | Assessment items | Points available | Average points | Percentage of points |
| --- | --- | --- | --- | --- |
| 1. Describe tables, rows and columns | Questions 1 and 2 | 2 | [add] | [add] |
| 2. Choose columns with `SELECT` | Question 3, Task 1 | 5 | [add] | [add] |
| 3. Filter with `WHERE`, `AND`, `OR` | Questions 4 and 5, Task 1 | 6 | [add] | [add] |
| 4. Sort with `ORDER BY` | Question 6, Task 2 | 5 | [add] | [add] |
| 5. Summarise and group | Questions 7 and 8, Task 3 | 6 | [add] | [add] |

Task 1 counts toward objectives 2 and 3, so the points available add up to more
than 20.

### Level 3: Behaviour, 4 weeks later

| Measure | Target | Result |
| --- | --- | --- |
| Learners contacted | All learners | [add] |
| Learners who used SQL at work | At least half | [add] |
| Examples of queries written at work | No target | [add] |

### What I changed because of the results

| Finding | Evidence | Change to the lesson |
| --- | --- | --- |
| [add] | [add] | [add] |

### How to work out each result

- **Percentage of learners:** divide the number of learners by the total, then multiply by 100. For example, 9 of 12 learners is 75%.
- **Average score:** add up every learner's score, then divide by the number of learners.
- **Average points for an objective:** add up each learner's points on the items for that objective, then divide by the number of learners. To get the percentage, divide the average by the points available and multiply by 100.
- **Report the group size next to every result.** With fewer than 10 learners, give the number ("6 of 8") and not only a percentage.
- **Compare each result with its target,** and decide what to change in the lesson. The answer key suggests where to look when many learners miss the same item.

## Design notes

- **Practice follows every new idea.** Learners write a query within a few minutes of seeing each new concept, instead of listening for a long stretch.
- **One dataset throughout.** The same `bookings` table is used in the demonstrations, lab and assessment, so learners spend their effort on SQL and not on learning a new dataset.
- **Errors are taught on purpose.** The lab lists the most common error messages and their fixes, because beginners spend a lot of time stuck on small mistakes.
- **Accessibility.** All materials are plain text and can be read with a screen reader. Facilitators should read out each demonstration query as they type it, and share the queries in a document so learners can copy them.
