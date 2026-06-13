-- Users Table
create table users (
    user_id int primary key,
    full_name varchar(100) not null,
    email varchar(100) unique not null,
    role varchar(50) not null,
    phone_number varchar(20)
);

-- Matches Table
create table matches (
    match_id int primary key,
    fixture varchar(255) not null,
    tournament_category varchar(100) not null,
    base_ticket_price decimal(10,2) not null,
    match_status varchar(50) not null
);

-- Bookings Table
create table bookings (
    booking_id int primary key,
    user_id int references users(user_id) not null,
    match_id int references matches(match_id) not null,
    seat_number varchar(20),
    payment_status varchar(50),
    total_cost decimal(10,2)
);