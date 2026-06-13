# ⚽ Football Ticket Booking System (SQL Project)

This project is a simple **relational database system** for managing football match ticket bookings. It demonstrates database design, relationships, and SQL queries including INSERT, JOIN-ready structure, and NULL handling.

---

## 📌 Project Overview

The system includes three main tables:

- **Users** → stores user information
- **Matches** → stores football match details
- **Bookings** → stores ticket booking records linking users and matches

It supports:
- User management
- Match listings
- Ticket booking system
- Payment tracking
- Basic reporting queries

---

## 🗄️ Database Schema

### 👤 Users Table
```sql
create table users (
    user_id int primary key,
    full_name varchar(100) not null,
    email varchar(100) unique not null,
    role varchar(50) not null,
    phone_number varchar(20)
);
⚽ Matches Table
create table matches (
    match_id int primary key,
    fixture varchar(255) not null,
    tournament_category varchar(100) not null,
    base_ticket_price decimal(10,2) not null,
    match_status varchar(50) not null
);
🎟️ Bookings Table
create table bookings (
    booking_id int primary key,
    user_id int references users(user_id) not null,
    match_id int references matches(match_id) not null,
    seat_number varchar(20),
    payment_status varchar(50),
    total_cost decimal(10,2)
);
📥 Sample Data

The project includes sample data for testing:

4 users (Fans & Ticket Manager)
5 football matches
5 booking records with different payment statuses
📊 Sample SQL Queries
1. Champions League Available Matches
select match_id, fixture, base_ticket_price from matches
where tournament_category = 'Champions League'
and match_status = 'Available';
2. Search Users by Name Pattern
select user_id, full_name, email from users
where full_name ilike 'Tanvir%'
or full_name ilike '%Haque%';
3. Handle NULL Payment Status
select booking_id, user_id, match_id,
coalesce(payment_status,'Action Required') as systematic_status
from bookings
where payment_status is null;
🔗 Key Features
Relational database design with foreign keys
Proper use of PRIMARY KEY and FOREIGN KEY
NULL handling using COALESCE
Pattern search using ILIKE
Real-world booking system structure
🚀 How to Run
Open PostgreSQL / MySQL (PostgreSQL recommended)
Create a new database:
CREATE DATABASE football_ticket_system;
Run the schema SQL (tables)
Insert sample data
Execute queries for testing
📚 Learning Outcome

After completing this project, you will understand:

Database normalization basics
One-to-Many relationships
SQL query writing
Data filtering and search
Handling NULL values effectively