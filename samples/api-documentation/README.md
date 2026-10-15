# StayEasy Booking API Documentation

> **Sample project.** StayEasy is a fictional product I created to demonstrate
> how I write and structure API documentation. All URLs, keys and data are
> examples.

The StayEasy Booking API lets developers search room availability and manage
reservations for a hospitality property. It is a REST API that uses JSON for
requests and responses.

## What's in this project

| File | What it covers |
| --- | --- |
| [Getting started](getting-started.md) | Make your first request in about five minutes |
| [Authentication](authentication.md) | API keys, sandbox and production |
| [Rooms](reference/rooms.md) | Search rooms and retrieve room details |
| [Bookings](reference/bookings.md) | Create, retrieve and cancel bookings |
| [Errors](errors.md) | Error format, status codes and how to fix them |
| [Rate limits and pagination](rate-limits-and-pagination.md) | Request limits and paging through results |
| [Changelog](changelog.md) | Release notes by version |
| [openapi.yaml](openapi.yaml) | Full OpenAPI 3.0 specification |
| [postman_collection.json](postman_collection.json) | Postman collection to try every endpoint |

## Who this is for

Developers building a booking website, mobile app or channel integration for a
hotel or guest house. You should be comfortable making HTTP requests.

## Base URLs

| Environment | Base URL |
| --- | --- |
| Sandbox | `https://sandbox.stayeasy.example.com/v1` |
| Production | `https://api.stayeasy.example.com/v1` |

## Try it in Postman

1. Open Postman and select **Import**.
2. Choose [`postman_collection.json`](postman_collection.json).
3. Open the collection's **Variables** tab and set `api_key` to your sandbox key.
4. Send **List available rooms** to confirm everything works.

## About the documentation approach

This project follows a docs-as-code workflow: the content is written in
Markdown, stored in Git, and the API reference is generated from a single
OpenAPI file. Changes are made through pull requests, and an automated check
validates the OpenAPI file and Markdown on every change.
