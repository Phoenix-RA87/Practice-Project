CREATE PROC SvedRabotStud
@KodUsar int
as 
select NazvDiscipl,NazvDoc,SamoOcen,FIO,Ocenka,Komment from Discipl,Doc,Ocenki,Polzovatel
 where Discipl.KodDiscipl=Doc.KodDiscipl and Polzovatel.KodUsar=Doc.KodUsar and Ocenki.KodOcen=Doc.KodUsar
