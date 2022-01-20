import pyodbc
cnxn = pyodbc.connect('DSN=REZA;Database=alibaba;')

cursor = cnxn.cursor()

params = ('Los Angeles', 'Tehran', 1)
cursor.execute("{CALL  purchasedTickets (?,?,?) }", params)
row = cursor.fetchone()
while row:
    print(row)
    row = cursor.fetchone()

params = ('Tehran', 'Kish', '21/09/1400')
cursor.execute(
    "{CALL allDomesticFlights (?,?,?)}", params)
row = cursor.fetchone()
while row:
    print(row)
    row = cursor.fetchone()


params = ('Tehran')
sql = """\
declare @city_id int
exec @city_id = get_city_id ?;
select @city_id as city_id;
"""
cursor.execute(sql, params)
return_value = cursor.fetchval()

print(return_value)
