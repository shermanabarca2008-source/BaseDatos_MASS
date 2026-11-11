CREATE TABLE Usuario (
    cedula            VARCHAR(10)  NOT NULL,
    nombre1           VARCHAR(50)  NOT NULL,
    nombre2           VARCHAR(50),
    apellido_paterno  VARCHAR(50)  NOT NULL,
    apellido_materno  VARCHAR(50),
    direccion         VARCHAR(150),
    fecha_nacimiento  DATE,
    contrasena        VARCHAR(255) NOT NULL,

    PRIMARY KEY (cedula)
) ENGINE = InnoDB;


CREATE TABLE Telefono_Usuario (
    cedula    VARCHAR(10) NOT NULL,
    telefono  VARCHAR(15) NOT NULL,

    PRIMARY KEY (cedula, telefono),

    FOREIGN KEY (cedula)
        REFERENCES Usuario(cedula)
        ON UPDATE CASCADE
        ON DELETE CASCADE
) ENGINE = InnoDB;


CREATE TABLE Administrador (
    ID_admin  INT NOT NULL AUTO_INCREMENT,
    cedula    VARCHAR(10) NOT NULL UNIQUE,

    PRIMARY KEY (ID_admin),

    FOREIGN KEY (cedula)
        REFERENCES Usuario(cedula)
        ON UPDATE CASCADE
        ON DELETE CASCADE
) ENGINE = InnoDB;


CREATE TABLE Medico (
    ID_medico     INT          NOT NULL AUTO_INCREMENT,
    cedula        VARCHAR(10)  NOT NULL UNIQUE,
    especialidad  VARCHAR(100) NOT NULL,

    PRIMARY KEY (ID_medico),

    FOREIGN KEY (cedula)
        REFERENCES Usuario(cedula)
        ON UPDATE CASCADE
        ON DELETE CASCADE
) ENGINE = InnoDB;


CREATE TABLE Cliente (
    id_cliente  INT NOT NULL AUTO_INCREMENT,
    cedula      VARCHAR(10) NOT NULL UNIQUE,

    PRIMARY KEY (id_cliente),

    FOREIGN KEY (cedula)
        REFERENCES Usuario(cedula)
        ON UPDATE CASCADE
        ON DELETE CASCADE
) ENGINE = InnoDB;


CREATE TABLE HorarioMedico (
    id_horario  INT  NOT NULL AUTO_INCREMENT,
    fecha       DATE NOT NULL,
    hora        TIME NOT NULL,
    ID_admin    INT  NOT NULL,
    ID_medico   INT  NOT NULL,

    PRIMARY KEY (id_horario),

    UNIQUE (ID_medico, fecha, hora),

    FOREIGN KEY (ID_admin)
        REFERENCES Administrador(ID_admin)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    FOREIGN KEY (ID_medico)
        REFERENCES Medico(ID_medico)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
) ENGINE = InnoDB;


CREATE TABLE Cita (
    id_cita     INT         NOT NULL AUTO_INCREMENT,
    estado      VARCHAR(30) NOT NULL
                DEFAULT 'pendiente',
    id_cliente  INT         NOT NULL,
    id_horario  INT         NOT NULL UNIQUE,

    PRIMARY KEY (id_cita),

    CHECK (
        estado IN (
            'pendiente',
            'confirmada',
            'cancelada',
            'completada'
        )
    ),

    FOREIGN KEY (id_cliente)
        REFERENCES Cliente(id_cliente)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    FOREIGN KEY (id_horario)
        REFERENCES HorarioMedico(id_horario)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
) ENGINE = InnoDB;


CREATE TABLE Receta (
    id_receta     INT NOT NULL AUTO_INCREMENT,
    medicamentos  TEXT,
    indicaciones  TEXT,
    id_cita       INT NOT NULL UNIQUE,

    PRIMARY KEY (id_receta),

    FOREIGN KEY (id_cita)
        REFERENCES Cita(id_cita)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
) ENGINE = InnoDB;