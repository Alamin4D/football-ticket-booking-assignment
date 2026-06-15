select match_id, fixture, base_ticket_price from matches
where tournament_category = 'Champions League'
and match_status = 'Available';



select user_id, full_name, email from users
where full_name ilike 'Tanvir%'
or full_name ilike '%Haque%';



select booking_id, user_id, match_id, coalesce(payment_status,'Action Required') as systematic_status from bookings
where payment_status is null;



select b.booking_id, u.full_name, m.fixture, b.total_cost from bookings b
inner join users u
on b.user_id = u.user_id
inner join matches m
on b.match_id = m.match_id;


select u.user_id, u.full_name, b.booking_id from users u
left join bookings b
on u.user_id = b.user_id;



select booking_id, match_id, total_cost from bookings
where total_cost > (
select avg(total_cost) from bookings
);



select match_id, fixture, base_ticket_price from matches
order by base_ticket_price desc
limit 2
offset 1;