High-usage columns in the database for the `User`, `Property`, and `Booking` tables are `User.user_id`, `Property.property_id`, and `Booking.user_id`, respectively.

Before indexing, querying the database with:

```sql
EXPLAIN SELECT * FROM Booking WHERE user_id = 5;
```

Sample output:

```
                          QUERY PLAN
---------------------------------------------------------------
 Seq Scan on booking  (cost=0.00..35.50 rows=5 width=100)
   Filter: (user_id = 5)
(2 rows)
```

After indexing:

```
                          QUERY PLAN
---------------------------------------------------------------
 Index Scan using idx_booking_user_id on booking  (cost=0.15..8.30 rows=5 width=100)
   Index Cond: (user_id = 5)
(2 rows)
```

It switches from a sequential scan (`Seq Scan`) to an index scan (`Index Scan`).
