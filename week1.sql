use flights;
# 1. Which destination in the flights database is the furthest distance away, based on information in the flights table.
# Show the SQL query(s) that support your conclusion.

select * from flights order by distance desc limit 1;
# shows that flights with a destination to HNL from JFK have the most distance with 4983 (miles)

# 2. What are the different numbers of engines in the planes table? For each number of engines, which aircraft have
# the most number of seats? Show the SQL statement(s) that support your result.
select distinct(engines) as n_eng from planes; # get the unique types of engines in the table; engines means how many engines does the plane have

# plane with the most seats
select * from planes order by seats desc limit 1;

# 3. Show the total number of flights
select count(*) as total_flights from flights;

# 4. Show the total number of flights by airline (carrier)
select carrier, count(*) as total_flights from flights group by carrier;

# 5. Show all of the airlines, ordered by number of flights in descending order.
select * from airlines a inner join flights f on a.carrier = f.carrier
order by f.flight desc;

# 6. Show only the top 5 airlines, by number of flights, ordered by number of flights in descending order
select * from airlines a inner join flights f on a.carrier = f.carrier
group by f.carrier
order by f.flight desc limit 5;

# 7. Show only the top 5 airlines, by number of flights of distance 1,000 miles or greater, ordered by number of
# flights in descending order.
select * from airlines a inner join flights f on a.carrier = f.carrier
where f.distance >= 1000
group by f.carrier
order by f.flight desc limit 5;