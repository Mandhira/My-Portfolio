# Answer key: Retrieve data with SQL

**For the facilitator only. Do not share with learners before the assessment.**

**Total:** 20 points. **Pass mark:** 14 points (70%).

Every result below was produced by running the query against the practice data in
[`stayeasy-lab.sql`](lab-data/stayeasy-lab.sql).

## Part A: Questions (1 point each)

| # | Answer | Objective | Why the answer is correct | Why the other choices are wrong |
| --- | --- | --- | --- | --- |
| 1 | **B** | 1 | A row is one complete record, such as one booking. | A describes a column. C and D are not what a row is. |
| 2 | **D** | 1 | A column holds one kind of information, such as `status`, for every row. | A describes a row. B is incorrect: a column is part of a table, and a table is part of a database. C is incorrect: columns can hold text, numbers and dates. |
| 3 | **C** | 2 | `SELECT` followed by the column names, separated by commas, then `FROM` and the table. | A shows all columns. B uses `SHOW`, which is not a SQL query keyword in this tool. D has the parts in the wrong order. |
| 4 | **A** | 3 | `WHERE` keeps only the rows that match. | `ORDER BY` sorts, `SELECT` chooses columns and `GROUP BY` makes groups. |
| 5 | **B** | 3 | `OR` returns a row when at least one condition is true, and text needs quotes. | A returns no rows, because no booking has two statuses at once. C has no quotes, so SQL looks for a column called `pending`. D uses a comma, which is not allowed here. |
| 6 | **D** | 4 | `ORDER BY nights DESC` puts the highest number first. | A puts the shortest stay first. B and C are errors: `DESC` belongs only with `ORDER BY`. |
| 7 | **A** | 5 | `COUNT(*)` counts the rows that match. | B adds up text, which does not give a count. C is an error: `AVG` needs a column, not `*`. D lists the nights and does not count anything. |
| 8 | **C** | 5 | `GROUP BY` makes one row per status, and `COUNT(*)` counts the rows in each group. | A describes a query with no `GROUP BY`. B and D do not describe grouping. |

## Part B: Practical tasks (4 points each)

### Task 1: confirmed bookings above 4600 per night

**Model answer**

```sql
SELECT guest_name, room_type, price_per_night
FROM bookings
WHERE status = 'confirmed' AND price_per_night > 4600;
```

**Expected result (6 rows)**

| guest_name | room_type | price_per_night |
| --- | --- | --- |
| Lena Fischer | suite | 9200 |
| Mei Tan | suite | 9200 |
| Rohan Das | deluxe | 4700 |
| Nisha Patel | deluxe | 4700 |
| Anika Rao | deluxe | 4700 |
| Yusuf Ali | suite | 9200 |

**Scoring**

| Points | Award when |
| --- | --- |
| 1 | The query selects exactly the three columns |
| 1 | It filters on `status = 'confirmed'`, with quotes |
| 1 | It filters on the price above 4600 |
| 1 | It joins the two conditions with `AND`, and returns the 6 rows above |

**Also accept:** `price_per_night >= 4601`, and the rows in a different order.

### Task 2: pending bookings, longest stay first

**Model answer**

```sql
SELECT guest_name, nights
FROM bookings
WHERE status = 'pending'
ORDER BY nights DESC, guest_name ASC;
```

**Expected result (4 rows, in this order)**

| guest_name | nights |
| --- | --- |
| Omar Haddad | 3 |
| Aisha Khan | 2 |
| Chen Wei | 2 |
| Sofia Rossi | 2 |

**Scoring**

| Points | Award when |
| --- | --- |
| 1 | The query selects exactly `guest_name` and `nights` |
| 1 | It filters on `status = 'pending'` |
| 1 | It sorts by `nights` with `DESC` |
| 1 | It uses a second sort column, `guest_name`, and the rows come back in the order above |

**Also accept:** `guest_name` without `ASC`, because ascending is the default.

### Task 3: confirmed bookings and average nights for each room type

**Model answer**

```sql
SELECT room_type,
       COUNT(*) AS confirmed_bookings,
       AVG(nights) AS average_nights
FROM bookings
WHERE status = 'confirmed'
GROUP BY room_type;
```

**Expected result (3 rows)**

| room_type | confirmed_bookings | average_nights |
| --- | --- | --- |
| deluxe | 5 | 2.6 |
| standard | 5 | 3.4 |
| suite | 3 | about 2.67 |

**Scoring**

| Points | Award when |
| --- | --- |
| 1 | The query selects `room_type` and groups with `GROUP BY room_type` |
| 1 | It uses `COUNT(*)` and gives the result a readable name |
| 1 | It uses `AVG(nights)` and gives the result a readable name |
| 1 | It filters with `WHERE status = 'confirmed'` before `GROUP BY`, and the numbers match the table above |

**Also accept:** `COUNT(booking_id)` instead of `COUNT(*)`, aliases written without `AS`, different alias names, and averages shown to a different number of decimal places.

**Common wrong answer:** Leaving out the `WHERE` line. The counts become 7, 8 and 5, which are all bookings and not only confirmed ones. Ask the learner to read the task again and find the word "confirmed".

## Score summary

| Score | Result | What to do |
| --- | --- | --- |
| 17 to 20 | Strong | Share the next steps and suggest a challenge with their own data |
| 14 to 16 | Pass | Review any task that scored 2 or less |
| Below 14 | Not yet | Offer a short follow-up session on the objectives below |

## What to review when a learner struggles

Add up the points for each objective, then use this table to decide what to revisit.

| Objective | Where it is assessed | If the learner loses points, review |
| --- | --- | --- |
| 1. Describe tables, rows and columns | Questions 1 and 2 | Lesson segment 2. Open the table and ask the learner to point to a row and a column |
| 2. Choose columns with `SELECT` | Question 3, Task 1 | Lab Part 1. Ask the learner to read their query aloud, one word at a time |
| 3. Filter with `WHERE`, `AND`, `OR` | Questions 4 and 5, Task 1 | Lab Part 2. Ask: "Is it possible for one booking to be pending **and** cancelled?" |
| 4. Sort with `ORDER BY` | Question 6, Task 2 | Lab Part 3. Compare ascending and descending results side by side |
| 5. Summarise and group | Questions 7 and 8, Task 3 | Lab Part 4. Compare `GROUP BY` with a pivot table in a spreadsheet |

## Use the results to improve the lesson

- If more than a third of learners miss the same question, the lesson probably did not teach it clearly. Change the lesson, not only the learner's score.
- If learners do well in the questions but poorly in the tasks, add more writing practice and less demonstration.
- Record the average score for each objective after every session, and compare it from one session to the next.
