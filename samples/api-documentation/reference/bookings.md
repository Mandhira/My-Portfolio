# Bookings

Use the Bookings endpoints to reserve a room, look up a reservation, and cancel it.

## The booking object

| Field | Type | Description |
| --- | --- | --- |
| `id` | string | Unique booking ID, for example `bk_88213` |
| `status` | string | `confirmed` or `cancelled` |
| `room_id` | string | ID of the booked room |
| `check_in` | string (date) | Check-in date |
| `check_out` | string (date) | Check-out date |
| `guests` | integer | Number of guests |
| `guest` | object | The lead guest. Contains `name` and `email` |
| `total_price` | object | Total cost of the stay. Contains `amount` and `currency` |
| `created_at` | string (date-time) | When the booking was created, in UTC |

```json
{
  "id": "bk_88213",
  "status": "confirmed",
  "room_id": "rm_1042",
  "check_in": "2026-11-10",
  "check_out": "2026-11-12",
  "guests": 2,
  "guest": { "name": "Priya Raman", "email": "priya.raman@example.com" },
  "total_price": { "amount": 9000, "currency": "INR" },
  "created_at": "2026-10-13T08:15:00Z"
}
```

## Create a booking

```http
POST /bookings
```

Reserves a room for the dates you specify.

### Headers

| Header | Required | Description |
| --- | --- | --- |
| `Authorization` | Yes | `Bearer YOUR_API_KEY` |
| `Content-Type` | Yes | `application/json` |
| `Idempotency-Key` | No | A unique string, such as a UUID. Lets you retry safely without creating duplicate bookings |

### Request body

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `room_id` | string | Yes | ID of the room to book |
| `check_in` | string (date) | Yes | Check-in date in `YYYY-MM-DD` format |
| `check_out` | string (date) | Yes | Check-out date. Must be after `check_in` |
| `guests` | integer | Yes | Number of guests. Cannot exceed the room's `max_guests` |
| `guest.name` | string | Yes | Full name of the lead guest |
| `guest.email` | string | Yes | Email address for the confirmation |

### Example request

```bash
curl -X POST "https://sandbox.stayeasy.example.com/v1/bookings" \
  -H "Authorization: Bearer YOUR_API_KEY" \
  -H "Content-Type: application/json" \
  -H "Idempotency-Key: 3f2b8c1e-5d4a-4c1b-9a7e-2b6f0d9e1a44" \
  -d '{
    "room_id": "rm_1042",
    "check_in": "2026-11-10",
    "check_out": "2026-11-12",
    "guests": 2,
    "guest": { "name": "Priya Raman", "email": "priya.raman@example.com" }
  }'
```

### Example response

`201 Created` returns the [booking object](#the-booking-object).

### Errors

| Status | Error code | Cause | Fix |
| --- | --- | --- | --- |
| `400` | `invalid_request` | A required field is missing, a date is badly formatted, or `guests` is above the room's limit | Check the request body against the table above |
| `401` | `unauthorized` | The API key is missing or invalid | See [Authentication](../authentication.md) |
| `404` | `not_found` | The `room_id` does not exist | Get a valid ID from `GET /rooms` |
| `409` | `room_unavailable` | The room was booked for some or all of those dates | Search again and choose another room or dates |
| `429` | `rate_limited` | You exceeded the rate limit | Wait for the number of seconds in the `Retry-After` header |

## Retrieve a booking

```http
GET /bookings/{booking_id}
```

Returns a single booking.

| Parameter | Type | Description |
| --- | --- | --- |
| `booking_id` | string | The booking ID, for example `bk_88213` |

### Example request

```bash
curl "https://sandbox.stayeasy.example.com/v1/bookings/bk_88213" \
  -H "Authorization: Bearer YOUR_API_KEY"
```

`200 OK` returns the [booking object](#the-booking-object). Possible errors are
`401`, `404` and `429`.

## Cancel a booking

```http
DELETE /bookings/{booking_id}
```

Cancels a booking. The booking is not deleted. Its `status` changes to
`cancelled`, and the room becomes available again for those dates.

### Example request

```bash
curl -X DELETE "https://sandbox.stayeasy.example.com/v1/bookings/bk_88213" \
  -H "Authorization: Bearer YOUR_API_KEY"
```

`200 OK` returns the booking with `"status": "cancelled"`.

### Errors

| Status | Error code | Cause |
| --- | --- | --- |
| `401` | `unauthorized` | The API key is missing or invalid |
| `404` | `not_found` | No booking exists with that ID |
| `409` | `already_cancelled` | The booking is already cancelled |
| `429` | `rate_limited` | You exceeded the rate limit |
