create database LongRaceCCC
use LongRaceCCC

CREATE TABLE Corredores (
    CorredorID INT PRIMARY KEY,  -- ID del corredor (1-5 seg�n la selecci�n)
    Nombre NVARCHAR(50) NOT NULL, -- Nombre del corredor
    Numero INT NOT NULL  -- N�mero del corredor (igual al CorredorID en este caso)
);

CREATE TABLE Registros (
    RegistroID INT IDENTITY(1,1) PRIMARY KEY, -- ID �nico para cada registro
    CorredorID INT, -- ID del corredor
    Puntos INT, -- Puntos de control asignados
    Tiempo INT, -- Tiempo en minutos
    PuntosCalculados DECIMAL(5,2), -- Puntos calculados en base al tiempo
    FOREIGN KEY (CorredorID) REFERENCES Corredores(CorredorID)
);

CREATE TABLE Descalificaciones (
    DescalificacionID INT IDENTITY(1,1) PRIMARY KEY, -- ID �nico para cada descalificaci�n
    CorredorID INT, -- ID del corredor
    Razon NVARCHAR(255) NOT NULL, -- Raz�n de la descalificaci�n
    FechaDescalificacion DATETIME DEFAULT GETDATE(), -- Fecha de la descalificaci�n
    FOREIGN KEY (CorredorID) REFERENCES Corredores(CorredorID)
);

CREATE TABLE Descalificaciones (
    DescalificacionID INT IDENTITY(1,1) PRIMARY KEY, -- ID �nico para cada descalificaci�n
    CorredorID INT, -- ID del corredor
    Razon NVARCHAR(255) NOT NULL, -- Raz�n de la descalificaci�n
    FechaDescalificacion DATETIME DEFAULT GETDATE(), -- Fecha de la descalificaci�n
    FOREIGN KEY (CorredorID) REFERENCES Corredores(CorredorID)
);

CREATE table userss(
email varchar(max)not null,
contrasena varchar(max) not null
);

CREATE TABLE Ciclistass (
    CiclistaID INT PRIMARY KEY,  -- ID �nico del ciclista
    Nombre NVARCHAR(100) NOT NULL,              -- Nombre del ciclista
    FechaNacimiento DATE,                       -- Fecha de nacimiento
    Ubicacion NVARCHAR(100),                    -- Ubicaci�n
    Telefono NVARCHAR(20),                      -- N�mero de tel�fono
    Correo NVARCHAR(100),                       -- Correo electr�nico
    GrupoSanguineo NVARCHAR(5),                 -- Grupo sangu�neo
    CondicionesMedicas NVARCHAR(255),           -- Condiciones m�dicas
    ContactoEmergencia NVARCHAR(100)            -- Contacto de emergencia
);

CREATE TABLE Actividades (
    ActividadID INT IDENTITY(1,1) PRIMARY KEY,  -- ID �nico de la actividad
    CiclistaID INT,                             -- ID del ciclista
    Titulo NVARCHAR(100) NOT NULL,              -- T�tulo de la actividad
    Distancia DECIMAL(5,2) NOT NULL,            -- Distancia recorrida en kil�metros
    Duracion TIME NOT NULL,                     -- Duraci�n de la actividad
    VelocidadPromedio DECIMAL(5,2) NOT NULL,    -- Velocidad promedio en km/h
    Fecha DATETIME DEFAULT GETDATE(),           -- Fecha de la actividad
    FOREIGN KEY (CiclistaID) REFERENCES Ciclistas(CiclistaID)
);

create table likess(id INT PRIMARY KEY IDENTITY(1,1),
publicacion_id INT NOT NULL,
texto NVARCHAR(500) NOT NULL,
fecha DATETIME DEFAULT GETDATE()
);

create table comentarios( 
id INT IDENTITY(1,1) PRIMARY KEY,
texto NVARCHAR(500) NOT NULL,
fecha DATETIME DEFAULT GETDATE()
);

CREATE TABLE RouteDetails (
    RouteID INT PRIMARY KEY IDENTITY(1,1),
    Distance DECIMAL(5, 2) NOT NULL,
    Duration INT NOT NULL,
    Elevation INT NOT NULL,
    TerrainType NVARCHAR(50) NOT NULL,
    Difficulty NVARCHAR(50) NOT NULL,
    RouteDate DATE NOT NULL,
    StartTime TIME NOT NULL
);

CREATE TABLE PointsOfInterest (
    PointID INT PRIMARY KEY IDENTITY(1,1),
    RouteID INT FOREIGN KEY REFERENCES RouteDetails(RouteID),
    PointName NVARCHAR(100) NOT NULL,
    Description NVARCHAR(500) NOT NULL
);

-- Tabla de Rutas
CREATE TABLE Rutas (
    idRuta INT PRIMARY KEY,
    nombre NVARCHAR(100)
);

-- Tabla de Carreras
CREATE TABLE Carreras (
    idCarrera INT PRIMARY KEY,
    nombre NVARCHAR(100)
);

-- Tabla de Eventos
CREATE TABLE Eventos (
    idEvento INT PRIMARY KEY,
    nombre NVARCHAR(100),
    cantidadParticipantes INT,
    fecha DATE,
    horarioInicio TIME,
    horaFinalizacion TIME,
    modalidad NVARCHAR(50),
    clasificacion NVARCHAR(50),
    idRuta INT,
    idCarrera INT,
    FOREIGN KEY (idRuta) REFERENCES Rutas(idRuta),
    FOREIGN KEY (idCarrera) REFERENCES Carreras(idCarrera)
);

CREATE TABLE Inscripciones (
    idInscripcion INT PRIMARY KEY IDENTITY(1,1),
    idEvento INT,
    idCiclista INT,
    fechaInscripcion DATE,
    FOREIGN KEY (idEvento) REFERENCES Eventos(idEvento),
	FOREIGN KEY (idCiclista) REFERENCES Ciclist(idCiclista)
);

CREATE TABLE Ciclist(
    idCiclista INT PRIMARY KEY,
    nombre NVARCHAR(100),
    apellido NVARCHAR(100),
    email NVARCHAR(100)
);


  

INSERT INTO Ciclist (idCiclista, nombre, apellido, email)
VALUES
(1, 'Juan', 'P�rez', 'juan.perez@example.com'),
(2, 'Mar�a', 'G�mez', 'maria.gomez@example.com');

INSERT INTO Corredores (CorredorID, Nombre, Numero) VALUES
(1, 'Juan P�rez', 1),
(2, 'Mar�a Garc�a', 2),
(3, 'Carlos S�nchez', 3),
(4, 'Luc�a Fern�ndez', 4),
(5, 'Miguel Ram�rez', 5);

INSERT INTO Corredores (CorredorID, Nombre) VALUES
(1, 'Juan P�rez' ),
(2, 'Mar�a Garc�a' ),
(3, 'Carlos S�nchez' ),
(4, 'Luc�a Fern�ndez' ),
(5, 'Miguel Ram�rez'),
(6, 'Richtofen' ),
(7, 'Peterparker');

-- Insertar datos de ciclistas
INSERT INTO Ciclist (idCiclista, nombre, apellido, email)
VALUES
(6, 'Luis', 'Gonz�lez', 'luis.gonzalez@example.com'),
(7, 'Laura', 'Fern�ndez', 'laura.fernandez@example.com'),
(8, 'Jorge', 'Hern�ndez', 'jorge.hernandez@example.com'),
(9, 'Sof�a', 'Ram�rez', 'sofia.ramirez@example.com'),
(10, 'Miguel', 'Torres', 'miguel.torres@example.com');

INSERT INTO Ciclistass (CiclistaID, Nombre, FechaNacimiento, Ubicacion, Telefono, Correo, GrupoSanguineo, CondicionesMedicas, ContactoEmergencia)
VALUES
(6, 'Luis Gonz�lez', '1983-08-10', 'Toluca', '555-1620', 'luis.gonzalez@example.com', 'A+', 'Ninguna', 'Marta Gonz�lez'),
(7, 'Laura Fern�ndez', '1991-03-25', 'Morelia', '555-1824', 'laura.fernandez@example.com', 'B-', 'Hipotiroidismo', 'Jose Fern�ndez'),
(8, 'Jorge Hern�ndez', '1986-12-19', 'Tijuana', '555-2046', 'jorge.hernandez@example.com', 'AB+', 'Migra�as', 'Ana Hern�ndez'),
(9, 'Sof�a Ram�rez', '1993-07-04', 'Canc�n', '555-2225', 'sofia.ramirez@example.com', 'O-', 'Artritis', 'Carlos Ram�rez'),
(10, 'Miguel Torres', '1989-01-11', 'Veracruz', '555-2418', 'miguel.torres@example.com', 'O+', 'Alergia a mariscos', 'Luc�a Torres');

-- Insertar datos de actividades
INSERT INTO Actividades (CiclistaID, Titulo, Distancia, Duracion, VelocidadPromedio) VALUES
(1, 'Ruta en la Monta�a', 20.0, '00:30:00', 25.0),
(1, 'Paseo por la Ciudad', 10.0, '00:15:00', 22.0);

-- Insertar un recorrido en la tabla RouteDetails
INSERT INTO RouteDetails (Distance, Duration, Elevation, TerrainType, Difficulty, RouteDate, StartTime)
VALUES (25.0, 90, 300, 'Asfalto', 'Moderada', '2024-06-11', '08:00');

-- Insertar puntos de inter�s asociados a ese recorrido en la tabla PointsOfInterest
INSERT INTO PointsOfInterest (RouteID, PointName, Description)
VALUES 
((SELECT RouteID FROM RouteDetails WHERE Distance = 25.0 AND RouteDate = '2024-06-11'), 'Parque Central', 'Un hermoso parque en el centro de la ciudad'),
((SELECT RouteID FROM RouteDetails WHERE Distance = 25.0 AND RouteDate = '2024-06-11'), 'Cafeter�a Ciclista', 'Lugar popular entre ciclistas para descansar y tomar un caf�'),
((SELECT RouteID FROM RouteDetails WHERE Distance = 25.0 AND RouteDate = '2024-06-11'), 'Mirador de la Monta�a', 'Un mirador con vistas impresionantes de la monta�a');

INSERT INTO Eventos (idEvento, nombre, cantidadParticipantes, fecha, horarioInicio, horaFinalizacion, modalidad, clasificacion, idRuta, idCarrera)
VALUES
(1, 'Evento A', 100, '2024-05-01', '08:00', '12:00', 'Ruta', 'Amateur', NULL, NULL),
(2, 'Evento B', 150, '2024-06-15', '09:00', '14:00', 'Monta�a', 'Expertos', NULL, NULL);



