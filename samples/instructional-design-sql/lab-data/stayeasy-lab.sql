-- Practice data for the "Retrieve data with SQL" lesson.
-- All names and bookings are made up.
-- Run this script once to create the table and fill it with 20 rows.

DROP TABLE IF EXISTS bookings;

CREATE TABLE bookings (
  booking_id      INTEGER PRIMARY KEY,
  guest_name      TEXT    NOT NULL,
  room_type       TEXT    NOT NULL,  -- standard, deluxe or suite
  check_in        TEXT    NOT NULL,  -- date in YYYY-MM-DD format
  nights          INTEGER NOT NULL,
  price_per_night INTEGER NOT NULL,  -- in rupees
  status          TEXT    NOT NULL   -- confirmed, pending or cancelled
);

INSERT INTO bookings
  (booking_id, guest_name, room_type, check_in, nights, price_per_night, status)
VALUES
  (1,  'Priya Raman',    'deluxe',   '2026-11-10', 2, 4500, 'confirmed'),
  (2,  'Arjun Mehta',    'standard', '2026-11-10', 3, 2800, 'confirmed'),
  (3,  'Lena Fischer',   'suite',    '2026-11-11', 4, 9200, 'confirmed'),
  (4,  'Tomas Silva',    'standard', '2026-11-12', 1, 2800, 'cancelled'),
  (5,  'Aisha Khan',     'deluxe',   '2026-11-12', 2, 4500, 'pending'),
  (6,  'Daniel Okafor',  'standard', '2026-11-13', 5, 2600, 'confirmed'),
  (7,  'Mei Tan',        'suite',    '2026-11-14', 2, 9200, 'confirmed'),
  (8,  'Rohan Das',      'deluxe',   '2026-11-15', 3, 4700, 'confirmed'),
  (9,  'Sofia Rossi',    'standard', '2026-11-15', 2, 2800, 'pending'),
  (10, 'Karthik Iyer',   'deluxe',   '2026-11-16', 1, 4500, 'cancelled'),
  (11, 'Hannah Muller',  'standard', '2026-11-17', 4, 2600, 'confirmed'),
  (12, 'Omar Haddad',    'suite',    '2026-11-18', 3, 9500, 'pending'),
  (13, 'Nisha Patel',    'deluxe',   '2026-11-19', 2, 4700, 'confirmed'),
  (14, 'Lucas Martin',   'standard', '2026-11-20', 2, 2800, 'confirmed'),
  (15, 'Grace Lee',      'suite',    '2026-11-21', 1, 9500, 'cancelled'),
  (16, 'Ibrahim Bello',  'standard', '2026-11-22', 3, 2600, 'confirmed'),
  (17, 'Anika Rao',      'deluxe',   '2026-11-23', 4, 4700, 'confirmed'),
  (18, 'Chen Wei',       'standard', '2026-11-24', 2, 2800, 'pending'),
  (19, 'Maria Garcia',   'deluxe',   '2026-11-25', 2, 4500, 'confirmed'),
  (20, 'Yusuf Ali',      'suite',    '2026-11-26', 2, 9200, 'confirmed');
