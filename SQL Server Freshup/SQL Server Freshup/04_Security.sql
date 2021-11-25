/*

Always Encrypted
TDE
Row level Security
Dynamic Data Masking

--Daten eigtl gar nicht verschlüsselt, sondern nur in der Ausgabe ukenntlich gemacht.. 
geht rein per Security : RECHT UNMASK

benutzdef Serverrollen


--TDE: verschlüsseln der Dateien


--Always Encrypted  Daten veschlüsselt auc für Admin
--SSMS  aktivierung unter Always Enc
--Assistent verwenen
--Verschl rein im Arbeitsspeicher
--Problem : Wo ist gerade das verflixte Zeritfikat (Benutzerkonto, Computerkonto)










*/

use testdb

select * into best from northwind..orders

--Sichten

create view vSales1
as
select OrderID  ,   Product 
    from Sales3 where orderid in (1,2,3)

select * from vsales1 --Sicht können eig Rechte haben unabh. von Tabelle

--Gib nie einen norm. User das Recht Sichten anlegen zu dürfen



--Besitzverkettung

--dbo. employees     --schema IT     it.vdemo
--  dbo                Hans              dbo
