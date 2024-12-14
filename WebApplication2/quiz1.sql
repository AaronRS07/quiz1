
create database sistema
go

-- Crear la tabla SCHOOL
CREATE TABLE SCHOOL (
    SchoolId INT PRIMARY KEY,
    SchoolName VARCHAR(50) NOT NULL,
    Description VARCHAR(1000) NULL,
    Address VARCHAR(50) NOT NULL,
    Phone VARCHAR(50) NULL,
    PostCode VARCHAR(50) NULL,
    PostAddress VARCHAR(50) NULL
);

-- Crear la tabla CLASS
CREATE TABLE CLASS (
    ClassId INT PRIMARY KEY,
    SchoolId INT NOT NULL,
    ClassName VARCHAR(50) NOT NULL,
    Description VARCHAR(1000) NULL,
    CONSTRAINT FK_Class_School FOREIGN KEY (SchoolId) REFERENCES SCHOOL(SchoolId)
);
-- Procedimientos para SCHOOL

-- Agregar una escuela
CREATE PROCEDURE AddSchool
    @SchoolId INT,
    @SchoolName VARCHAR(50),
    @Description VARCHAR(1000),
    @Address VARCHAR(50),
    @Phone VARCHAR(50),
    @PostCode VARCHAR(50),
    @PostAddress VARCHAR(50)
AS
BEGIN
    INSERT INTO SCHOOL (SchoolId, SchoolName, Description, Address, Phone, PostCode, PostAddress)
    VALUES (@SchoolId, @SchoolName, @Description, @Address, @Phone, @PostCode, @PostAddress);
END;

-- Borrar una escuela
CREATE PROCEDURE DeleteSchool
    @SchoolId INT
AS
BEGIN
    DELETE FROM SCHOOL WHERE SchoolId = @SchoolId;
END;

-- Consultar escuelas con filtros
CREATE PROCEDURE GetSchoolsFiltered
    @SchoolId INT = NULL,
    @SchoolName VARCHAR(50) = NULL
AS
BEGIN
    SELECT * 
    FROM SCHOOL
    WHERE (@SchoolId IS NULL OR SchoolId = @SchoolId)
      AND (@SchoolName IS NULL OR SchoolName LIKE '%' + @SchoolName + '%');
END;

-- Modificar una escuela
CREATE PROCEDURE UpdateSchool
    @SchoolId INT,
    @SchoolName VARCHAR(50),
    @Description VARCHAR(1000),
    @Address VARCHAR(50),
    @Phone VARCHAR(50),
    @PostCode VARCHAR(50),
    @PostAddress VARCHAR(50)
AS
BEGIN
    UPDATE SCHOOL
    SET SchoolName = @SchoolName,
        Description = @Description,
        Address = @Address,
        Phone = @Phone,
        PostCode = @PostCode,
        PostAddress = @PostAddress
    WHERE SchoolId = @SchoolId;
END;

-- Procedimientos para CLASS

-- Agregar una clase
CREATE PROCEDURE AddClass
    @ClassId INT,
    @SchoolId INT,
    @ClassName VARCHAR(50),
    @Description VARCHAR(1000)
AS
BEGIN
    INSERT INTO CLASS (ClassId, SchoolId, ClassName, Description)
    VALUES (@ClassId, @SchoolId, @ClassName, @Description);
END;

-- Borrar una clase
CREATE PROCEDURE DeleteClass
    @ClassId INT
AS
BEGIN
    DELETE FROM CLASS WHERE ClassId = @ClassId;
END;

-- Consultar clases con filtros
CREATE PROCEDURE GetClassesFiltered
    @ClassId INT = NULL,
    @SchoolId INT = NULL,
    @ClassName VARCHAR(50) = NULL
AS
BEGIN
    SELECT * 
    FROM CLASS
    WHERE (@ClassId IS NULL OR ClassId = @ClassId)
      AND (@SchoolId IS NULL OR SchoolId = @SchoolId)
      AND (@ClassName IS NULL OR ClassName LIKE '%' + @ClassName + '%');
END;

-- Modificar una clase
CREATE PROCEDURE UpdateClass
    @ClassId INT,
    @SchoolId INT,
    @ClassName VARCHAR(50),
    @Description VARCHAR(1000)
AS
BEGIN
    UPDATE CLASS
    SET SchoolId = @SchoolId,
        ClassName = @ClassName,
        Description = @Description
    WHERE ClassId = @ClassId;
END;

EXEC GetSchoolsFiltered @SchoolName = 'Green';
EXEC GetClassesFiltered @SchoolId = 1;
EXEC GetClassesFiltered @ClassId = 101;

