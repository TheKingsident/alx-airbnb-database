# Advanced SQL Queries Documentation

This document provides a brief description of the advanced SQL queries included in the `joins_queries.sql` file. These queries demonstrate the use of different types of SQL joins to retrieve meaningful data from the database.

## Queries Overview

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

These queries are designed to showcase how different types of joins can be used to extract and analyze data effectively.