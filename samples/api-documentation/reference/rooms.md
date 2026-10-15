# Rooms

Use the Rooms endpoints to search for available rooms and retrieve details
about a single room.

## The room object

| Field | Type | Description |
| --- | --- | --- |
| `id` | string | Unique room ID, for example `rm_1042` |
| `name` | string | Display name of the room |
| `type` | string | One of `standard`, `deluxe` or `suite` |
| `max_guests` | integer | Maximum number of guests the room sleeps |
| `price_per_night` | object | Price per night. Contains `amount` (integer, in whole currency units) and `currency` (ISO 4217 code) |
| `amenities` | array of strings | Amenities included, for example `wifi` or `breakfast` |

```json
{
  "id": "rm_1042",
  "name": "Deluxe Garden View",
  "type": "deluxe",
  "max_guests": 3,
  "price_per_night": { "amount": 4500, "currency": "INR" },
  "amenities": ["wifi", "air_conditioning", "breakfast"]
}
```

## List available rooms

```http
GET /rooms
```

Returns the rooms that are available for the dates and number of guests you
specify. Results are [paginated](../rate-limits-and-pagination.md).

### Query parameters

| Parameter | Type | Required | Description |
| --- | --- | --- | --- |
| `check_in` | string (date) | Yes | Check-in date in `YYYY-MM-DD` format |
| `check_out` | string (date) | Yes | Check-out date in `YYYY-MM-DD` format. Must be after `check_in` |
| `guests` | integer | No | Number of guests, from 1 to 10. Default: `1` |
| `page` | integer | No | Page number, starting at 1. Default: `1` |
| `limit` | integer | No | Results per page, from 1 to 50. Default: `20` |

### Example request

```bash
curl "https://sandbox.stayeasy.example.com/v1/rooms?check_in=2026-11-10&check_out=2026-11-12&guests=2" \
  -H "Authorization: Bearer YOUR_API_KEY"
```

### Example response

`200 OK`

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

### Errors

| Status | Error code | Cause |
| --- | --- | --- |
| `400` | `invalid_request` | A date is missing or badly formatted, or `check_out` is not after `check_in` |
| `401` | `unauthorized` | The API key is missing or invalid |
| `429` | `rate_limited` | You exceeded the rate limit |

## Retrieve a room

```http
GET /rooms/{room_id}
```

Returns a single room.

### Path parameters

| Parameter | Type | Description |
| --- | --- | --- |
| `room_id` | string | The room ID, for example `rm_1042` |

### Example request

```bash
curl "https://sandbox.stayeasy.example.com/v1/rooms/rm_1042" \
  -H "Authorization: Bearer YOUR_API_KEY"
```

### Example response

`200 OK` returns the [room object](#the-room-object).

### Errors

| Status | Error code | Cause |
| --- | --- | --- |
| `401` | `unauthorized` | The API key is missing or invalid |
| `404` | `not_found` | No room exists with that ID |
| `429` | `rate_limited` | You exceeded the rate limit |
