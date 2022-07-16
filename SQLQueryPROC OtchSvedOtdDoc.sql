CREATE PROC OtchSvedOtdDoc
@KodDoc int
as 
begin
select FIO ,Ocenki.Data,Ocenka, Komment 
from Polzovatel, Ocenki
where Polzovatel.KodUsar=Ocenki.KodUsar and Ocenki.KodDoc=@KodDoc
end
