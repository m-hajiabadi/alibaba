--
use alibaba;
--
--delete
update users
set created_date = '01/10/1400'
where id > 24;
 -- todo transacions
delete from users 
where datediff(day, CONVERT(datetime, created_date, 131), CONVERT(datetime, FORMAT(GETDATE(), 'dd/MM/yyyy', 'fa'), 131)) > 7;
select * from users;
--view
create view non_zero_view
as
select * from non_zero_balance;

select * from non_zero_view;



