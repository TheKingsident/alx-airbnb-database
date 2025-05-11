# Database Schema for ALX Airbnb Project

This is the project defines the database schema for an Airbnb-like platform. The schema is designed to manage users, properties, bookings, payments, reviews, and messages efficiently while ensuring data integrity and scalability.

## Tables and Relationships

### 1. **User Table**
- Stores user information such as name, email, and role (guest, host, admin).
- Includes unique constraints on the `email` column.

### 2. **Property Table**
- Represents properties listed by hosts.
- Linked to the `User` table via the `host_id` foreign key.

### 3. **Booking Table**
- Tracks bookings made by users for properties.
- Includes foreign keys referencing `Property` and `User` tables.

### 4. **Payment Table**
- Records payments for bookings.
- Linked to the `Booking` table via the `booking_id` foreign key.

### 5. **Review Table**
- Stores user reviews for properties.
- Includes a `rating` column with a constraint to ensure values are between 1 and 5.

### 6. **Message Table**
- Manages messages exchanged between users.
- Includes foreign keys for `sender_id` and `recipient_id` referencing the `User` table.

## Indexing
- Indexes are created on frequently queried columns such as `email` (User), `property_id` (Property, Booking), and `booking_id` (Booking, Payment) to optimize performance.

## Features
- Enforces data integrity with primary keys, foreign keys, and constraints.
- Supports scalability with proper indexing.
- Designed for real-world use cases in an Airbnb-like platform.

## Usage
Run the `schema.sql` file in your database to create the tables and indexes. Ensure your database supports the required data types and constraints (e.g., `ENUM` and `UUID`).