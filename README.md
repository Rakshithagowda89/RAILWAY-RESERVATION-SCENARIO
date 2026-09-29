# Railway Reservation System (MySQL Mini Project)

## Project Overview
The Railway Reservation System is a MySQL mini project designed to manage train details and passenger bookings. It stores train information, passenger names, ticket fares, and booking statuses.

This project helps students understand SQL concepts such as table creation, primary keys, foreign keys, auto-increment, data insertion, and table relationships.

## Objectives
- Create and manage train details.
- Store passenger booking information.
- Maintain ticket fares and booking statuses.
- Establish relationships between trains and bookings.
- Practice SQL queries and database management.

## Database Structure

### 1. Trains Table
The `trains` table stores information about trains.

| Column | Data Type | Description |
|---|---|---|
| train_id | INT | Primary key, auto-increment |
| train_name | VARCHAR(50) | Name of the train |
| source | VARCHAR(50) | Starting station |
| destination | VARCHAR(50) | Destination station |

### 2. Bookings Table
The `bookings` table stores passenger booking details.

| Column | Data Type | Description |
|---|---|---|
| booking_id | INT | Primary key, auto-increment |
| train_id | INT | Foreign key referencing trains |
| passenger_name | VARCHAR(50) | Name of the passenger |
| fare | DECIMAL(10,2) | Ticket fare |
| status | VARCHAR(20) | Booking status |

## Sample Data

### Trains

| Train ID | Train Name | Source | Destination |
|---|---|---|---|
| 1 | Express1 | Chennai | Madurai |
| 2 | Express2 | Coimbatore | Salem |
| 3 | Express3 | Madurai | Chennai |

### Bookings

| Booking ID | Train ID | Passenger Name | Fare | Status |
|---|---|---|---|---|
| 1 | 1 | Janani | 500.00 | Confirmed |
| 2 | 1 | Arun | 500.00 | Waiting |
| 3 | 2 | Priya | 300.00 | Confirmed |
| 4 | 3 | Karthik | 450.00 | Cancelled |
| 5 | 2 | Meena | 300.00 | Confirmed |

## SQL Concepts Used
- **CREATE TABLE:** Creates the trains and bookings tables.
- **PRIMARY KEY:** Uniquely identifies each train and booking.
- **AUTO_INCREMENT:** Automatically generates unique IDs.
- **FOREIGN KEY:** Establishes a relationship between trains and bookings.
- **INSERT INTO:** Inserts train and passenger booking records.
- **VARCHAR:** Stores text values such as names and stations.
- **DECIMAL:** Stores ticket fares accurately.

## Relationship
One train can have multiple passenger bookings. The `train_id` column in the bookings table references the `train_id` column in the trains table.

**Relationship:** One-to-Many (Trains → Bookings)

## Sample SQL Queries

### 1. Display all trains
```sql
SELECT * FROM trains;
```

### 2. Display all bookings
```sql
SELECT * FROM bookings;
```

### 3. Display passenger names and train details
```sql
SELECT b.passenger_name, t.train_name,
       t.source, t.destination, b.fare, b.status
FROM bookings b
JOIN trains t
ON b.train_id = t.train_id;
```

### 4. Display confirmed bookings
```sql
SELECT * FROM bookings
WHERE status = 'Confirmed';
```

### 5. Count passengers for each train
```sql
SELECT t.train_name, COUNT(b.booking_id) AS total_bookings
FROM trains t
LEFT JOIN bookings b
ON t.train_id = b.train_id
GROUP BY t.train_id, t.train_name;
```

### 6. Calculate total confirmed booking revenue per train
```sql
SELECT t.train_name, SUM(b.fare) AS total_revenue
FROM trains t
JOIN bookings b
ON t.train_id = b.train_id
WHERE b.status = 'Confirmed'
GROUP BY t.train_id, t.train_name;
```

## Expected Learning Outcomes
- Understand relational database concepts.
- Create tables with primary and foreign keys.
- Insert and retrieve records using SQL.
- Perform JOIN operations between related tables.
- Use aggregate functions such as COUNT() and SUM().
- Filter records using the WHERE clause.
- Group records using GROUP BY.

## Tools Used
- **Database:** MySQL
- **IDE:** MySQL Workbench
- **Language:** SQL

## Conclusion
The Railway Reservation System is a basic MySQL mini project that demonstrates how to manage train and passenger booking information using relational database concepts. It provides practical experience with table creation, data insertion, relationships, joins, filtering, and aggregate functions.

## Author
Rakshitha Gowda

## Project Type
MySQL Mini Project
