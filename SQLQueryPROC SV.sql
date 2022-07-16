CREATE PROC SV
@KodDoc int 
as 
select avg(Ocenka) from Ocenki where Ocenki.KodDoc=@KodDoc
