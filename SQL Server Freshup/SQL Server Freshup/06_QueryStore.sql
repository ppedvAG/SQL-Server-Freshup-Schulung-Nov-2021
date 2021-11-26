--NIX_ID auf KU

set statistics io, time on


select * from ku where id = 100 --IX SEEK --Lookup--4


select * from ku where id < 100 --IX SEEK --Lookup--4

select * from ku where id < 12000 --T SCAN --58000 als SEEK

select * from ku where id < 11600 --bis ca 11600 Seek darüber ein SCAN

select * from ku where id < 11600 --bis ca 11600 Seek darüber ein SCAN

select * from ku where id < 1000000


--Proz soll gleiches liefern
create proc gpdemo @par int
as
select * from ku where id < @par


--Proc wird kompiliert.. beim erste Aufruf der Proz wird der idelae Plan generiert
--und bleibt (auch nach Neustart)

exec gpdemo 100 --102 Seiten  IX SEEK mit Lookup


exec gpdemo 12000 --immer noch Seek

exec gpdemo 1000000-- Seek mit Lookup : Seiten wtf 1.014.794!!!!!
--Tabelle hat nur 58.000 Seiten
--= 4609 ms, verstrichene Zeit = 21608 ms.
--, CPU-Zeit = 3453 ms, verstrichene Zeit = 20856 ms.


dbcc freeproccache

ALTER DATABASE SCOPED CONFIGURATION CLEAR PROCEDURE_CACHE;

exec gpdemo 1000000


exec gpdemo 11000
