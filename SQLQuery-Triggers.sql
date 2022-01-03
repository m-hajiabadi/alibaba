--
use alibaba;
--triggers
---------------------------------------------------------------------------------------------------------------------
--add a record for each new user in transactions table 
create trigger users_transaction_register
on users
after insert
as
begin
  insert into transactions(trans_type,descrip,amount, users_id)
  select 'Increase inventory', 'registeration',balance, id 
  from inserted
end
---------------------------------------------------------------------------------------------------------------------
--Deduction of account balance after buying a bus ticket
create trigger users_transaction_busticket
on bus_orders
after insert
as
begin
  insert into transactions(trans_type,descrip,amount, users_id)
  select 'Deacrease inventory', 'bus ticket',bus_trips.cost, users_id
  from inserted, bus_trips
  where bus_trips.id = inserted.bus_trip_id;
  update users 
  set balance = balance - bt.cost
  from bus_trips bt , inserted ins
  where users.id = ins.users_id and bt.id = ins.bus_trip_id;
end
---------------------------------------------------------------------------------------------------------------------
--Deduction of seats after buying a bus ticket
create trigger update_seats
on bus_orders
after insert
as
begin
	update bus_trips
	set seats = seats - 1
	where id = (select bus_trip_id from inserted);
end
---------------------------------------------------------------------------------------------------------------------
--Change number of seat in bus
create trigger change_bus_ticket_transaction 
on bus_orders
after update
as
begin
	insert into transactions(trans_type,descrip,amount, users_id)
	select 'No change in inventory', 'bus ticket changed',0, users_id
	from inserted, bus_trips
	where bus_trips.id = inserted.bus_trip_id;
end
---------------------------------------------------------------------------------------------------------------------
--Deduction of account balance after buying a flight ticket
create trigger users_transaction_flight_ticket
on flight_orders
after insert
as
begin
  insert into transactions(trans_type,descrip,amount, users_id)
  select 'Deacrease inventory', 'flight ticket',flights.cost, users_id
  from inserted, flights
  where flights.id = inserted.flight_id;
  update users 
  set balance = balance - f.cost
  from flights f , inserted ins
  where users.id = ins.users_id and f.id = ins.flight_id;
end
---------------------------------------------------------------------------------------------------------------------
--Deduction of seats after buying a flight ticket
create trigger update_seats_flight
on flight_orders
after insert
as
begin
	update flights
	set seats = seats - 1
	where id = (select flight_id from inserted);
end
---------------------------------------------------------------------------------------------------------------------
--Change number of seat in flight
create trigger change_flight_ticket_transaction 
on flight_orders
after update
as
begin
	insert into transactions(trans_type,descrip,amount, users_id)
	select 'No change in inventory', 'flight ticket changed',flights.cost, users_id
	from inserted, flights
	where flights.id = inserted.flight_id;
end
---------------------------------------------------------------------------------------------------------------------
--Deduction of account balance after reserve a hotel room
create trigger users_transaction_hotel_room
on hotel_orders
after insert
as
begin
  insert into transactions(trans_type,descrip,amount, users_id)
  select 'Deacrease inventory', 'hotel room',room.cost, users_id
  from inserted, room
  where room.id = inserted.room_id;
  update users 
  set balance = balance - r.cost
  from room r , inserted ins
  where users.id = ins.users_id and r.id = ins.room_id;
end
---------------------------------------------------------------------------------------------------------------------

select * from transactions