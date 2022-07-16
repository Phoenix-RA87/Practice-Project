CREATE PROC VvodUsar
@FIO char(20),
@Status char(20),
@Password int,
@KodGrupp int
AS
INSERT INTO Polzovatel(FIO, Status, Password, KodGrupp) 
VALUES (@FIO, @Status, @Password, @KodGrupp)