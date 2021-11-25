/*
GR IX  
NGR IX

zusammengesetzter IX
IX mit eingeschl. Spalten
gefilterten IX
abdeckender IX 
realen hypth IX

part Index nur in Ent, aber seit SQL 2016 SP1 auch in allen Versionen

Columnstore NG IX in SQL 2012 Ent ..nicht akt-bar
ColumnStore GR IX in SQL 2014 .. akt-bar!

Columnstore SQL 2016 Sp1 .. auch ab SSEX Version

Verbesserungen: optimiert CPU schonend
	--> Techniken des CS IX wandern in normale Daten rein..




*/
--Tabelle KU mit jeder Menge Infos

SELECT        Customers.CustomerID, Customers.CompanyName, Customers.ContactName, Customers.ContactTitle, Customers.City, Customers.Country, Orders.EmployeeID, Orders.OrderDate, Orders.Freight, Orders.ShipCity, 
                         Orders.ShipCountry, [Order Details].OrderID, [Order Details].ProductID, [Order Details].UnitPrice, [Order Details].Quantity, Employees.LastName, Employees.FirstName, Products.ProductName, Products.UnitsInStock, 
                         Categories.CategoryName, Products.CategoryID
INTO KU
FROM            Customers INNER JOIN
                         Orders ON Customers.CustomerID = Orders.CustomerID INNER JOIN
                         [Order Details] ON Orders.OrderID = [Order Details].OrderID INNER JOIN
                         Products ON [Order Details].ProductID = Products.ProductID INNER JOIN
                         Employees ON Orders.EmployeeID = Employees.EmployeeID INNER JOIN
                         Categories ON Products.CategoryID = Categories.CategoryID




insert into ku
select * from ku

--Ende bei 1,1 Mio DS...


alter table ku add id int identity --eindeutige DS


select * into ku2 from ku


dbcc showcontig('ku') --44889
dbcc showcontig('ku2') --44863


select top 3 * from ku


--Irgendeine Abfrage, die ein Where haben sollte und ein AGG  Summe pro 


--Gesamten Umsatz pro Produkt für ALFKI

set statistics io , time on

--idealer Index: 

--Regel für IX

/*
zuerst den CL IX festlegen.. den gibts nur 1 mal.. der ist gut bei Bereichsabfragen
NCL IX .. den kann man pro Tabelle auch 1000 mal.. gut bei rel wenigern Ergebnissen


..cl ix auf Orderdate
*/

select productname , sum(unitprice*quantity) 
from ku
where Customerid = 'ALFKI'
group by productname

--59 Seiten... 0 bis 3 ms
--was wäre wenn Abfrage sich ändert--> dann anderer IX ...subba ;-(

select productname , sum(unitprice*quantity) 
from ku2
where Customerid = 'ALFKI'
group by productname --gleich schnell


--neuer IX fällig
select productname , sum(unitprice*quantity) 
from ku
where Employeeid = 1
group by productname

--neuer IX fällig
select productname , employeeid, sum(unitprice*quantity) 
from ku
where customerid ='ALFKI'




select productname , sum(unitprice*quantity) 
from ku2
where Employeeid = 1
group by productname

--neuer IX fällig
select productname , employeeid, sum(unitprice*quantity) 
from ku2
where customerid ='ALFKI'
group by productname,employeeid


--alle Abfragen sind auf Ku2 pfeilschnell ohne neuen IX..

--Irre.. KU2 hat nur 3,6 MB statt 420 MB (ku)

--es sind 3,6MB ..komprimiert


--der normnale Kompresion kommt auf 40 bis 60%


---diese 3.2 MB durch ArchivKompression kommen 1 : 1 in RAM

DMV--für CS
select * from sys.dm_db_column_store_row_group_physical_stats



