# Errors

The API uses standard HTTP status codes. Codes in the `2xx` range mean the
request succeeded. Codes in the `4xx` range mean there was a problem with the
request.

## Error format

Every error response has the same JSON structure:

```json
{
  "error": {
    "code": "room_unavailable",
    "message": "The room is not available for the selected dates."
  }
}
```

| Field | Description |
| --- | --- |
| `error.code` | A stable, machine-readable code. Use this in your code to decide what to do |
| `error.message` | A human-readable explanation. It may change, so don't match on it |

## Status codes

| Status | Meaning | Common cause | What to do |
| --- | --- | --- | --- |
| `200 OK` | Success | | |
| `201 Created` | A resource was created | | |
| `400 Bad Request` | The request is invalid | Missing field, bad date format, `check_out` not after `check_in` | Fix the request and send it again |
| `401 Unauthorized` | Authentication failed | Missing, invalid or deleted API key | Check your key. See [Authentication](authentication.md) |
| `404 Not Found` | The resource does not exist | Wrong room or booking ID | Check the ID |
| `409 Conflict` | The request conflicts with current state | Room already booked, or booking already cancelled | Search again or check the booking's `status` |
| `429 Too Many Requests` | Rate limit exceeded | Too many requests in a short time | Wait, then retry. See [Rate limits](rate-limits-and-pagination.md) |
| `500 Internal Server Error` | Something went wrong on our side | | Retry after a short delay. If it continues, contact support |

## Error codes

| Code | Status | Description |
| --- | --- | --- |
| `invalid_request` | `400` | The request is invalid. The `message` says which field is the problem |
| `unauthorized` | `401` | The API key is missing or invalid |
| `not_found` | `404` | The room or booking does not exist |
| `room_unavailable` | `409` | The room is not available for the selected dates |
| `already_cancelled` | `409` | The booking is already cancelled |
| `rate_limited` | `429` | You exceeded the rate limit |
| `server_error` | `500` | An unexpected error occurred |

## Handling errors

- **Don't retry `4xx` errors without changing something.** Except for `429`, the same request will fail again.
- **Retry `429` and `500` errors with backoff.** Wait the time in the `Retry-After` header if present. Otherwise wait 1 second, then 2, then 4.
- **Use an `Idempotency-Key` when creating bookings** so a retry never creates a duplicate.
