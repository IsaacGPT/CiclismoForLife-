-- Crear la base de datos CiclismoForLifebeta
CREATE DATABASE CiclismoForLifebeta222;
GO

-- Usar la base de datos recién creada
USE CiclismoForLifebeta222;
GO

-- Tabla Corredor
CREATE TABLE corredor (
    idcorredor INT PRIMARY KEY, -- Identificador único del corredor
    Nombre_C NVARCHAR(MAX) NOT NULL, -- Nombre del corredor
    Apellido_C NVARCHAR(MAX) NOT NULL, -- Apellido del corredor
    fecha_nacimiento DATETIME NOT NULL, -- Fecha de nacimiento del corredor
    Telefono INT NOT NULL, -- Número de teléfono del corredor
    Curp NVARCHAR(MAX) NOT NULL, -- CURP (Clave Única de Registro de Población) del corredor
    Telefono_Identificacion INT NOT NULL, -- Número de identificación del corredor
    Num_corredor INT IDENTITY NOT NULL, -- Número de corredor (generado automáticamente)
    idequipo INT, -- Identificador del equipo al que pertenece el corredor
    CONSTRAINT FK_corredor_equipo FOREIGN KEY (idequipo) REFERENCES equipos(idequipo) -- Clave foránea que referencia la tabla equipos
);
GO

-- Tabla Equipos
CREATE TABLE equipos (
    idequipo INT PRIMARY KEY, -- Identificador único del equipo
    NombreEq NVARCHAR(MAX) NOT NULL, -- Nombre del equipo
    Cant_Integrantes INT NOT NULL, -- Cantidad de integrantes del equipo
    Modalidad_E BIT -- Modalidad del equipo
);
GO

-- Tabla Juez
CREATE TABLE juez (
    idjuez INT PRIMARY KEY, -- Identificador único del juez
    NombreJ NVARCHAR(MAX) NOT NULL, -- Nombre del juez
    Apellidos NVARCHAR(MAX) NOT NULL, -- Apellidos del juez
    CURP   NVARCHAR(MAX) NOT NULL, -- CURP del juez
    Correo_electronico NVARCHAR(MAX) NOT NULL, -- Correo electrónico del juez
    Especialidad NVARCHAR(MAX) NOT NULL -- Especialidad del juez
);
GO

-- Tabla Eventos
CREATE TABLE eventos (
    idevento INT PRIMARY KEY, -- Identificador único del evento
    NombreE NVARCHAR(MAX) NOT NULL, -- Nombre del evento
    Cantidad_P INT NOT NULL, -- Cantidad de participantes del evento
    Fechas DATE NOT NULL, -- Fechas del evento
    HorarioInicio TIME NOT NULL, -- Hora de inicio del evento
    HoraFinalización TIME NOT NULL, -- Hora de finalización del evento
    Modalidad NVARCHAR(MAX) NOT NULL, -- Modalidad del evento
    Clasificacion NVARCHAR(MAX) NOT NULL, -- Clasificación del evento
    idruta INT, -- Identificador de la ruta asociada al evento
    idcarrera INT, -- Identificador de la carrera asociada al evento
    CONSTRAINT FK_eventos_ruta FOREIGN KEY (idruta) REFERENCES ruta(idruta), -- Clave foránea que referencia la tabla ruta
    CONSTRAINT FK_eventos_carrera FOREIGN KEY (idcarrera) REFERENCES carrera(idcarrera) -- Clave foránea que referencia la tabla carrera
);
GO

-- Tabla Ruta
CREATE TABLE ruta(
    idruta INT PRIMARY KEY, -- Identificador único de la ruta
    Nombre_ruta NVARCHAR(MAX) NOT NULL, -- Nombre de la ruta
    Ubicacion NVARCHAR(MAX) NOT NULL, -- Ubicación de la ruta
    Distancia NVARCHAR(MAX) NOT NULL, -- Distancia de la ruta
    idcarrera INT, -- Identificador de la carrera asociada a la ruta
    CONSTRAINT FK_ruta_carrera FOREIGN KEY (idcarrera) REFERENCES carrera(idcarrera) -- Clave foránea que referencia la tabla carrera
);
GO

-- Tabla Carrera
CREATE TABLE carrera(
    idcarrera INT PRIMARY KEY, -- Identificador único de la carrera
    horarioC TIME NOT NULL, -- Horario de la carrera
    Cantidad_participantes INT NOT NULL, -- Cantidad de participantes en la carrera
    PuntosC INT NOT NULL -- Puntos de la carrera
);
GO

-- Tabla Resultados
CREATE TABLE resultados (
    idresultados INT PRIMARY KEY, -- Identificador único del resultado
    nombreC NVARCHAR(MAX) NOT NULL, -- Nombre del corredor
    Cant_Puntos INT NOT NULL, -- Cantidad de puntos obtenidos
    idcorredor INT, -- Identificador del corredor asociado al resultado
    idevento INT, -- Identificador del evento asociado al resultado
    CONSTRAINT FK_resultados_corredor FOREIGN KEY (idcorredor) REFERENCES corredor(idcorredor), -- Clave foránea que referencia la tabla corredor
    CONSTRAINT FK_resultados_evento FOREIGN KEY (idevento) REFERENCES eventos(idevento) -- Clave foránea que referencia la tabla eventos
);
GO

-- Tabla Comentarios
CREATE TABLE Comentarios (
    idcomentario INT PRIMARY KEY, -- Identificador único del comentario
    TituloC NVARCHAR(MAX) NOT NULL, -- Título del comentario
    Contenido NVARCHAR(MAX) NOT NULL, -- Contenido del comentario
    Usuario NVARCHAR(MAX) NOT NULL, -- Usuario que realiza el comentario
    idcorredor INT, -- Identificador del corredor asociado al comentario
    idevento INT, -- Identificador del evento asociado al comentario
    CONSTRAINT FK_comentarios_corredor FOREIGN KEY (idcorredor) REFERENCES corredor(idcorredor), -- Clave foránea que referencia la tabla corredor
    CONSTRAINT FK_comentarios_evento FOREIGN KEY (idevento) REFERENCES eventos(idevento) -- Clave foránea que referencia la tabla eventos
);
GO

-- Tabla Descalificados
CREATE TABLE descalificados (
    iddescalificado INT PRIMARY KEY, -- Identificador único del descalificado
    NombreDescalificado NVARCHAR(MAX) NOT NULL, -- Nombre del corredor descalificado
    NumCorredor INT NOT NULL, -- Número de corredor del corredor descalificado
    MotivoDescalificacion NVARCHAR(MAX) NOT NULL -- Motivo de la descalificación
);
GO

-- Tabla de unión Juez - Eventos (Many-to-Many)
CREATE TABLE asignaciones_jueces_eventos (
    id INT PRIMARY KEY IDENTITY, -- Identificador único de la asignación
    idjuez INT, -- Identificador del juez asociado a la asignación
    idevento INT, -- Identificador del evento asociado a la asignación
    UNIQUE(idjuez, idevento), -- Asegura que cada asignación sea única
    FOREIGN KEY (idjuez) REFERENCES juez(idjuez), -- Clave foránea que referencia la tabla juez
    FOREIGN KEY (idevento) REFERENCES eventos(idevento) -- Clave foránea que referencia la tabla eventos
);
GO
