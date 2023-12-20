--1. List all customers who live in Texas (use JOINs)
select customer.first_name, customer.last_name, district
from customer 
full join address 
on customer.address_id = address.address_id 
where district = 'Texas';


--2. Get all payments above $6.99 with the Customer's Full Name
select customer.first_name, customer.last_name, amount
from customer 
full join payment 
on customer.customer_id = payment.customer_id 
where amount > 6.99;

--3. Show all customers names who have made payments over $175(use subqueries)
select first_name, last_name
from customer 
where customer_id in ( 
	select customer_id 
	from payment 
	where amount > 175
)
group by first_name, last_name;


--4. List all customers that live in Nepal (use the city table)
select customer.first_name, customer.last_name
from customer 
full join address 
on customer.address_id = address.address_id 
full join city 
on address.city_id = city.city_id 
full join country 
on city.country_id = country.country_id 
where country = 'Nepal';

--5. Which staff member had the most transactions? Answer: John Stephens
select first_name, last_name 
from staff 
where staff_id in (
	select staff_id 
	from payment 
	group by staff_id 
	order by sum(payment_id) desc
)
group by first_name, last_name;

--6. How many movies of each rating are there? Answer G: 178, PG: 194, PG-13: 224, R: 196, NC-17: 209
select count(rating)
from film 
where rating = 'G';
select count(rating)
from film 
where rating = 'PG';
select count(rating)
from film 
where rating = 'PG-13';
select count(rating)
from film 
where rating = 'R';
select count(rating)
from film 
where rating = 'NC-17';

--7.Show all customers who have made a single payment above $6.99 (Use Subqueries)
select first_name, last_name, customer_id
from customer 
where customer_id in ( 
	select customer_id 
	from payment 
	where amount > 6.99
)
group by customer_id, first_name, last_name;

--8. How many free rentals did our stores give away? Answer: 0
select payment_id, rental_id, amount
from payment 
where rental_id in (
	select rental_id 
	from rental 
	where amount = 0
);


