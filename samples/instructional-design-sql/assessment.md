# Assessment: Retrieve data with SQL

**Time:** 15 minutes
**Score:** 20 points (8 for questions, 12 for tasks)
**Rules:** Work on your own, without notes. You may use the SQL tool for the tasks.

The table is called `bookings`. Its columns are `booking_id`, `guest_name`,
`room_type`, `check_in`, `nights`, `price_per_night` and `status`.

## Part A: Questions (8 points)

Choose **one** answer for each question. Each question is worth 1 point.

**1.** In a database table, what is a row?

- A. One kind of information, such as `status`
- B. One complete record, such as one booking
- C. The name of the table
- D. A condition that filters data

**2.** Which statement about a column is correct?

- A. It holds one complete booking
- B. It is another name for a database
- C. It can only hold numbers
- D. It holds one kind of information for every row

**3.** Which query shows only the `guest_name` and `status` columns?

- A. `SELECT * FROM bookings;`
- B. `SHOW guest_name, status FROM bookings;`
- C. `SELECT guest_name, status FROM bookings;`
- D. `SELECT FROM bookings guest_name, status;`

**4.** Which keyword keeps only the rows that match a condition?

- A. `WHERE`
- B. `ORDER BY`
- C. `SELECT`
- D. `GROUP BY`

**5.** You want every booking that is either pending or cancelled. Which `WHERE` line is correct?

- A. `WHERE status = 'pending' AND status = 'cancelled'`
- B. `WHERE status = 'pending' OR status = 'cancelled'`
- C. `WHERE status = pending OR cancelled`
- D. `WHERE status = 'pending', 'cancelled'`

**6.** Which query lists the bookings with the longest stay first?

- A. `SELECT guest_name, nights FROM bookings ORDER BY nights ASC;`
- B. `SELECT guest_name, nights FROM bookings WHERE nights DESC;`
- C. `SELECT guest_name, nights FROM bookings GROUP BY nights DESC;`
- D. `SELECT guest_name, nights FROM bookings ORDER BY nights DESC;`

**7.** Which query tells you how many bookings are pending?

- A. `SELECT COUNT(*) FROM bookings WHERE status = 'pending';`
- B. `SELECT SUM(status) FROM bookings WHERE status = 'pending';`
- C. `SELECT AVG(*) FROM bookings WHERE status = 'pending';`
- D. `SELECT nights FROM bookings WHERE status = 'pending';`

**8.** What does this query return?

```sql
SELECT status, COUNT(*) FROM bookings GROUP BY status;
```

- A. One row for every booking, showing its status
- B. Only the first status in the table
- C. One row for each status, with the number of bookings that have that status
- D. The total number of bookings, in a single row

## Part B: Practical tasks (12 points)

Write a query for each task. Each task is worth 4 points. Write your queries below
each task, or in a separate document.

**Task 1.** Show the `guest_name`, `room_type` and `price_per_night` for bookings that are **confirmed** and have a `price_per_night` **above 4600**.

**Task 2.** Show the `guest_name` and `nights` for all **pending** bookings. Put the longest stay first. When two stays are the same length, put the names in alphabetical order.

**Task 3.** For each room type, show the number of **confirmed** bookings and the average number of nights. Give the two results readable names.
