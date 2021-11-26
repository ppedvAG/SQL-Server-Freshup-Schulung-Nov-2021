--DTA

--PLan Cache nicht repr...
--hypoth Indizes _dta_ix--
--werden aber von der Engine nicht verwendet
--sind unsichtbar
--werden autom gelöscht , wenn Analyse fertig ist

--Tu nie den DTA abschiessen

delete from customers where customerid = 'ALFKI'

select * from sys.indexes

