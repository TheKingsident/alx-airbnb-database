High-usage columns in the database for the `User`, `Property`, and `Booking` tables are `User.user_id`, `Property.property_id`, and `Booking.user_id`, respectively.

Before indexing, querying the database with:

```sql
EXPLAIN ANALYZE SELECT * FROM Booking WHERE user_id = 5;
```

Sample output:

```
 Seq Scan on booking  (cost=0.00..35.50 rows=5 width=100) (actual time=0.023..1.234 rows=5 loops=1)
   Filter: (user_id = 5)
   Rows Removed by Filter: 95
 Planning Time: 0.110 ms
 Execution Time: 1.300 ms
```

After indexing:

```
 Index Scan using idx_booking_user_id on booking  (cost=0.15..8.30 rows=5 width=100) (actual time=0.010..0.040 rows=5 loops=1)
   Index Cond: (user_id = 5)
 Planning Time: 0.090 ms
 Execution Time: 0.050 ms
```

It switches from a sequential scan (`Seq Scan`) to an index scan (`Index Scan`).
