--tarea
--Tablas Fact
--FactPayment
SELECT distinct p.payment_id, p.customer_id, p.rental_id, p.amount, p.payment_date
--into DWSakila.dbo.FactPayment
FROM sakila.payment p

--FactRental
SELECT r.rental_id, r.rental_date, inventory_id, customer_id, return_date
--into DWSakila.dbo.FactRental
FROM sakila.rental r


--dimCustomer
Select c.customer_id, c.first_name + ' ' + c.last_name as FullName, c.active, c.create_date, a.address,a.district,
a.postal_code, ci.city, co.country
--into DWSakila.dbo.DimCustomer
FROM sakila.customer c
 join sakila.address a
	on c.address_id= a.address_id
 join sakila.city ci
	on a.city_id=ci.city_id
 join sakila.country co
	on ci.country_id=co.country_id

--DimFilm
SELECT f.film_id, Max(i.inventory_id) Inventory, f.title, f.release_year, f.rental_duration, f.rental_rate, f.replacement_cost, f.rating,
c.[name] category, l.[name] language,MAX(a.first_name + ' ' + a.last_name) Actor, ft.title company
--into DWSakila.dbo.DimFilm
FROM sakila.Film f
Inner join sakila.film_category fc
	on f.film_id=fc.film_id
inner join sakila.category c
	on fc.category_id=c.category_id
inner join sakila.language l
	on f.language_id=l.language_id
inner join sakila.film_actor fa
	on f.film_id=fa.film_id
inner join sakila.actor a
	on fa.actor_id=a.actor_id
inner join sakila.film_text ft
	on f.film_id=ft.film_id 
inner join sakila.inventory i
	on	 f.film_id=i.film_id
Group By  f.film_id,  f.title, f.release_year, f.rental_duration, f.rental_rate, f.replacement_cost, f.rating,
c.[name], l.[name] , ft.title
Order by film_id





