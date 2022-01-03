--
use alibaba;
--stored procedures
---------------------------------------------------------------------------------------------------------------------
--insert user
create procedure insert_user @national_id varchar(11), @first_name varchar(50), @last_name varchar(50),@balance int,@mobile_number varchar(15), @email varchar(50)
as
begin
insert into users (national_id, first_name, last_name,balance,mobile_number, email)
values
(@national_id, @first_name, @last_name, @balance, @mobile_number, @email)
end;
---------------------------------------------------------------------------------------------------------------------
--add_country
create procedure add_country @country_name varchar(20)
as
begin
insert into countries(country_name) values (@country_name)
end;
---------------------------------------------------------------------------------------------------------------------
--add_city
 create procedure add_city @city_name varchar(20), @country_name varchar(20)
 as 
 begin
 declare @country_id int;
 select @country_id = id from countries where country_name = @country_name;
 insert into cities(city_name, country_id) values (@city_name, @country_id);
 end;
 ---------------------------------------------------------------------------------------------------------------------
 --add_bus_company
 create procedure add_bus_company @bus_company_name varchar(20)
 as 
 begin
 insert into bus_companies(bus_company_name) values (@bus_company_name);
 end;
 ---------------------------------------------------------------------------------------------------------------------
 --add_bus_trip
create procedure add_bus_trip @trip_type varchar(20), @source_city varchar(20), @destination_city varchar(20), 
							  @departure_date varchar(20), @return_date varchar(20), @seats int, @company varchar(20), @cost int
as
begin 
	declare @source_id int;
	exec @source_id = get_city_id @source_city;

	declare @destinaiton_id int;
	exec @destinaiton_id = get_city_id @destination_city;
 
	declare @bus_company_id int;
	exec @bus_company_id = get_bus_company_id @company;
 
	insert into bus_trips(trip_type, source_id, destination_id, departure_date, return_date, seats, company, cost)
	values (@trip_type, @source_id, @destinaiton_id, @departure_date, @return_date, @seats, @bus_company_id, @cost);
end;

---------------------------------------------------------------------------------------------------------------------
--get_city_id
create procedure get_city_id @city_name varchar(20)
as
begin
	declare @city_id int;
	select @city_id = id from cities where city_name = @city_name;
	return @city_id;
end;
---------------------------------------------------------------------------------------------------------------------
--get_bus_company_id
create procedure get_bus_company_id @company varchar(20)
as
begin
	declare @bus_company_id int;
	select @bus_company_id = id from bus_companies where bus_company_name = @company;
	return @bus_company_id;
end;
---------------------------------------------------------------------------------------------------------------------
--get_bus_trip_id
create procedure get_bus_trip_id @source_city varchar(20), @destination_city varchar(20), @departure_date varchar(20), @return_date varchar(20)
as
begin
	declare @bus_trip_id int, @source_id int, @destination_id int;
	exec @source_id = get_city_id @source_city;
	exec @destination_id = get_city_id @destination_city;
	select @bus_trip_id = id from bus_trips where source_id = @source_id and destination_id = @destination_id 
													and departure_date = @departure_date and return_date = @return_date;
	return @bus_trip_id;
end;
---------------------------------------------------------------------------------------------------------------------
--get_user_id_by_email
create procedure get_user_id_by_email @email varchar(50)
as
begin
	declare @user_id int;
	select @user_id = id from users where email = @email;
	return @user_id;
end;
---------------------------------------------------------------------------------------------------------------------
--add_bus_order
create procedure add_bus_order @source_city varchar(20), @destination_city varchar(20) , @departure_date varchar(20), @return_date varchar(20),
								@seat_number int, @email varchar(50)
as 
begin
	declare @bus_trip_id int, @user_id int;
	exec @bus_trip_id = get_bus_trip_id @source_city, @destination_city, @departure_date, @return_date;
	exec @user_id = get_user_id_by_email @email;
	insert into bus_orders(bus_trip_id, seat_number, users_id)
	values(@bus_trip_id, @seat_number, @user_id);
end;
---------------------------------------------------------------------------------------------------------------------
--change_bus_ticket
create procedure change_bus_ticket @source_city varchar(20), @destination_city varchar(20) , @departure_date varchar(20), @return_date varchar(20),
								@old_seat_number int, @new_seat_number int, @email varchar(50)
as 
begin
	declare @bus_trip_id int, @user_id int, @bus_order_id int;
	exec @bus_trip_id = get_bus_trip_id @source_city, @destination_city, @departure_date, @return_date;
	exec @user_id = get_user_id_by_email @email;
	exec @bus_order_id = get_bus_order_id @user_id, @bus_trip_id, @old_seat_number;
	update bus_orders 
	set seat_number = @new_seat_number
	where id = @bus_order_id;
end;
---------------------------------------------------------------------------------------------------------------------
--get_bus_order_id
create procedure get_bus_order_id @user_id int, @bus_trip_id int, @seat_number int
as
begin
	declare @bus_order_id int;
	select @bus_order_id = id from bus_orders where users_id = @user_id and bus_trip_id = @bus_trip_id and seat_number = @seat_number;
	return @bus_order_id;
end;
---------------------------------------------------------------------------------------------------------------------
 --add_air_company
 create procedure add_air_company @air_company_name varchar(20)
 as 
 begin
 insert into air_companies(air_company_name) values (@air_company_name);
 end;
 ---------------------------------------------------------------------------------------------------------------------
--get_air_company_id
create procedure get_air_company_id @company varchar(20)
as
begin
	declare @air_company_id int;
	select @air_company_id = id from air_companies where air_company_name = @company;
	return @air_company_id;
end;
---------------------------------------------------------------------------------------------------------------------
--get_flight_id
create procedure get_flight_id @source_city varchar(20), @destination_city varchar(20), @departure_date varchar(20), @return_date varchar(20)
as
begin
	declare @flight_id int, @source_id int, @destination_id int;
	exec @source_id = get_city_id @source_city;
	exec @destination_id = get_city_id @destination_city;
	select @flight_id = id from flights where source_id = @source_id and destination_id = @destination_id 
													and departure_date = @departure_date and return_date = @return_date;
	return @flight_id;
end;
---------------------------------------------------------------------------------------------------------------------
--get_flight_order_id
create procedure get_flight_order_id @user_id int, @flight_id int, @seat_number int
as
begin
	declare @flight_order_id int;
	select @flight_order_id = id from flight_orders where users_id = @user_id and flight_id = @flight_id and seat_number = @seat_number;
	return @flight_order_id;
end;
---------------------------------------------------------------------------------------------------------------------
--add_flight_order
create procedure add_flight_order @source_city varchar(20), @destination_city varchar(20) , @departure_date varchar(20), @return_date varchar(20),
								@seat_number int, @email varchar(50)
as 
begin
	declare @flight_id int, @user_id int;
	exec @flight_id = get_flight_id @source_city, @destination_city, @departure_date, @return_date;
	exec @user_id = get_user_id_by_email @email;
	insert into flight_orders(flight_id, seat_number, users_id)
	values(@flight_id, @seat_number, @user_id);
end;
---------------------------------------------------------------------------------------------------------------------
--change_flight_ticket
create procedure change_flight_ticket @source_city varchar(20), @destination_city varchar(20) , @departure_date varchar(20), @return_date varchar(20),
								@old_seat_number int, @new_seat_number int, @email varchar(50)
as 
begin
	declare @flight_id int, @user_id int, @flight_order_id int;
	exec @flight_id = get_flight_id @source_city, @destination_city, @departure_date, @return_date;
	exec @user_id = get_user_id_by_email @email;
	exec @flight_order_id = get_flight_order_id @user_id, @flight_id, @old_seat_number;
	update flight_orders 
	set seat_number = @new_seat_number
	where id = @flight_order_id;
end;
 ---------------------------------------------------------------------------------------------------------------------
 --add_flight
create procedure add_flight @flight_type varchar(20), @source_city varchar(20), @destination_city varchar(20), 
							  @departure_date varchar(20), @return_date varchar(20), @seats int, @company varchar(20), @cost int
as
begin 
	declare @source_id int;
	exec @source_id = get_city_id @source_city;

	declare @destinaiton_id int;
	exec @destinaiton_id = get_city_id @destination_city;
 
	declare @air_company_id int;
	exec @air_company_id = get_air_company_id @company;
 
	insert into flights(flight_type, source_id, destination_id, departure_date, return_date, seats, company, cost)
	values (@flight_type, @source_id, @destinaiton_id, @departure_date, @return_date, @seats, @air_company_id, @cost);
end;
---------------------------------------------------------------------------------------------------------------------
 --add_hotel
create procedure add_hotel @hotel_name varchar(50), @grade varchar(10), @score int, @addr varchar(100), @city_name varchar(20), @hotel_type varchar(50)
as
begin 
	declare @city_id int;
	exec @city_id = get_city_id @city_name;

	insert into hotel(hotel_name, grade, score, addr, city_id, hotel_type)
	values (@hotel_name, @grade, @score, @addr, @city_id, @hotel_type);
end;
---------------------------------------------------------------------------------------------------------------------
 --add_room
create procedure add_room @beds int, @class varchar(20), @is_breakfast int, @cost int, @hotel_name varchar(50)
as
begin 
	declare @hotel_id int;
	exec @hotel_id = get_hotel_id @hotel_name;

	insert into room(beds, class, is_breakfast, cost, hotel_id)
	values (@beds, @class, @is_breakfast, @cost, @hotel_id);
end;
---------------------------------------------------------------------------------------------------------------------
--get_hotel_id
create procedure get_hotel_id @hotel_name varchar(50)
as
begin
	declare @hotel_id int;
	select @hotel_id = id from hotel where hotel_name = @hotel_name;
	return @hotel_id;
end;
---------------------------------------------------------------------------------------------------------------------
--add_hotel_order
create procedure add_hotel_order @hotel_name varchar(50), @beds int , @from_date varchar(20), @to_date varchar(20), @email varchar(50)
as 
begin
	declare @hotel_id int, @room_id int,@user_id int;
	exec @hotel_id = get_hotel_id @hotel_name
	exec @room_id = get_room_id @beds, @hotel_id
	exec @user_id = get_user_id_by_email @email;
	insert into hotel_orders(hotel_id, room_id, from_date, to_date, users_id)
	values(@hotel_id, @room_id,@from_date, @to_date, @user_id);
end;
---------------------------------------------------------------------------------------------------------------------
--get_room_id
create procedure get_room_id @beds int, @hotel_id int
as
begin
	declare @room_id int;
	select top 1 @room_id = id from room where beds = @beds and hotel_id = @hotel_id and is_reserved = 0
	return @room_id;
end;
---------------------------------------------------------------------------------------------------------------------
--get_flight_id_by_cities_state
create procedure get_flight_id_by_cities @source_city varchar(20), @destination_city varchar(20), @state int
as
begin
	declare @source_id int, @destination_id int;
	exec @source_id = get_city_id @source_city;
	exec @destination_id = get_city_id @destination_city;
	if @state = 1 
	begin
	select id from flights where source_id = @source_id and destination_id = @destination_id and return_date = '';
	end
	else 
	begin
	select id from flights where source_id = @source_id and destination_id = @destination_id and return_date <> '';
	end
	
end;
---------------------------------------------------------------------------------------------------------------------
--get_hotel_id_by_city
create procedure get_hotel_id_by_city @city_name varchar(50)
as
begin
	declare @city_id int;
	select @city_id = id from cities where city_name = @city_name;
	declare @hotel_id int;
	select @hotel_id = id from hotel where city_id = @city_id;
	return @hotel_id;
end;
---------------------------------------------------------------------------------------------------------------------
--get_cities_by_country
create procedure get_cities_by_country @country varchar(20)
as 
begin
	select id
	from cities
	where country_id in (select id from countries where country_name = @country)
end;
---------------------------------------------------------------------------------------------------------------------
--get_international_cities
create procedure get_international_cities
as 
begin
	select id
	from cities
	where country_id not in (select id from countries where country_name = 'Iran')
end;
---------------------------------------------------------------------------------------------------------------------
--get_user_id_by_first_name_last_name
create procedure get_user_id_by_first_name_last_name @first_name varchar(20), @last_name varchar(20)
as
begin
	declare @user_id int;
	select @user_id = id from users where first_name = @first_name and last_name = @last_name
	return @user_id;
end;
---------------------------------------------------------------------------------------------------------------------
--charge
create procedure charge @amount int, @users_id int
as
begin
	update users
	set balance = balance + @amount
	where id = @users_id;

	insert into transactions(trans_type,descrip,amount, users_id)
	values('Increase inventory', 'charge',@amount, @users_id);
end;