# Getting started

This guide shows you how to search for a room and create a booking in the
sandbox. It takes about five minutes.

## Before you begin

You need:

- A StayEasy sandbox API key. See [Authentication](authentication.md).
- `curl`, [Postman](https://www.postman.com/), or any HTTP client.

All examples use the sandbox base URL:

```text
https://sandbox.stayeasy.example.com/v1
```

Replace `YOUR_API_KEY` in each example with your own key.

## Step 1: Search for available rooms

Send a `GET` request to `/rooms` with your check-in date, check-out date and
number of guests.

```bash
curl "https://sandbox.stayeasy.example.com/v1/rooms?check_in=2026-11-10&check_out=2026-11-12&guests=2" \
  -H "Authorization: Bearer YOUR_API_KEY"
```

A successful request returns `200 OK` and a list of rooms:

```json
{
  "data": [
    {
      "id": "rm_1042",
      "name": "Deluxe Garden View",
      "type": "deluxe",
      "max_guests": 3,
      "price_per_night": { "amount": 4500, "currency": "INR" },
      "amenities": ["wifi", "air_conditioning", "breakfast"]
    }
  ],
  "page": 1,
  "limit": 20,
  "total": 1
}
```

Note the `id` of the room you want. You use it in the next step.

## Step 2: Create a booking

Send a `POST` request to `/bookings` with the room ID, dates and guest details.

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
    "guest": {
      "name": "Priya Raman",
      "email": "priya.raman@example.com"
    }
  }'
```

A successful request returns `201 Created`:

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

> **Tip:** The `Idempotency-Key` header lets you retry a request safely. If a
> network error stops you from seeing the response, send the same request with
> the same key and you will get the original booking back instead of a
> duplicate.

## Step 3: Retrieve or cancel the booking

Retrieve the booking at any time:

```bash
curl "https://sandbox.stayeasy.example.com/v1/bookings/bk_88213" \
  -H "Authorization: Bearer YOUR_API_KEY"
```

Cancel it with a `DELETE` request. The booking is kept, and its `status`
changes to `cancelled`.

```bash
curl -X DELETE "https://sandbox.stayeasy.example.com/v1/bookings/bk_88213" \
  -H "Authorization: Bearer YOUR_API_KEY"
```

## Next steps

- Read the [Rooms](reference/rooms.md) and [Bookings](reference/bookings.md) references.
- Learn how to handle problems in [Errors](errors.md).
- Check the [rate limits](rate-limits-and-pagination.md) before you go live.
