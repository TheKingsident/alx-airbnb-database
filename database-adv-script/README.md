# Advanced SQL Queries Documentation

This document provides a brief description of the advanced SQL queries included in the `joins_queries.sql`, `subqueries.sql`, and `aggregations_and_window_functions.sql` files. These queries demonstrate the use of different types of SQL joins, subqueries, aggregations, and window functions to retrieve meaningful data from the database.

## Joins Queries Overview (`joins_queries.sql`)

### 1. **INNER JOIN Query**
- Retrieves a list of bookings along with user details.
- Joins the `Booking` table and the `User` table on the `user_id` field.
- Only includes records where there is a match in both tables.

### 2. **LEFT JOIN Query**
- Retrieves all properties along with their reviews.
- Joins the `Property` table and the `Review` table on the `property_id` field.
- Includes all properties, even if they do not have any associated reviews (review fields will be `NULL`).

### 3. **FULL OUTER JOIN Query**
- Fetches all users and all bookings, including:
  - Users without bookings.
  - Bookings not associated with any user.
- Joins the `User` table and the `Booking` table on the `user_id` field.

## Subqueries Overview (`subqueries.sql`)

### 1. **Properties with High Ratings**
- Selects all properties that have at least one review with a rating greater than 4.
- Uses a subquery to filter properties based on review ratings.

### 2. **Users with Multiple Bookings**
- Retrieves the ID, first name, and last name of users who have made more than 3 bookings.
- Uses a subquery to count bookings per user and filters accordingly.

## Aggregations & Window Functions Overview (`aggregations_and_window_functions.sql`)

### 1. **Total Bookings per User**
- Finds the total number of bookings made by each user.
- Uses `COUNT` and `GROUP BY` to aggregate booking counts per user.

### 2. **Property Booking Rankings**
- Retrieves each property's ID and name, counts how many bookings each property has, and ranks the properties by booking count in descending order.
- Uses window functions (`RANK` and `ROW_NUMBER`) to assign a rank and a unique row number to each property based on their booking counts.

These queries are designed to showcase how different types of joins, subqueries, aggregations, and window functions can be used to extract and analyze data effectively.

---

## New Files Overview

### `perfomance.sql`
- Contains queries for retrieving bookings with user, property, and payment details using various join strategies.
- Includes sample queries for performance analysis using `EXPLAIN`.

### `partitioning.sql`
- Demonstrates how to partition the `Booking` table by `start_date` using PostgreSQL's range partitioning.
- Includes example partitions for different years and a sample query to analyze partitioned performance.

### `database_index.sql`
- Provides SQL statements to create indexes on high-usage columns in the `Booking` and `Property` tables.
- Includes example queries to test and observe the effect of indexing on query performance.

### `performance_monitoring.md`
- Documents how to analyze query performance using `EXPLAIN ANALYZE`.
- Shows example outputs for unpartitioned, partitioned, and indexed tables, highlighting the impact of each optimization.

### `partition_performance.md`
- Compares query execution plans and times before and after partitioning the `Booking` table.
- Demonstrates the performance improvements gained from partitioning.

### `index_performance.md`
- Explains the impact of indexing on query performance.
- Provides before-and-after examples of query plans and execution times for indexed vs. non-indexed columns.

### `optimization_report.md`
- Summarizes the optimization process for a complex join query.
- Shows example execution plans before and after optimization, including the effect of indexing and query refactoring.

---

These files collectively demonstrate advanced SQL techniques for query writing, optimization, indexing, and performance monitoring in a relational database.