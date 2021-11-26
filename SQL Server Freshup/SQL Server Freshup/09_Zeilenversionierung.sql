--Ändern hindert nicht mehr das Lesen

USE [master]
GO
ALTER DATABASE [DynMask] SET READ_COMMITTED_SNAPSHOT ON WITH NO_WAIT
GO
ALTER DATABASE [DynMask] SET ALLOW_SNAPSHOT_ISOLATION ON
GO


--per default


--Leser bekommt gültigen DS nicht de, akt aus der TX , der evtl rollback gemacht wird

--Vorsicht traffic auf tempdb ..massiv