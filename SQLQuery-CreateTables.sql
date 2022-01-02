--create database
CREATE	DATABASE alibaba;

use alibaba;
--
-- create tables
create table users(
	id int primary key identity,
	first_name varchar(50),
	last_name varchar(50),
	gender varchar(10),
	balance int default 0,
	birthdate date,
	national_id varchar(11) unique,
	tel varchar(20),
	email varchar(50) not null unique,
	mobile_number varchar(15) unique,
	created_date varchar(20) default FORMAT(GETDATE(), 'dd/MM/yyyy', 'fa')
	);
---------------------------------------------------------------------------------------------------------------------
create table transactions(
	id int identity primary key,
	date_time varchar(20) default FORMAT(GETDATE(), 'dd/MM/yyyy', 'fa'),
	trans_type varchar(50),
	descrip varchar(100),
	amount int,
	users_id int foreign key references users(id) on delete cascade
);
---------------------------------------------------------------------------------------------------------------------
create table orders(
	id int identity primary key,
	order_type varchar(20),
	date_time varchar(20) default FORMAT(GETDATE(), 'dd/MM/yyyy', 'fa'),
	users_id int foreign key references users(id) on delete cascade
);
---------------------------------------------------------------------------------------------------------------------
create table countries(
	id int identity primary key,
	country_name varchar(20) unique
);
---------------------------------------------------------------------------------------------------------------------
create table cities(
	id int identity primary key,
	city_name varchar(20) unique,
	country_id int foreign key references countries(id) on delete cascade
);
---------------------------------------------------------------------------------------------------------------------
create table bus_companies(
	id int identity primary key,
	bus_company_name varchar(20) not null unique
);
---------------------------------------------------------------------------------------------------------------------
create table bus_trips(
	id int identity primary key,
	trip_type varchar(20),
	source_id int foreign key references cities(id) on delete cascade not null,
	destination_id int foreign key references cities(id) not null,
	departure_date varchar(20) check (departure_date like '__/__/____') not null,
	return_date varchar(20) not null,
	seats int not null,
	company int foreign key references bus_companies(id) on delete cascade not null,
	cost int not null
);
---------------------------------------------------------------------------------------------------------------------
create table air_companies(
	id int identity primary key,
	air_company_name varchar(20) not null unique
);
---------------------------------------------------------------------------------------------------------------------
create table flights(
	id int identity primary key,
	source_id int foreign key references cities(id) on delete cascade not null,
	destination_id int foreign key references cities(id) not null,
	seats int not null,
	departure_date varchar(20) check (departure_date like '__/__/____') not null,
	return_date varchar(20) not null,
	flight_type varchar(20),
	class varchar(20),
	company int foreign key references air_companies(id) on delete cascade not null,
	stop_numbers int,
	duration_time int,
	cost int not null
);
---------------------------------------------------------------------------------------------------------------------
create table bus_orders(
	id int identity primary key,
	bus_trip_id int foreign key references bus_trips(id) on delete cascade,
	seat_number int not null,
	users_id int foreign key references users(id) on delete cascade
);
---------------------------------------------------------------------------------------------------------------------
create table flight_orders(
	id int identity primary key,
	flight_id int foreign key references flights(id) on delete cascade,
	seat_number int not null,
	users_id int foreign key references users(id) on delete cascade
);
---------------------------------------------------------------------------------------------------------------------
create table hotel(
	id int identity primary key,
	hotel_name varchar(50) not null,
	grade varchar(10),
	score int,
	addr varchar(100),
	city_id int foreign key references cities(id) on delete cascade not null,
	hotel_type varchar(50) not null,
);
---------------------------------------------------------------------------------------------------------------------
create table facilities(
	id int identity primary key,
	facility_name varchar(50) not null
);
---------------------------------------------------------------------------------------------------------------------
create table hotel_facility(
	id int identity primary key,
	hotel_id int foreign key references hotel(id) on delete cascade not null,
	facility_id int foreign key references facilities(id) on delete cascade not null
);
---------------------------------------------------------------------------------------------------------------------
create table room(
	id int identity primary key,
	beds int not null,
	class varchar(20),
	is_breakfast int default 0,
	cost int not null,
	hotel_id int foreign key references hotel(id) on delete cascade not null,
	is_reserved int default 0
);
---------------------------------------------------------------------------------------------------------------------
create table hotel_orders(
	id int identity primary key,
	hotel_id int foreign key references hotel(id) on delete cascade not null,
	room_id int foreign key references room(id) not null,
	from_date varchar(50) default FORMAT(GETDATE(), 'dd/MM/yyyy', 'fa'),
	to_date varchar(50),
	users_id int foreign key references users(id) on delete cascade not null
);
---------------------------------------------------------------------------------------------------------------------

