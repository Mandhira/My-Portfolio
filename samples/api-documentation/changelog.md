# Changelog

All notable changes to the StayEasy Booking API are listed here. The API
follows [semantic versioning](https://semver.org/): breaking changes only
happen in a new major version.

## 1.0.0 - 2026-10-13

First public release of the StayEasy Booking API.

### Added

- `GET /rooms` to search available rooms by dates and number of guests, with pagination.
- `GET /rooms/{room_id}` to retrieve a single room.
- `POST /bookings` to create a booking, with `Idempotency-Key` support to prevent duplicates.
- `GET /bookings/{booking_id}` to retrieve a booking.
- `DELETE /bookings/{booking_id}` to cancel a booking.
- Bearer token authentication with separate sandbox and production keys.
- Rate limit of 100 requests per minute per API key.
