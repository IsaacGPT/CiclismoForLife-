create database LongRaceCCC
use LongRaceCCC

CREATE TABLE Corredores (
    CorredorID INT PRIMARY KEY,  -- ID del corredor (1-5 según la selección)
    Nombre NVARCHAR(50) NOT NULL, -- Nombre del corredor
    Numero INT NOT NULL  -- Número del corredor (igual al CorredorID en este caso)
);

CREATE TABLE Registros (
    RegistroID INT IDENTITY(1,1) PRIMARY KEY, -- ID único para cada registro
    CorredorID INT, -- ID del corredor
    Puntos INT, -- Puntos de control asignados
    Tiempo INT, -- Tiempo en minutos
    PuntosCalculados DECIMAL(5,2), -- Puntos calculados en base al tiempo
    FOREIGN KEY (CorredorID) REFERENCES Corredores(CorredorID)
);

CREATE TABLE Descalificaciones (
    DescalificacionID INT IDENTITY(1,1) PRIMARY KEY, -- ID único para cada descalificación
    CorredorID INT, -- ID del corredor
    Razon NVARCHAR(255) NOT NULL, -- Razón de la descalificación
    FechaDescalificacion DATETIME DEFAULT GETDATE(), -- Fecha de la descalificación
    FOREIGN KEY (CorredorID) REFERENCES Corredores(CorredorID)
);

CREATE TABLE Descalificaciones (
    DescalificacionID INT IDENTITY(1,1) PRIMARY KEY, -- ID único para cada descalificación
    CorredorID INT, -- ID del corredor
    Razon NVARCHAR(255) NOT NULL, -- Razón de la descalificación
    FechaDescalificacion DATETIME DEFAULT GETDATE(), -- Fecha de la descalificación
    FOREIGN KEY (CorredorID) REFERENCES Corredores(CorredorID)
);

CREATE table userss(
email varchar(max)not null,
contrasena varchar(max) not null
);

CREATE TABLE Ciclistass (
    CiclistaID INT PRIMARY KEY,  -- ID único del ciclista
    Nombre NVARCHAR(100) NOT NULL,              -- Nombre del ciclista
    FechaNacimiento DATE,                       -- Fecha de nacimiento
    Ubicacion NVARCHAR(100),                    -- Ubicación
    Telefono NVARCHAR(20),                      -- Número de teléfono
    Correo NVARCHAR(100),                       -- Correo electrónico
    GrupoSanguineo NVARCHAR(5),                 -- Grupo sanguíneo
    CondicionesMedicas NVARCHAR(255),           -- Condiciones médicas
    ContactoEmergencia NVARCHAR(100)            -- Contacto de emergencia
);

CREATE TABLE Actividades (
    ActividadID INT IDENTITY(1,1) PRIMARY KEY,  -- ID único de la actividad
    CiclistaID INT,                             -- ID del ciclista
    Titulo NVARCHAR(100) NOT NULL,              -- Título de la actividad
    Distancia DECIMAL(5,2) NOT NULL,            -- Distancia recorrida en kilómetros
    Duracion TIME NOT NULL,                     -- Duración de la actividad
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
(1, 'Juan', 'Pérez', 'juan.perez@example.com'),
(2, 'María', 'Gómez', 'maria.gomez@example.com');

INSERT INTO Corredores (CorredorID, Nombre, Numero) VALUES
(1, 'Juan Pérez', 1),
(2, 'María García', 2),
(3, 'Carlos Sánchez', 3),
(4, 'Lucía Fernández', 4),
(5, 'Miguel Ramírez', 5);

INSERT INTO Corredores (CorredorID, Nombre) VALUES
(1, 'Juan Pérez' ),
(2, 'María García' ),
(3, 'Carlos Sánchez' ),
(4, 'Lucía Fernández' ),
(5, 'Miguel Ramírez'),
(6, 'Richtofen' ),
(7, 'Peterparker');

-- Insertar datos de ciclistas
INSERT INTO Ciclist (idCiclista, nombre, apellido, email)
VALUES
(6, 'Luis', 'González', 'luis.gonzalez@example.com'),
(7, 'Laura', 'Fernández', 'laura.fernandez@example.com'),
(8, 'Jorge', 'Hernández', 'jorge.hernandez@example.com'),
(9, 'Sofía', 'Ramírez', 'sofia.ramirez@example.com'),
(10, 'Miguel', 'Torres', 'miguel.torres@example.com');

INSERT INTO Ciclistass (CiclistaID, Nombre, FechaNacimiento, Ubicacion, Telefono, Correo, GrupoSanguineo, CondicionesMedicas, ContactoEmergencia)
VALUES
(6, 'Luis González', '1983-08-10', 'Toluca', '555-1620', 'luis.gonzalez@example.com', 'A+', 'Ninguna', 'Marta González'),
(7, 'Laura Fernández', '1991-03-25', 'Morelia', '555-1824', 'laura.fernandez@example.com', 'B-', 'Hipotiroidismo', 'Jose Fernández'),
(8, 'Jorge Hernández', '1986-12-19', 'Tijuana', '555-2046', 'jorge.hernandez@example.com', 'AB+', 'Migrañas', 'Ana Hernández'),
(9, 'Sofía Ramírez', '1993-07-04', 'Cancún', '555-2225', 'sofia.ramirez@example.com', 'O-', 'Artritis', 'Carlos Ramírez'),
(10, 'Miguel Torres', '1989-01-11', 'Veracruz', '555-2418', 'miguel.torres@example.com', 'O+', 'Alergia a mariscos', 'Lucía Torres');

-- Insertar datos de actividades
INSERT INTO Actividades (CiclistaID, Titulo, Distancia, Duracion, VelocidadPromedio) VALUES
(1, 'Ruta en la Montaña', 20.0, '00:30:00', 25.0),
(1, 'Paseo por la Ciudad', 10.0, '00:15:00', 22.0);

-- Insertar un recorrido en la tabla RouteDetails
INSERT INTO RouteDetails (Distance, Duration, Elevation, TerrainType, Difficulty, RouteDate, StartTime)
VALUES (25.0, 90, 300, 'Asfalto', 'Moderada', '2024-06-11', '08:00');

-- Insertar puntos de interés asociados a ese recorrido en la tabla PointsOfInterest
INSERT INTO PointsOfInterest (RouteID, PointName, Description)
VALUES 
((SELECT RouteID FROM RouteDetails WHERE Distance = 25.0 AND RouteDate = '2024-06-11'), 'Parque Central', 'Un hermoso parque en el centro de la ciudad'),
((SELECT RouteID FROM RouteDetails WHERE Distance = 25.0 AND RouteDate = '2024-06-11'), 'Cafetería Ciclista', 'Lugar popular entre ciclistas para descansar y tomar un café'),
((SELECT RouteID FROM RouteDetails WHERE Distance = 25.0 AND RouteDate = '2024-06-11'), 'Mirador de la Montaña', 'Un mirador con vistas impresionantes de la montaña');

INSERT INTO Eventos (idEvento, nombre, cantidadParticipantes, fecha, horarioInicio, horaFinalizacion, modalidad, clasificacion, idRuta, idCarrera)
VALUES
(1, 'Evento A', 100, '2024-05-01', '08:00', '12:00', 'Ruta', 'Amateur', NULL, NULL),
(2, 'Evento B', 150, '2024-06-15', '09:00', '14:00', 'Montaña', 'Expertos', NULL, NULL);



