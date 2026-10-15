# Authentication

The StayEasy Booking API uses API keys to authenticate requests. Send your key
as a bearer token in the `Authorization` header of every request.

```http
Authorization: Bearer YOUR_API_KEY
```

Requests without a valid key return a `401 Unauthorized` error.

## Environments and keys

Each environment has its own keys. A sandbox key does not work in production,
and a production key does not work in the sandbox.

| Environment | Base URL | Key prefix | Real bookings? |
| --- | --- | --- | --- |
| Sandbox | `https://sandbox.stayeasy.example.com/v1` | `sk_test_` | No. Data is reset every night. |
| Production | `https://api.stayeasy.example.com/v1` | `sk_live_` | Yes |

Use the sandbox while you build and test. Switch to a production key only when
you are ready to take real bookings.

## Get an API key

1. Sign in to the StayEasy dashboard.
2. Go to **Settings > Developers > API keys**.
3. Select **Create key**, choose an environment, and name the key.
4. Copy the key and store it somewhere safe. For security, the full key is shown only once.

## Keep your key secure

- Never put an API key in client-side code, mobile apps or public repositories.
- Store keys in environment variables or a secrets manager.
- Use a separate key for each application so you can revoke one without affecting the others.
- If a key is exposed, delete it in the dashboard and create a new one straight away.

## Example

```bash
curl "https://sandbox.stayeasy.example.com/v1/rooms/rm_1042" \
  -H "Authorization: Bearer sk_test_EXAMPLE_KEY"
```

## Authentication errors

| Status | Error code | Cause | Fix |
| --- | --- | --- | --- |
| `401` | `unauthorized` | The header is missing, badly formatted, or the key is invalid or deleted | Check that the header is `Authorization: Bearer <key>` and that the key is active |
