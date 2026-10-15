# Hands-on lab: Retrieve data with SQL

**Time:** 25 minutes
**Work:** On your own or in a pair
**What you need:** A SQLite tool with the `bookings` table loaded

In this lab, you will answer real questions about hotel bookings by writing SQL.
Each part ends with a **Check your result** box, so you know straight away
whether your query is right.

## Before you start

1. Open your SQLite tool.
2. Open the file `stayeasy-lab.sql` and run it. This creates the `bookings` table.
3. Run this query:

   ```sql
   SELECT COUNT(*) FROM bookings;
   ```

   **Check your result:** The answer is `20`. If you see a different number or an error, ask the facilitator for help before you continue.

The `bookings` table has these columns:

| Column | What it holds |
| --- | --- |
| `booking_id` | A unique number for each booking |
| `guest_name` | The guest's name |
| `room_type` | `standard`, `deluxe` or `suite` |
| `check_in` | The check-in date, as `YYYY-MM-DD` |
| `nights` | The number of nights |
| `price_per_night` | The price for one night, in rupees |
| `status` | `confirmed`, `pending` or `cancelled` |

## Part 1: Choose columns

**You will:** Show only the columns you need.

1. Show every column and every row:

   ```sql
   SELECT * FROM bookings;
   ```

   **Check your result:** You see 20 rows and 7 columns.

2. Show three columns only:

   ```sql
   SELECT guest_name, room_type, status FROM bookings;
   ```

   **Check your result:** You see 20 rows and 3 columns.

3. **Your turn.** Write a query that shows only `guest_name` and `check_in`.

   **Check your result:** The first row is `Priya Raman` with `2026-11-10`. The second row is `Arjun Mehta` with `2026-11-10`.

## Part 2: Filter rows

**You will:** Keep only the rows you want.

1. Show the name and nights for every suite booking:

   ```sql
   SELECT guest_name, nights FROM bookings WHERE room_type = 'suite';
   ```

   **Check your result:** You see 5 rows. The first row is `Lena Fischer` with 4 nights.

2. Show the guest name and check-in date for bookings that are confirmed **and** last 3 nights or more:

   ```sql
   SELECT guest_name, check_in FROM bookings
   WHERE status = 'confirmed' AND nights >= 3;
   ```

   **Check your result:** You see 7 rows.

3. Show bookings that are pending **or** cancelled:

   ```sql
   SELECT guest_name, status FROM bookings
   WHERE status = 'pending' OR status = 'cancelled';
   ```

   **Check your result:** You see 7 rows, made up of 4 pending and 3 cancelled bookings.

4. **Your turn.** Show the `guest_name` and `price_per_night` for standard rooms that cost less than 2800 per night.

   **Check your result:** You see 3 rows: `Daniel Okafor`, `Hannah Muller` and `Ibrahim Bello`. Each costs 2600.

## Part 3: Sort results

**You will:** Put the results in the order you want.

1. Show guests with the longest stays first:

   ```sql
   SELECT guest_name, nights FROM bookings ORDER BY nights DESC;
   ```

   **Check your result:** The first row is `Daniel Okafor` with 5 nights.

2. **Your turn.** Show the `guest_name` and `price_per_night` for confirmed bookings. Put the highest price first. When two prices are the same, put the names in alphabetical order.

   **Hint:** You can sort by two columns, separated by a comma.

   **Check your result:** The first three rows are `Lena Fischer`, `Mei Tan` and `Yusuf Ali`, all at 9200. The fourth row is `Anika Rao` at 4700.

## Part 4: Summarise data

**You will:** Count, add and average, then group the results.

1. Count the pending bookings:

   ```sql
   SELECT COUNT(*) AS pending_bookings FROM bookings WHERE status = 'pending';
   ```

   **Check your result:** The answer is `4`.

2. Find the average price per night for deluxe rooms:

   ```sql
   SELECT AVG(price_per_night) AS average_price FROM bookings WHERE room_type = 'deluxe';
   ```

   **Check your result:** The answer is about `4585.71`. Your tool may show more or fewer decimal places.

3. Count the bookings for each status:

   ```sql
   SELECT status, COUNT(*) AS bookings FROM bookings GROUP BY status;
   ```

   **Check your result:** You see 3 rows: cancelled `3`, confirmed `13` and pending `4`.

4. **Your turn.** Show the average number of nights for each room type.

   **Check your result:** You see 3 rows. Deluxe is about `2.29`, standard is `2.75` and suite is `2.4`.

## Challenge (if you finish early)

Which room type has the highest total value of **confirmed** bookings? The value of
one booking is `nights * price_per_night`. Use `SUM`, `WHERE` and `GROUP BY`, and
sort the results.

**Hint:** You can do arithmetic inside `SUM`, for example `SUM(nights * price_per_night)`.

**Check your result:** The top row is `suite` with a total of `73600`. Then come deluxe `60300` and standard `45200`.

## Troubleshooting

| What you see | Why it happens | How to fix it |
| --- | --- | --- |
| `near "status": syntax error` (or another word in the message) | A comma is missing, or two words are in the wrong order. SQL points to the word where it got stuck. | Look at the word named in the message and the one before it. Add the missing comma or fix the order. |
| `near "FROM": syntax error` | There is an extra comma before `FROM`, for example `SELECT guest_name, FROM bookings`. | Remove the last comma in the column list. |
| `no such column: suite` | Text values need single quotes. Without quotes, SQL looks for a column called `suite`. | Write `'suite'` with single quotes. |
| `no such column: guest` | The column name is misspelled. | Check the spelling against the column table at the top of this lab. |
| `no such table: booking` | The table name is misspelled. It is `bookings`, with an s. | Correct the spelling. |
| `near "WHERE": syntax error` after `ORDER BY` | The clauses are in the wrong order. | Use this order: `SELECT`, `FROM`, `WHERE`, `GROUP BY`, `ORDER BY`. |
| No error, but you see 0 rows | The text does not match exactly. SQL treats `'Confirmed'` and `'confirmed'` as different. | Check the capital letters and spelling inside the quotes. |
| No error, but a column has the wrong name | A comma is missing between two column names, so SQL used the second name as a new label. | Add the comma, and check that the result shows every column you asked for. |

## What you practised

- Choosing columns with `SELECT`
- Filtering rows with `WHERE`, `AND` and `OR`
- Sorting with `ORDER BY`
- Counting, adding and averaging with `COUNT`, `SUM` and `AVG`, and grouping with `GROUP BY`
