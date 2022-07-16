CREATE PROC Otch5
@KodGrupp int
as 
select NazvDiscipl,FIO,COUNT(*) as kolrabot,COUNT(*) as kolprosmotr,AVG(Ocenka) as sredo 
from Ocenki,Discipl,Polzovatel,Doc 
where  Discipl.KodDiscipl=Doc.KodDiscipl 
and Ocenki.KodDoc=Doc.KodDoc
and Polzovatel.KodGrupp=@KodGrupp
group by NazvDiscipl,FIO
