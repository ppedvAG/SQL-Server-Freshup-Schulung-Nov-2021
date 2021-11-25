/*
Default:
SQL 2014:  Daten 5 Mb  Logfile 2 MB
                 1MB           10%


Heute 8 + 8 MB
Wachstum 64 MB

Wachstum sollte nicht unkontrolliert passieren

--Wie groß wird der sql Server in 3 Jahren?
--Logfiles haben VLFs

-----------------------------------------------------
VLF1  VLF2 VLF3 123123  1        2       3
-----------------------------------------------------

-bei vielen VLF: Restore dauert länger
--, Start einer DB dauert länger


bis 64 -->  eher 1000MB



*/

create database testdb

--Scoped Database
--MAXDOP

--je näher an der Abfrage desto eher ein konf Wert

Server:4
DB: 8
Abfrage:

set statistics io , time on
select * from orders

select * from orders
