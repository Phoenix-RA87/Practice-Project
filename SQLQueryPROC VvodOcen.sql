CREATE PROC VvodOcen
@KodDoc int,
@Ocenka int,
@Data date,
@Komment char(70),
@KodUsar int
AS
INSERT INTO Ocenki(KodDoc,Ocenka, Data, Komment, KodUsar) 
VALUES (@KodDoc, @Ocenka, @Data, @Komment, @KodUsar)