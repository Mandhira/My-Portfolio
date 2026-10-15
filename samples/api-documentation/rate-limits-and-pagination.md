# Rate limits and pagination

## Rate limits

To keep the API fast for everyone, each API key can make up to **100 requests
per minute**. If you go over the limit, the API returns `429 Too Many Requests`.

Every response includes these headers so you can track your usage:

| Header | Description |
| --- | --- |
| `X-RateLimit-Limit` | The number of requests allowed per minute |
| `X-RateLimit-Remaining` | The number of requests you have left in the current minute |
| `Retry-After` | Only on `429` responses. The number of seconds to wait before trying again |

Example of a rate limit error:

```json
{
  "error": {
    "code": "rate_limited",
    "message": "Too many requests. Try again in 30 seconds."
  }
}
```

**Tips for staying within the limit**

- Cache room search results for a short time instead of repeating the same search.
- Spread out batch jobs rather than sending all requests at once.
- When you receive a `429`, wait for the `Retry-After` time before retrying.

## Pagination

List endpoints such as `GET /rooms` return results in pages.

| Parameter | Description | Default | Maximum |
| --- | --- | --- | --- |
| `page` | Page number, starting at 1 | `1` | |
| `limit` | Number of results per page | `20` | `50` |

The response includes the paging details alongside the results:

```json
{
  "data": [],
  "page": 2,
  "limit": 20,
  "total": 47
}
```

To fetch every result, keep increasing `page` until you have collected `total`
items. In this example, `47` results at `20` per page means 3 pages.

```bash
curl "https://sandbox.stayeasy.example.com/v1/rooms?check_in=2026-11-10&check_out=2026-11-12&page=2&limit=20" \
  -H "Authorization: Bearer YOUR_API_KEY"
```
