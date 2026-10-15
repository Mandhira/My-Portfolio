# Lesson plan: Retrieve data with SQL

**Duration:** 2 hours (120 minutes)
**Audience:** Beginners with no SQL experience
**Facilitator:** One facilitator for up to 12 learners

## Before the session

- Install a SQLite tool on every learner's computer, such as DB Browser for SQLite.
- Open [`stayeasy-lab.sql`](lab-data/stayeasy-lab.sql) in the tool and run it. Then run `SELECT COUNT(*) FROM bookings;`. You should see `20`.
- Share the [hands-on lab](hands-on-lab.md) and the [assessment](assessment.md) with learners. Do **not** share the [answer key](answer-key.md).
- Display the practice queries below in a shared document so learners can copy them.

## Agenda

| Time | Segment | Minutes | Objective |
| --- | --- | --- | --- |
| 0:00 | 1. Welcome and warm-up | 5 | |
| 0:05 | 2. Tables, rows and columns | 10 | 1 |
| 0:15 | 3. Choosing columns with SELECT | 15 | 2 |
| 0:30 | 4. Filtering rows with WHERE | 15 | 3 |
| 0:45 | 5. Break | 5 | |
| 0:50 | 6. Sorting and summarising | 20 | 4, 5 |
| 1:10 | 7. Hands-on lab | 25 | 1 to 5 |
| 1:35 | 8. Assessment | 15 | 1 to 5 |
| 1:50 | 9. Wrap-up and survey | 10 | |

## Segment details

### 1. Welcome and warm-up (5 minutes)

**Do:** Welcome learners and state the goal: "By the end of today, you will answer questions from booking data yourself." Show the five objectives from the [README](README.md).

**Ask:** "Who has sorted or filtered data in a spreadsheet?" Most hands will go up. Say: "SQL does the same things, with words instead of buttons."

### 2. Tables, rows and columns (10 minutes)

**Do:** Open the `bookings` table in the tool. Point out:

- the **table**: a collection of related data, like one spreadsheet sheet,
- a **column**: one kind of information, such as `status`,
- a **row**: one complete record, such as one booking.

**Learners do:** In pairs, answer: "How many columns does the table have? What does row 3 describe?" (7 columns. Row 3 is Lena Fischer's suite booking.)

**Check:** Ask two pairs to share. Correct any confusion between rows and columns before moving on, because later segments depend on it.

### 3. Choosing columns with SELECT (15 minutes)

**Demonstrate**, saying each query aloud as you type it:

```sql
SELECT * FROM bookings;
```

"`SELECT` says what to show. `*` means all columns. `FROM` says which table. The semicolon ends the query."

```sql
SELECT guest_name, room_type, status FROM bookings;
```

"Now I list the columns I want, separated by commas."

**Learners do (5 minutes):** Write a query that shows only `guest_name` and `check_in`.

**Check:** Walk around the room. If a learner has an error, ask them to read the error message aloud before you help.

**Common mistake:** A missing comma between columns. Type `SELECT guest_name room_type status FROM bookings;` on purpose. The tool shows `near "status": syntax error`. Fix it by adding the commas. Warn learners about a quieter version of this mistake: with only two columns, `SELECT guest_name room_type FROM bookings;` runs without an error, but it shows only the guest names, with the column renamed to `room_type`. Always check that the result has the columns you asked for.

### 4. Filtering rows with WHERE (15 minutes)

**Demonstrate:**

```sql
SELECT guest_name, nights FROM bookings WHERE room_type = 'suite';
```

"`WHERE` keeps only the rows that match. Text goes in single quotes."

```sql
SELECT guest_name, check_in FROM bookings
WHERE status = 'confirmed' AND nights >= 3;
```

"`AND` means both conditions must be true."

```sql
SELECT guest_name, status FROM bookings
WHERE status = 'pending' OR status = 'cancelled';
```

"`OR` means at least one condition must be true."

**Learners do (5 minutes):** Show the guest name and nights for all deluxe bookings with at least 2 nights.

**Ask:** "What would change if I used `OR` instead of `AND` in the second query?" (More rows, because a row only needs to match one condition. Run it to show 14 rows instead of 7.)

**Common mistake:** Forgetting the quotes around text, such as `room_type = suite`. Show the error `no such column: suite` and explain that without quotes, SQL looks for a column.

### 5. Break (5 minutes)

### 6. Sorting and summarising (20 minutes)

**Demonstrate sorting (5 minutes):**

```sql
SELECT guest_name, price_per_night FROM bookings
ORDER BY price_per_night DESC, guest_name ASC;
```

"`ORDER BY` sorts the results. `DESC` is highest first, `ASC` is lowest first. The second sort column breaks ties."

**Demonstrate summarising (10 minutes):**

```sql
SELECT COUNT(*) AS confirmed_bookings FROM bookings WHERE status = 'confirmed';
```

"`COUNT(*)` counts rows. `AS` gives the result a readable name." (Result: 13.)

```sql
SELECT SUM(nights) AS total_nights FROM bookings WHERE status = 'confirmed';
SELECT AVG(nights) AS average_nights FROM bookings;
```

(Results: 38 and 2.5.)

```sql
SELECT room_type, COUNT(*) AS bookings FROM bookings GROUP BY room_type;
```

"`GROUP BY` makes one row for each room type, and `COUNT(*)` counts each group." (Results: deluxe 7, standard 8, suite 5.)

**Learners do (5 minutes):** Show how many bookings there are for each status.

**Check:** Ask learners to say in their own words what `GROUP BY` does. Use a spreadsheet comparison: "It works like a pivot table."

### 7. Hands-on lab (25 minutes)

**Do:** Learners work through the [hands-on lab](hands-on-lab.md) on their own or in pairs. Each part ends with a result check, so learners know straight away whether their query is right.

**Facilitator:** Move around the room and check progress. If a learner is stuck for more than 3 minutes, point to the troubleshooting table in the lab and ask them to find the matching error. Learners who finish early can try the lab challenge.

### 8. Assessment (15 minutes)

**Do:** Learners complete the [assessment](assessment.md) individually, without notes. They may use the SQL tool for the practical tasks. Collect answers and score them using the [answer key](answer-key.md).

### 9. Wrap-up and survey (10 minutes)

**Do:** Recap the five objectives and ask each learner to name one question from their own work that they can now answer with SQL. Share the next steps: practise with their own data, and ask for the follow-up message in 4 weeks. Learners complete the 3-question survey from the [README](README.md).

## If time runs short

| Problem | What to do |
| --- | --- |
| Segment 3 or 4 runs over by more than 5 minutes | Skip the `OR` demonstration. Learners still practise it in the lab |
| The group needs more practice before the lab | Make the lab a pair activity and shorten the assessment practical tasks to Tasks 1 and 3 |
| Less than 100 minutes available | Move the assessment to the end of the lab, as homework, and skip the survey. Send it by email |
