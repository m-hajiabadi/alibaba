--
use alibaba;
--required stored procedures
---------------------------------------------------------------------------------------------------------------------
--1)purchasedTickets
create procedure purchasedTickets @A varchar(20), @B varchar(20), @X varchar(20)
as
begin
	declare @id_table table(id int)  
	insert into @id_table
	exec get_flight_id_by_cities @A, @B, @X;

	select distinct count(*) as number_of_users
	from users u
	where id in (select fo.users_id 
				 from flights f, flight_orders fo
				 where f.id = fo.flight_id and f.id in(select id from @id_table));
end;
exec  purchasedTickets 'Los Angeles', 'Tehran', 1;
---------------------------------------------------------------------------------------------------------------------
--2)userWalletDetail
create procedure userWalletDetail @A char
as
begin
	select id
	from users
	where right(last_name, 1) = @A;


end;




create view x as
	select * 
	from transactions t
	where t.users_id in (select id
					     from users
						 where right(last_name, 1) = 'i')

create view y as						 
select users_id , max(date_time) as last_date
from x
group by users_id;

select * from x,y
where x.users_id = y.users_id and x.date_time = y.last_date
group by x.users_id

select top 1 * from x
where users_id = 24
order by date_time desc

create view w as
select x.id,x.date_time, x.descrip, x.users_id from x,y
where x.users_id = y.users_id and x.date_time = y.last_date

drop view w
select 
whe
group by users_id


select * from w
select * from x x1,x x2
where u

select * from y
---------------------------------------------------------------------------------------------------------------------
--3)allDomesticFlights
create procedure allDomesticFlights @A varchar(20), @B varchar(20), @C varchar(20)
as
begin
	declare @id_table table(id int)  
	insert into @id_table
	exec get_flight_id_by_cities @A, @B, 1;

	select air_company_name
	from air_companies
	where id in (select company 
					from flights
					where id in (select id from @id_table) and departure_date = @C)

end;

exec allDomesticFlights 'Tehran', 'Kish', '21/09/1400';
---------------------------------------------------------------------------------------------------------------------
--4)internationalTickets
create procedure internationalTickets @C int, @X varchar(20), @Y varchar(20)
as
begin
	declare @id_table table(id int)  
	insert into @id_table
	exec get_flight_id_by_cities @X, @Y, 1;

	declare @user_id_table table(id int)
	insert into @user_id_table
	select  u.id
	from users u, flight_orders fo, @id_table i
	where u.id = fo.users_id and fo.flight_id = i.id
	group by u.id
	having count(*) > @C

	select avg(len(last_name)) as average
	from users
	where id in (select id from @user_id_table)

end;

exec internationalTickets 2, 'Los Angeles', 'Tehran';
select * from flight_orders;
select * from flights;
select * from users;
---------------------------------------------------------------------------------------------------------------------
--5)terminalBuses
create procedure terminalBuses @A varchar(20),@D varchar(20), @E varchar(20), @B varchar(20), @C varchar(20)
as
begin
	declare @bus_company_id int;
	exec @bus_company_id = get_bus_company_id @D

	declare @source_id int, @destination_id int;
	exec @source_id = get_city_id @B;
	exec @destination_id = get_city_id @C;
	select * from bus_trips where source_id = @source_id and destination_id = @destination_id 
													and departure_date = @E and company = @bus_company_id
end;

exec terminalBuses '', 'Iranpeyma', '23/09/1400', 'Tehran', 'Mashhad';
select * from bus_trips;
---------------------------------------------------------------------------------------------------------------------
--6)hotelOrBusUsers
alter procedure hotelOrBusUsers @A int, @B varchar(20)
as
begin
	declare @city_id int;
	exec @city_id = get_city_id @B;

	--hotels in B
	declare @hotels_in_B table(id int)  
	insert into @hotels_in_B
	select id
	from hotel
	where city_id = @city_id

	--bus_trips from B
	declare @bus_trips_from_B table(id int)  
	insert into @bus_trips_from_B
	select id
	from bus_trips
	where source_id = @city_id

	--users with equal greater than A hotel_orders in B
	declare @hotel_order_users table(id int)  
	insert into @hotel_order_users
	select users_id as id
	from hotel_orders
	where hotel_id in (select id from @hotels_in_B)
	group by users_id
	having count(*) >= @A;

	--users with equal greater than A bus_orders from B
	declare @bus_order_users table(id int)  
	insert into @bus_order_users
	select users_id as id
	from bus_orders
	where bus_trip_id in (select id from @bus_trips_from_B)
	group by users_id
	having count(*) >= @A;

	select avg(balance) as average
	from users
	where id in (select id from @bus_order_users) and id in (select id from @hotel_order_users);
end;
exec hotelOrBusUsers 2, 'Tehran';
---------------------------------------------------------------------------------------------------------------------
--7)internationalFlight
alter procedure internationalFlight @X int, @Y varchar(20), @Z varchar(20), @N int
as
begin
	declare @international_cities table(id int)  
	insert into @international_cities
	exec get_international_cities
	
	declare @source_id int, @destination_id int;
	exec @source_id = get_city_id @Y;
	exec @destination_id = get_city_id @Z;

	select * 
	from flights
	where (source_id in (select id from @international_cities) or destination_id in (select id from @international_cities))
			and source_id = @source_id and destination_id = @destination_id 
			and datediff(month, CONVERT(datetime, departure_date, 131), CONVERT(datetime, FORMAT(GETDATE(), 'dd/MM/yyyy', 'fa'), 131)) < @N;
end;



exec internationalFlight 0, 'Los Angeles', 'Tehran', 2;
select * from flight_orders;
---------------------------------------------------------------------------------------------------------------------
declare @international_cities table(id int)  
	insert into @international_cities
	exec get_international_cities;
	select * 
	from flights
	where (source_id in (select id from @international_cities) or destination_id in (select id from @international_cities))
select * from flights
exec get_international_cities

select city_name 
from cities
where id in exec get_cities_by_country 'Iran';
select * from cities

select balance from users where email = 'zohrehrasouli@gmail.com';
select * from hotel_orders
select * from bus_orders
select * from bus_trips
select * from flight_orders
select * from cities
select * from bus_companies 