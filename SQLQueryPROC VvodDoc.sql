USE [PP_Roman_Andrey]
GO
/****** Object:  StoredProcedure [dbo].[VvodDoc]    Script Date: 03/23/2016 19:12:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROC [dbo].[VvodDoc]
@NazvDoc char(30),
@KodDiscipl int,
@KodUsar int,
@Data date, 
@SamoOcen int,
@DocFile nvarchar(MAX)
AS
INSERT INTO Doc(NazvDoc, KodDiscipl, KodUsar, Data, SamoOcen, DocFile)
 Values (@NazvDoc, @KodDiscipl, @KodUsar, @Data, @SamoOcen, @DocFile)