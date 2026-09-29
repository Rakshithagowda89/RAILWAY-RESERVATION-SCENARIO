#.	Retrieve all bookings with fare greater than 400. 
SELECT *
FROM bookings
WHERE fare > 400;

#	Find bookings where status is not 'Confirmed'. 
SELECT *
FROM bookings
WHERE status <> 'Confirmed';

#	Display trains starting from Chennai. 
SELECT *
FROM trains
WHERE source = 'Chennai';

#	Retrieve bookings with fare between 300 and 500.
 SELECT *
FROM bookings
WHERE fare BETWEEN 300 AND 500;

#.	Find passengers whose names start with 'A'. 
SELECT *
FROM bookings
WHERE passenger_name LIKE 'A%';


# JOINS + GROUP BY + ORDER BY (46–48)

#	Retrieve train names along with passenger names. 
SELECT t.train_name, b.passenger_name
FROM trains t JOIN bookings b
ON t.train_id = b.train_id;

#	Count number of bookings for each train. 
SELECT t.train_name, COUNT(b.booking_id) AS booking_count
FROM trains t JOIN bookings b
ON t.train_id = b.train_id
GROUP BY t.train_id, t.train_name;

#	Display train names and total fare collected for each train. 
SELECT t.train_name, SUM(b.fare) AS total_fare
FROM trains t
JOIN bookings b
ON t.train_id = b.train_id
GROUP BY t.train_id, t.train_name;

 # SUBQUERIES 

#	Find bookings with fare equal to the highest fare. 
SELECT *
FROM bookings
WHERE fare = (SELECT MAX(fare)
   		   FROM bookings);

#	Retrieve trains that have more than one booking. 
SELECT t.train_name, COUNT(b.booking_id) AS booking_count
FROM trains t JOIN bookings b
ON t.train_id = b.train_id
GROUP BY t.train_id, t.train_name
HAVING COUNT(b.booking_id) > 1;
