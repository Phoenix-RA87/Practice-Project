USE [PP_Roman_Andrey]
GO
/****** Object:  StoredProcedure [dbo].[VvodDiscipl]    Script Date: 03/23/2016 14:22:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROC [dbo].[VvodDiscipl]
@NazvDiscipl char(20)
AS
Insert into Discipl(NazvDiscipl) values(@NazvDiscipl)
