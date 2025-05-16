If I check the performance of this query on an unpartitioned table, I get this:

```sql
EXPLAIN ANALYZE
SELECT b.booking_id, b.property_id, b.user_id
FROM Booking b
WHERE start_date >= '2023-01-01' AND start_date < '2024-01-01'
ORDER BY start_date DESC;
```

```
Sort  (cost=11235.00..11236.25 rows=500 width=48) (actual time=224.112..224.218 rows=510 loops=1)
    Sort Key: start_date DESC
    Sort Method: quicksort  Memory: 80kB
    ->  Seq Scan on booking b  (cost=0.00..11210.00 rows=500 width=48) (actual time=0.172..223.489 rows=510 loops=1)
                Filter: ((start_date >= '2023-01-01'::date) AND (start_date < '2024-01-01'::date))
                Rows Removed by Filter: 39490
Planning Time: 0.155 ms
Execution Time: 224.325 ms
```

Running the same query on a partitioned table results in the following:

```
Sort  (cost=1200.45..1201.70 rows=500 width=48) (actual time=25.339..25.420 rows=510 loops=1)
    Sort Key: b.start_date DESC
    Sort Method: quicksort  Memory: 80kB
    ->  Append  (cost=0.00..1175.45 rows=500 width=48) (actual time=0.073..24.719 rows=510 loops=1)
                ->  Seq Scan on booking_2023 b  (cost=0.00..1175.45 rows=500 width=48) (actual time=0.072..22.987 rows=510 loops=1)
                            Filter: ((start_date >= '2023-01-01'::date) AND (start_date < '2024-01-01'::date))
Planning Time: 0.230 ms
Execution Time: 25.528 ms
```

As you can observe, execution time is much smaller, and this is without creating an index on the `start_date` column.