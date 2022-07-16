CREATE PROC SoRabotStud
@KodUsar int
as 
select avg(Ocenka) from Ocenki where Ocenki.KodUsar=@KodUsar
