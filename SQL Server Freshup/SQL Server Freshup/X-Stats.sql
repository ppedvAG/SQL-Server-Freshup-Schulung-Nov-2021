select * into mess from sysmessages

alter table mess add id int identity

select  top 10 * from sysmessages


select * from mess where id = 100 --1


select * from mess where error = 208 --20,334

select * from mess where severity = 16 --229000  229800

--Wieso machst das eigtl??

--Je mehr Zeilen--> desto mehr RAM vermutlich
--je mehr Zeilen desto mehr Kosten, desto mehr CPU -- desto eher MAXDOP

--bei falscher Statistik echte Probleme
--Spaltenstat machen Stichproben..
--IX sind immer 100% genau
--keine autom über Spaltenkombis

select * from mess where severity = 16 and msglangid=1033




