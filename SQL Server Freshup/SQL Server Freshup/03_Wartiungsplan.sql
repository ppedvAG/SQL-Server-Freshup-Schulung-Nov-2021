--keine neuen Aufgaben

/*

Backup
Index / Statistik Wartung
	--Rebuild
	--Reorg
	--STAT update

IX fragmentieren

folgende Infos fehlten bis SQL 2014 inkl
ab 10% Reorg
10 bis 30% Rebuild (in dt Neuerstellen .. iss es aber nich)
ab 1000 Seiten warten
und verwendet innnerhalb 7 Tage
--nicht neu starten!!!!!!!


200MB Daten + 1 GR IX + 2 NG IX--> 363 MB

--Rebuild (online|offline) (mit tempdb|ohne tempdb)

--------größter  ON + tempdb --> 1100 MB
------- geringster oFF OHNE TEMPDB ---> 860MB





*/

select * from sys.dm_db_index_usage_stats