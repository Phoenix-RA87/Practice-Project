CREATE PROC RabotStudOtch3
@KodUsar int
as
select NazvDiscipl,NazvDoc,SamoOcen,COUNT(*)as kol,AVG(Ocenka)as s from Discipl,Doc,Ocenki 
where Discipl.KodDiscipl=Doc.KodDiscipl 
and Ocenki.KodDoc=Doc.KodDoc
and Doc.KodUsar=@KodUsar
group by NazvDiscipl,NazvDoc,SamoOcen
