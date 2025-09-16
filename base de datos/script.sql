-- ============================
-- TABLA: Usuario
-- ============================
CREATE TABLE Usuario (
    id_usuario SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    contraseña VARCHAR(255) NOT NULL,
    fecha_nacimiento DATE,
    foto_perfil TEXT
);

-- ============================
-- TABLA: Reseñas
-- ============================
CREATE TABLE Reseñas (
    id_reseñas SERIAL PRIMARY KEY,
    id_usuario INT REFERENCES Usuario(id_usuario) ON DELETE CASCADE,
    texto TEXT,
    puntuacion INT CHECK (puntuacion BETWEEN 1 AND 5),
    fecha DATE DEFAULT CURRENT_DATE
);

-- ============================
-- TABLA: Destino
-- ============================
CREATE TABLE Destino (
    id_destino SERIAL PRIMARY KEY,
    nombre_ciudad VARCHAR(100) NOT NULL,
    pais VARCHAR(100),
    descripcion TEXT,
    coordenada VARCHAR(255)
);

-- ============================
-- TABLA: Lugares
-- ============================
CREATE TABLE Lugares (
    id_lugares SERIAL PRIMARY KEY,
    id_destino INT REFERENCES Destino(id_destino) ON DELETE CASCADE,
    nombre VARCHAR(100) NOT NULL,
    categoria VARCHAR(50),
    descripcion TEXT,
    horario VARCHAR(100)
);

-- ============================
-- TABLA: Eventos
-- ============================
CREATE TABLE Eventos (
    id_eventos SERIAL PRIMARY KEY,
    id_destino INT REFERENCES Destino(id_destino) ON DELETE CASCADE,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    fecha_de_inicio DATE,
    fecha_fin DATE,
    tipo_de_evento VARCHAR(50)
);

-- ============================
-- TABLA: Gastronomía
-- ============================
CREATE TABLE Gastronomia (
    id_gastronomia SERIAL PRIMARY KEY,
    id_destino INT REFERENCES Destino(id_destino) ON DELETE CASCADE,
    nombre VARCHAR(100) NOT NULL,
    categoria VARCHAR(50),
    descripcion TEXT,
    horario VARCHAR(100)
);

-- ============================
-- TABLA: Recorridos
-- ============================
CREATE TABLE Recorridos (
    id_recorridos SERIAL PRIMARY KEY,
    id_destino INT REFERENCES Destino(id_destino) ON DELETE CASCADE,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    duracion_estimada VARCHAR(50)
);

-- ============================
-- TABLAS INTERMEDIAS (Reseñas)
-- ============================
CREATE TABLE Lugares_Reseñas (
    id_lugares INT REFERENCES Lugares(id_lugares) ON DELETE CASCADE,
    id_reseñas INT REFERENCES Reseñas(id_reseñas) ON DELETE CASCADE,
    PRIMARY KEY (id_lugares, id_reseñas)
);

CREATE TABLE Eventos_Reseñas (
    id_evento INT REFERENCES Eventos(id_eventos) ON DELETE CASCADE,
    id_reseñas INT REFERENCES Reseñas(id_reseñas) ON DELETE CASCADE,
    PRIMARY KEY (id_evento, id_reseñas)
);

CREATE TABLE Gastronomia_Reseñas (
    id_gastronomia INT REFERENCES Gastronomia(id_gastronomia) ON DELETE CASCADE,
    id_reseñas INT REFERENCES Reseñas(id_reseñas) ON DELETE CASCADE,
    PRIMARY KEY (id_gastronomia, id_reseñas)
);


