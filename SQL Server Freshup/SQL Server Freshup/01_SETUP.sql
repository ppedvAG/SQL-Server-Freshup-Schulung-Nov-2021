--Seit SQL Server 2016 + SP1 
--ist "im Prinzip" jede Edition einen Ent Edition

--HOST: 4 Kerne  16 GB  1 HDD
--f�r VM: OS - 4 GB --> 12 GB
--Sockets: 1

--           RAM           CPU
--> DC:      512-2048        2
--> SQL1     fix:5500		 4 
--> SQL2     fix:4500        4

----------------------------------------


-->NUMA --Zuordnung Sockel --> RAM Slots.
--> VM sollte die akt Hardware wiederspiegeln
--> Vorsicht bei Migration


--Schulung\Administrator  ppedv2019!

--> NT Service\MSSQL$FE
--LOKALE Konten --> \\  per Computerkonto
-- nicht bei Cluster
--autom Kennw�rter

--wir k�nnten auch mit DOM User arbeiten
--gedanklicher Hacken DOM\svcSQL

--weil der SQL Server auch bei DOM ServciceKonte 
--lokal immer noch die NT Serv ice verwendet



--Volumewartungstask

--Recht f�r Dienstkonto autom Vergr��erungen 
--der DB zu �bernehmen ohne vorher auszunullen

--einem guten Admin ist das rel egal
--weil der das kontrolliert macht 

/*
TEMPDB

eig HDD 
trenne Log von Daten
Anzahl der Datendateien = Anzahl der Kerne (Max 8)
T1117 gleiches Wachstum f�r alle Dateien nur bei autom Wachstum
T1118 uniform extents fr�her manuell setzen


MAXDOP
Wieviele Kerne verwendet eine Abfrage maximal
1 oder alle (0)
heute 
1 oder max 8

RAM
Reservierung f�r os bei mind 2 GB
Min = 0 -- der z�hlt erst , wenn erreicht



*/