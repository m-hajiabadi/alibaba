--
use alibaba;
--
--insert & update
--1,2)
exec insert_user '5779962545','ali','gholami',0,'09844802049','aligholami@gmail.com';
exec insert_user '8995834528','zohreh', 'rasuoli',0,'09869776928','zohrehrasouli@gmail.com';
exec insert_user '0666060061','elham', 'niayeshi',0,'09268710112','elhammiayeshi@gmail.com';
exec insert_user '3999248858','reza','maleki',0,'09838364232','rezamaleki@gmail.com';
exec insert_user '4480000046','morteza','molaei',0,'09082969086','mortezamolaei@gmail.com';
exec insert_user '8248795888','saeid', 'hejazi',1000000,'09945304872','saeidhejazi@gmail.com';
exec insert_user '3161561473','john', 'wick',1000000000,'09149108077','johnwick@gmail.com';
exec insert_user '2232330222','arman','fadaei',1000000,'09848472603','armanfadaei@gmail.com';
exec insert_user '8152668117','mohammad', 'sajjadi',3000000,'09290650513','mohammadsajjadi@gmail.com';
exec insert_user '0545005000','ali', 'mohammadi',1000000,'09010276023','alimohammadi@gmail.com';
exec insert_user '2065998873','hossein','mahdavi',1000000,'09935363736','hosseinmahdavi@gmail.com';
exec insert_user '2323030027','hamed','ghazizadeh',1000000,'09624616634','hamedghazizadeh@gmail.com';
exec insert_user '2323030028','reza','nikfar',1000000,'09624616635','rezanikfar@gmail.com';
select * from users;
select * from transactions;
---------------------------------------------------------------------------------------------------------------------
--3)
--add countries
exec add_country 'Iran';
exec add_country 'USA';
exec add_country 'Iraq';
exec add_country 'Canada';
exec add_country 'Germany';
exec add_country 'UAE';
exec add_country 'Italy';
select * from countries;
--add cities
exec add_city 'Tehran', 'Iran';
exec add_city 'Mashhad','Iran';
exec add_city 'Babol','Iran';
exec add_city 'Kish','Iran';
exec add_city 'Esfahan','Iran';
exec add_city 'Qom','Iran';
exec add_city 'Karaj','Iran';
exec add_city 'Shiraz','Iran';
exec add_city 'Yazd','Iran';
exec add_city 'Bandar Abbas','Iran';
exec add_city 'Birjand', 'Iran';
exec add_city 'Los Angeles','USA';
exec add_city 'New York','USA';
exec add_city 'Najaf','Iraq';
exec add_city 'Toronto','Canada';
exec add_city 'Frankfurt','Germany';
exec add_city 'Dubai','UAE';
exec add_city 'Milan','Italy';
select * from cities;
--add bus companies
exec add_bus_company 'Iranpeyma';
exec add_bus_company 'Asiasafar';
exec add_bus_company 'Mihannour';
exec add_bus_company 'Adl';
exec add_bus_company 'Rahpeyma';
exec add_bus_company 'Imensafariranian';
exec add_bus_company 'Royalsafar';
exec add_bus_company 'Royalsafariranian';
exec add_bus_company 'Seirosafar';
exec add_bus_company 'Gitipeyma';
exec add_bus_company 'Lavannour';
exec add_bus_company 'Peyksaba';
exec add_bus_company 'Hamsafar';
select * from bus_companies;
--add bus trips
exec add_bus_trip 'VIP', 'Tehran', 'Mashhad', '23/09/1400', '', 22, 'Iranpeyma', 1910000;
exec add_bus_trip 'VIP', 'Tehran', 'Babol', '24/09/1400', '', 22, 'Iranpeyma', 610000;
exec add_bus_trip 'VIP', 'Tehran', 'Birjand', '16/09/1400', '', 25, 'Lavannour', 2290000;
exec add_bus_trip 'VIP', 'Tehran', 'Esfahan', '16/09/1400', '', 25, 'Royalsafar', 940000;
exec add_bus_trip 'VIP', 'Karaj', 'Qom', '16/09/1400', '', 25, 'Iranpeyma', 500000;
exec add_bus_trip 'VIP', 'Karaj', 'Qom', '16/08/1400', '', 25, 'Lavannour', 500000;
exec add_bus_trip 'VIP', 'Karaj', 'Qom', '16/07/1400', '', 25, 'Royalsafar', 500000;
exec add_bus_trip 'VIP', 'Shiraz', 'Esfahan', '23/10/1400', '', 25, 'Seirosafar', 500000;
exec add_bus_trip 'VIP', 'Shiraz', 'Esfahan', '24/10/1400', '', 25, 'Seirosafar', 550000;
exec add_bus_trip 'VIP', 'Shiraz', 'Esfahan', '25/10/1400', '', 25, 'Seirosafar', 950000;
exec add_bus_trip 'VIP', 'Shiraz', 'Esfahan', '18/10/1400', '', 25, 'Seirosafar', 450000;
exec add_bus_trip 'VIP', 'Shiraz', 'Esfahan', '17/10/1400', '', 25, 'Seirosafar', 490000;
exec add_bus_trip 'VIP', 'Shiraz', 'Esfahan', '23/10/1400', '', 25, 'Adl', 500000;

exec add_bus_trip 'VIP', 'Tehran', 'Bandar Abbas', '16/09/1400', '', 25, 'Royalsafar', 1110000;
select * from bus_trips;
---------------------------------------------------------------------------------------------------------------------
--4)
--add air companies
exec add_air_company 'Iranair';
exec add_air_company 'Iranairtour';
exec add_air_company 'Aseman';
exec add_air_company 'Kishair';
exec add_air_company 'Saha';
exec add_air_company 'Mahan';
exec add_air_company 'Karoun';
exec add_air_company 'Ata';
exec add_air_company 'Taban';
exec add_air_company 'Americanairlinesgroup';
exec add_air_company 'Airtranairways';
exec add_air_company 'Jetblue';
exec add_air_company 'Eurowings';
exec add_air_company 'ACM Air Charter';
exec add_air_company 'Aero-Dienst';
exec add_air_company 'AeroLogic';
exec add_air_company 'Lufthansa';


select * from air_companies;
--add flight
exec add_flight '', 'Los Angeles', 'Tehran', '20/09/1400', '', 300, 'Jetblue', 50000000;
exec add_flight '', 'Los Angeles', 'Tehran', '20/08/1400', '', 300, 'Jetblue', 50000000;
exec add_flight '', 'Tehran', 'Toronto', '20/08/1400', '', 200, 'Jetblue', 500000;
exec add_flight '', 'Tehran', 'Toronto', '21/08/1400', '', 200, 'Airtranairways', 550000;
exec add_flight '', 'Tehran', 'Toronto', '22/08/1400', '', 200, 'Americanairlinesgroup', 530000;
exec add_flight '', 'Tehran', 'Toronto', '23/08/1400', '', 200, 'Americanairlinesgroup', 540000;
exec add_flight '', 'Tehran', 'Toronto', '24/09/1400', '', 200, 'Airtranairways', 520000;
exec add_flight '', 'Tehran', 'Toronto', '25/08/1400', '', 200, 'Jetblue', 560000;
exec add_flight '', 'Tehran', 'Toronto', '26/09/1400', '', 200, 'Jetblue', 570000;
exec add_flight '', 'Tehran', 'Toronto', '26/05/1400', '', 200, 'Jetblue', 580000;

exec add_flight '', 'Tehran', 'Frankfurt', '27/09/1400', '', 200, 'Lufthansa', 600000;
exec add_flight '', 'Tehran', 'Frankfurt', '28/09/1400', '', 200, 'Eurowings', 580000;
exec add_flight '', 'Tehran', 'Frankfurt', '26/08/1400', '', 200, 'AeroLogic', 520000;

exec add_flight '', 'Tehran', 'Najaf', '20/09/1400', '', 300, 'Mahan', 5000000;
exec add_flight '', 'Tehran', 'Kish', '20/09/1400', '25/09/1400', 300, 'Iranair', 500000;
exec add_flight '', 'Tehran', 'Kish', '20/09/1400', '', 300, 'Iranair', 500000;
exec add_flight '', 'Tehran', 'Kish', '21/09/1400', '', 300, 'Iranair', 500000;
exec add_flight '', 'Tehran', 'Kish', '21/09/1400', '', 300, 'Mahan', 500000;

exec add_flight '', 'Bandar Abbas', 'Dubai', '21/09/1400', '', 100, 'Mahan', 5000000;
exec add_flight '', 'Bandar Abbas', 'Dubai', '14/09/1400', '', 100, 'Mahan', 5000000;
select * from flights;
---------------------------------------------------------------------------------------------------------------------
--5)
exec add_flight_order 'Los Angeles', 'Tehran', '20/09/1400', '', 1, 'johnwick@gmail.com';
exec add_flight_order 'Los Angeles', 'Tehran', '20/08/1400', '', 1, 'johnwick@gmail.com';
exec add_flight_order 'Los Angeles', 'Tehran', '20/08/1400', '', 1, 'hosseinmahdavi@gmail.com';
exec add_flight_order 'Los Angeles', 'Tehran', '20/09/1400', '', 1, 'hosseinmahdavi@gmail.com';
exec add_flight_order 'Los Angeles', 'Tehran', '20/09/1400', '', 2, 'hosseinmahdavi@gmail.com';

exec add_flight_order 'Tehran', 'Frankfurt', '27/09/1400', '', 1, 'johnwick@gmail.com';
exec add_flight_order 'Tehran', 'Frankfurt', '28/09/1400', '', 1, 'johnwick@gmail.com';
exec add_flight_order 'Tehran', 'Frankfurt', '26/08/1400', '', 1, 'johnwick@gmail.com';

exec add_flight_order 'Tehran', 'Frankfurt', '27/09/1400', '', 2, 'hosseinmahdavi@gmail.com';
exec add_flight_order 'Tehran', 'Frankfurt', '28/09/1400', '', 2, 'hosseinmahdavi@gmail.com';
exec add_flight_order 'Tehran', 'Frankfurt', '26/08/1400', '', 2, 'hosseinmahdavi@gmail.com';

exec add_flight_order 'Tehran', 'Frankfurt', '26/08/1400', '', 3, 'zohrehrasouli@gmail.com';
exec add_flight_order 'Tehran', 'Frankfurt', '27/09/1400', '', 3, 'zohrehrasouli@gmail.com';

exec add_flight_order 'Bandar Abbas', 'Dubai', '21/09/1400', '', 3, 'johnwick@gmail.com';
exec add_flight_order 'Bandar Abbas', 'Dubai', '14/09/1400', '', 3, 'armanfadaei@gmail.com';

select * from users
select * from flight_orders;
select * from transactions where descrip = 'flight ticket';
---------------------------------------------------------------------------------------------------------------------
--6)
exec add_bus_order 'Tehran', 'Mashhad', '23/09/1400', '', 6, 'mohammadsajjadi@gmail.com';
exec add_bus_order 'Tehran', 'Mashhad', '23/09/1400', '', 13, 'johnwick@gmail.com';
exec add_bus_order 'Tehran', 'Mashhad', '23/09/1400', '', 12, 'armanfadaei@gmail.com';
exec add_bus_order 'Tehran', 'Bandar Abbas', '16/09/1400', '', 1, 'johnwick@gmail.com';
exec add_bus_order 'Tehran', 'Bandar Abbas', '16/09/1400', '', 2, 'armanfadaei@gmail.com';

select * from bus_orders;
select * from transactions where descrip = 'bus ticket';
---------------------------------------------------------------------------------------------------------------------
--7)
exec add_bus_order 'Tehran', 'Mashhad', '23/09/1400', '', 7, 'zohrehrasouli@gmail.com';
select * from bus_orders;
select * from transactions where descrip = 'bus ticket';
---------------------------------------------------------------------------------------------------------------------
--8)
exec change_bus_ticket 'Tehran', 'Mashhad' , '23/09/1400', '', 7, 10, 'zohrehrasouli@gmail.com';
select * from transactions where descrip = 'bus ticket changed';
---------------------------------------------------------------------------------------------------------------------
--9)
--add hotel
exec add_hotel 'Spinas', '', 0, '', 'Tehran', 'hotel';
exec add_hotel 'Laleh', '', 0, '', 'Tehran', 'hotel';
--add 10 rooms
declare @i int =0;
while @i<10
begin
	set @i = @i + 1;
	exec add_room 2, 'VIP', 1, 1000000, 'Spinas';
end;
---------------------------------------------------------------------------------------------------------------------
--10)
exec add_hotel_order 'Spinas', 2, '20/09/1400', '', 'johnwick@gmail.com'; 
exec add_hotel_order 'Spinas', 2, '20/09/1400', '', 'zohrehrasouli@gmail.com'; 
exec add_hotel_order 'Spinas', 2, '20/09/1400', '', 'zohrehrasouli@gmail.com'; 
---------------------------------------------------------------------------------------------------------------------
--Insert
select * into non_zero_balance
from users
where balance <> 0;

select * from non_zero_balance;


