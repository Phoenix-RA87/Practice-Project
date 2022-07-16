
CREATE TABLE Discipl(
    KodDiscipl     int         NOT NULL,
    NazvDiscipl    char(20)    NULL,
    CONSTRAINT PK5 PRIMARY KEY NONCLUSTERED (KodDiscipl)
)
go



IF OBJECT_ID('Discipl') IS NOT NULL
    PRINT '<<< CREATED TABLE Discipl >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Discipl >>>'
go

/* 
 * TABLE: Doc 
 */

CREATE TABLE Doc(
    KodDoc        int         NOT NULL,
    NazvDoc       char(30)    NULL,
    Data          date        NULL,
    SamoOcen      char(10)    NULL,
    DocFile       char(10)    NULL,
    KodUsar       int         NOT NULL,
    KodDiscipl    int         NOT NULL,
    CONSTRAINT PK6 PRIMARY KEY NONCLUSTERED (KodDoc)
)
go



IF OBJECT_ID('Doc') IS NOT NULL
    PRINT '<<< CREATED TABLE Doc >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Doc >>>'
go

/* 
 * TABLE: Gruppa 
 */

CREATE TABLE Gruppa(
    KodGrupp     int         NOT NULL,
    NazvGrupp    char(30)    NULL,
    CONSTRAINT PK2 PRIMARY KEY NONCLUSTERED (KodGrupp)
)
go



IF OBJECT_ID('Gruppa') IS NOT NULL
    PRINT '<<< CREATED TABLE Gruppa >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Gruppa >>>'
go

/* 
 * TABLE: Ocenki 
 */

CREATE TABLE Ocenki(
    KodOcen    int         NOT NULL,
    KodDoc     int         NULL,
    Ocenka     int         NULL,
    Data       date        NULL,
    Komment    char(70)    NULL,
    KodUsar    int         NOT NULL,
    CONSTRAINT PK8 PRIMARY KEY NONCLUSTERED (KodOcen)
)
go



IF OBJECT_ID('Ocenki') IS NOT NULL
    PRINT '<<< CREATED TABLE Ocenki >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Ocenki >>>'
go

/* 
 * TABLE: Polzovatel 
 */

CREATE TABLE Polzovatel(
    KodUsar     int         NOT NULL,
    FIO         char(20)    NULL,
    Status      char(20)    NULL,
    Password    int         NULL,
    KodGrupp    int         NOT NULL,
    CONSTRAINT PK4 PRIMARY KEY NONCLUSTERED (KodUsar)
)
go



IF OBJECT_ID('Polzovatel') IS NOT NULL
    PRINT '<<< CREATED TABLE Polzovatel >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Polzovatel >>>'
go

/* 
 * INDEX: Ref416 
 */

CREATE INDEX Ref416 ON Doc(KodUsar)
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('Doc') AND name='Ref416')
    PRINT '<<< CREATED INDEX Doc.Ref416 >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX Doc.Ref416 >>>'
go

/* 
 * INDEX: Ref517 
 */

CREATE INDEX Ref517 ON Doc(KodDiscipl)
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('Doc') AND name='Ref517')
    PRINT '<<< CREATED INDEX Doc.Ref517 >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX Doc.Ref517 >>>'
go

/* 
 * INDEX: Ref418 
 */

CREATE INDEX Ref418 ON Ocenki(KodUsar)
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('Ocenki') AND name='Ref418')
    PRINT '<<< CREATED INDEX Ocenki.Ref418 >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX Ocenki.Ref418 >>>'
go

/* 
 * INDEX: Ref219 
 */

CREATE INDEX Ref219 ON Polzovatel(KodGrupp)
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('Polzovatel') AND name='Ref219')
    PRINT '<<< CREATED INDEX Polzovatel.Ref219 >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX Polzovatel.Ref219 >>>'
go

/* 
 * TABLE: Doc 
 */

ALTER TABLE Doc ADD CONSTRAINT RefPolzovatel16 
    FOREIGN KEY (KodUsar)
    REFERENCES Polzovatel(KodUsar) ON UPDATE CASCADE
go

ALTER TABLE Doc ADD CONSTRAINT RefDiscipl17 
    FOREIGN KEY (KodDiscipl)
    REFERENCES Discipl(KodDiscipl) ON UPDATE CASCADE
go


/* 
 * TABLE: Ocenki 
 */

ALTER TABLE Ocenki ADD CONSTRAINT RefPolzovatel18 
    FOREIGN KEY (KodUsar)
    REFERENCES Polzovatel(KodUsar) ON UPDATE CASCADE
go


/* 
 * TABLE: Polzovatel 
 */

ALTER TABLE Polzovatel ADD CONSTRAINT RefGruppa19 
    FOREIGN KEY (KodGrupp)
    REFERENCES Gruppa(KodGrupp) ON UPDATE CASCADE
go


