--Question #1
--List all the customers who live in Texas. (use JOINs)
select first_name, last_name
from customer 
join address on customer.address_id = address.address_id 
where district = 'Texas'

--Question #2
--Get all payments above $6.99 with the customer's full name
select payment_id, first_name, last_name, amount
from payment 
join customer on payment.customer_id = customer.customer_id
where amount > 6.99

--Question #3
--Show all customers names who have made payments over $175 (use subqueries)
select *
from (
select customer.customer_id, first_name, last_name, sum(amount)
from customer 
join payment on customer.customer_id = payment.customer_id 
group by customer.customer_id
) as customer_payments
where sum > 175

--Question #4
--List all customers that live in Nepal (use the city table)
select *
from country 
join city on country.country_id = city.country_id 
where country = 'Nepal'

--Question #5
--Which staff member had the most transactions?
select first_name, last_name, count(rental_id) as "Total Transactions"
from staff 
join rental on staff.staff_id = rental.staff_id 
group by staff.staff_id

--Question #6
--How many movies of each rating are there?
select rating, count(title) as "Movies Per Rating"
from film
group by rating
order by count(title) desc

--Question #7
--Show all customers who have made a single payment above $6.99 (Use subqueries)
select *
from (select first_name, last_name, count(customer.customer_id) 
from customer 
join payment on customer.customer_id = payment.customer_id 
where amount > 6.99
group by customer.customer_id) as "payments_over_6.99"
where count = 1

--Question #8
--How many free rentals did our stores give out?
select count(*)
from payment 
where amount = 0