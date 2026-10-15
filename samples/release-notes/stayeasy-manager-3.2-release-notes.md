# StayEasy Manager 3.2 release notes

**Release date:** 20 October 2026
**Version:** 3.2.0
**Applies to:** StayEasy Manager web application (all plans)

> **Sample document.** StayEasy Manager is a fictional product that I created
> to show how I write release notes. The features, ticket numbers and dates are
> examples.

## Highlights

- **Import room prices from a CSV file.** Update the prices for many rooms at once instead of editing them one by one.
- **Filter the booking calendar.** Show only the room types and booking statuses you need.
- **Faster search.** Booking search now returns results more quickly when you have many bookings.

## What you need to do

**Nothing, in most cases.** The update is applied automatically and there is no
downtime. Two changes may need your attention:

- If you use the **Export bookings** report in a spreadsheet template, the date column format has changed. See [Changes that may affect you](#changes-that-may-affect-you).
- Internet Explorer is no longer supported. See [Deprecations](#deprecations).

## New features

### Import room prices from a CSV file

Property managers can now update room prices in bulk.

1. Go to **Rooms > Prices**.
2. Select **Import prices**, then choose your CSV file.
3. Review the preview. Rows with errors are marked in red.
4. Select **Apply prices**.

The file needs two columns: `room_id` and `price_per_night`. The import accepts
up to 500 rooms at a time. Prices take effect for new bookings only. Existing
bookings keep the price they were made at.

### Filter the booking calendar

The booking calendar has a new **Filters** panel. You can show or hide bookings
by **room type** (standard, deluxe or suite) and by **status** (confirmed,
pending or cancelled). Your selection is remembered the next time you open the
calendar.

## Improvements

- Booking search is up to 40% faster for accounts with more than 10,000 bookings. (SE-1471)
- The **Guests** column in the bookings list can now be sorted. (SE-1432)
- Error messages on the booking form now say which field needs to be corrected. (SE-1450)
- The **Cancel booking** dialog now shows the cancellation fee before you confirm. (SE-1409)

## Fixes

- Fixed an issue where a booking made on the last day of a month showed the wrong check-out date in the calendar. (SE-1423)
- Fixed an issue where the guest's email address was cut off in the confirmation email if it contained a plus sign (+). (SE-1438)
- Fixed an issue where selecting **Print** on the bookings list printed only the first page. (SE-1445)
- Fixed an issue where deleted rooms still appeared in the room type filter on the dashboard. (SE-1462)

## Changes that may affect you

### Export bookings: date format

In the **Export bookings** report, dates now use the format `YYYY-MM-DD` (for
example, `2026-11-10`). They were previously shown as `DD/MM/YYYY`.

**If you use a spreadsheet template that reads the date column,** update the
column's format to match, or the dates may not be recognised.

## Deprecations

- **Internet Explorer 11 is no longer supported.** Use a current version of Microsoft Edge, Google Chrome, Mozilla Firefox or Safari. Pages may not display correctly in Internet Explorer 11.

## Known issues

| ID | Issue | Workaround |
| --- | --- | --- |
| SE-1480 | In the booking calendar, the filter selection is not remembered if you use the browser's private or incognito mode. | Select your filters each time you open the calendar. |
| SE-1483 | The CSV price import preview can take up to 30 seconds to appear for files with more than 400 rooms. | Split the file into two smaller files and import them one after the other. |

## Get help

If you have a question about this release, contact StayEasy Support at
support@stayeasy.example.com and mention version 3.2.0.
