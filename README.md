# M.A.S.S. — Medical Appointment Scheduling System

**Diseño e implementación de una base de datos relacional para la gestión y agendamiento de citas médicas en línea**

> Informe de fin de unidad — Carrera de Computación, FEIRNNR, Universidad Nacional de Loja.

## Datos generales

| Campo | Información |
|---|---|
| Asignatura | Base de datos |
| Ciclo | 3A |
| Unidad | 1 |
| Resultado de aprendizaje | Modela bases de datos de problemas reales, bajo los principios de solidaridad, transparencia, responsabilidad y honestidad. |
| Docente | Edwin René Guamán Quinche |
| Fecha | 11-11-2026 |
| Estudiante | Sherman Leodan Abarca Hidalgo |
| Repositorio | [BaseDatos_MASS](https://github.com/shermanabarca2008-source/BaseDatos_MASS.git) |

## 1. Título

**M.A.S.S. (Medical Appointment Scheduling System): Diseño e implementación de una base de datos relacional para la gestión y agendamiento de citas médicas en línea.**

## 2. Contexto del problema

En las zonas rurales, el acceso a los servicios de salud puede representar una dificultad para las personas que necesitan atención médica, debido a la distancia que existe entre sus hogares y los centros de salud. En muchos casos, los pacientes deben trasladarse personalmente hasta un hospital para solicitar una cita médica y, posteriormente, realizar un segundo viaje en la fecha asignada. Esta situación genera gastos adicionales de transporte, pérdida de tiempo y dificultades para quienes cuentan con recursos económicos limitados.

Además, la falta de un sistema adecuado para gestionar la información de las citas médicas puede ocasionar problemas en la organización de los horarios de atención, como la asignación de varias citas en una misma fecha y hora, confusiones en los registros y dificultades para consultar la disponibilidad de los médicos. Estos inconvenientes afectan tanto a los pacientes como al personal encargado de administrar las citas, especialmente en centros de salud que cuentan con recursos tecnológicos limitados.

Ante esta problemática, surge la necesidad de implementar una base de datos relacional que permita almacenar y gestionar de manera organizada la información de los pacientes, médicos, horarios, citas y recetas médicas. Mediante el uso de MySQL, se busca mantener la integridad y seguridad de los datos personales, evitar la duplicación de horarios y facilitar el acceso a la información necesaria para el funcionamiento de un sistema de agendamiento de citas médicas en línea.

De esta manera, el proyecto pretende contribuir a una mejor organización de los servicios de atención médica y reducir la necesidad de que los pacientes, especialmente aquellos que viven en zonas rurales, deban desplazarse únicamente para registrar una cita.

## 3. Objetivos

### 3.1. Objetivo general

Diseñar e implementar una base de datos relacional mediante el uso de MySQL para gestionar de manera organizada y segura la información de los pacientes, médicos, horarios y citas médicas, con la finalidad de evitar conflictos en la asignación de horarios y facilitar el agendamiento de citas en línea, especialmente para personas de zonas rurales que deben trasladarse a centros de salud.

### 3.2. Objetivos específicos

1. Diseñar el modelo entidad-relación y su correspondiente modelo relacional, identificando las entidades, atributos, claves primarias, claves foráneas y relaciones necesarias para organizar correctamente la información de los usuarios, médicos, horarios, citas y recetas médicas.
2. Implementar la base de datos en MySQL mediante la creación de tablas, restricciones de integridad y consultas SQL que permitan registrar, consultar y administrar la información de las citas médicas, evitando la duplicación de horarios y garantizando la consistencia de los datos almacenados.

## 4. Modelos conceptuales de bases de datos

### 4.1. Modelo Entidad-Relación (E-R)

![Figura 1. Diagrama Entidad-Relación del sistema M.A.S.S.](imagenes/pagina_03.png)

*Figura 1. Diagrama Entidad-Relación del sistema M.A.S.S.*

### 4.2. Modelo relacional

![Figura 2. Diagrama relacional](imagenes/pagina_04.png)

*Figura 2. Diagrama relacional.*

![Figura 3. Diagrama relacional en cuadros](imagenes/pagina_05.png)

*Figura 3. Diagrama relacional (cuadros). La página también contiene el comienzo del código DDL.*

## 5. Código SQL

### 5.1. Creación de tablas (DDL)

El informe presenta las siguientes sentencias de creación de tablas:

**Tabla `Telefono_Usuario`:**

```sql
CREATE TABLE Telefono_Usuario (
    cedula VARCHAR(10) NOT NULL,
    telefono VARCHAR(15) NOT NULL,
    PRIMARY KEY (cedula, telefono),
    FOREIGN KEY (cedula) REFERENCES Usuario(cedula)
);
```

**Tabla `Cita`:**

```sql
CREATE TABLE Cita (
    id_cita INT NOT NULL AUTO_INCREMENT,
    estado VARCHAR(30) NOT NULL DEFAULT 'pendiente',
    id_cliente INT NOT NULL,
    id_horario INT NOT NULL UNIQUE,
    PRIMARY KEY (id_cita),
    CHECK (estado IN ('pendiente', 'confirmada', 'cancelada', 'completada')),
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente),
    FOREIGN KEY (id_horario) REFERENCES HorarioMedico(id_horario)
);
```

**Tabla `Receta`:**

```sql
CREATE TABLE Receta (
    id_receta INT NOT NULL AUTO_INCREMENT,
    medicamentos TEXT,
    indicaciones TEXT,
    id_cita INT NOT NULL UNIQUE,
    PRIMARY KEY (id_receta),
    FOREIGN KEY (id_cita) REFERENCES Cita(id_cita)
);
```

**Tabla `HorarioMedico`:**

```sql
CREATE TABLE HorarioMedico (
    id_horario INT NOT NULL AUTO_INCREMENT,
    fecha DATE NOT NULL,
    hora TIME NOT NULL,
    ID_admin INT NOT NULL,
    ID_medico INT NOT NULL,
    PRIMARY KEY (id_horario),
    UNIQUE (ID_medico, fecha, hora),
    FOREIGN KEY (ID_admin) REFERENCES Administrador(ID_admin),
    FOREIGN KEY (ID_medico) REFERENCES Medico(ID_medico)
);
```

> **Nota:** el PDF muestra estas cuatro sentencias DDL, aunque el modelo general incluye ocho tablas. Las sentencias `CREATE TABLE` de las demás tablas no aparecen en esta sección del documento original.

### 5.2. Inserción de datos (DML)

**Tabla `Usuario`:**

```sql
INSERT INTO Usuario
(cedula, nombre1, nombre2, apellido_paterno, apellido_materno,
 direccion, fecha_nacimiento, contrasena)
VALUES
('1100000001', 'Carlos', 'Andres', 'Mendoza', 'Lopez', 'Loja', '1985-03-12', 'hash_demo_01'),
('1100000002', 'Maria', 'Fernanda', 'Torres', 'Jimenez', 'Catamayo', '1990-07-25', 'hash_demo_02'),
('1100000003', 'Juan', 'Pablo', 'Ramirez', 'Vega', 'Vilcabamba', '1978-11-08', 'hash_demo_03'),
('1100000004', 'Ana', 'Lucia', 'Castillo', 'Mora', 'Loja', '1995-02-14', 'hash_demo_04'),
('1100000005', 'Pedro', 'Luis', 'Gonzalez', 'Rojas', 'Saraguro', '1982-09-30', 'hash_demo_05'),
('1100000006', 'Sofia', 'Isabel', 'Herrera', 'Diaz', 'Malacatos', '2001-05-19', 'hash_demo_06'),
('1100000007', 'Luis', 'Alberto', 'Cueva', 'Paredes', 'Loja', '1998-12-03', 'hash_demo_07'),
('1100000008', 'Daniela', 'Paola', 'Ortega', 'Ruiz', 'Catamayo', '2000-06-21', 'hash_demo_08');
```

**Tabla `Administrador`:**

```sql
INSERT INTO Administrador (ID_admin, cedula)
VALUES
(1, '1100000001'), (2, '1100000002'),
(3, '1100000003'), (4, '1100000004'),
(5, '1100000005'), (6, '1100000006'),
(7, '1100000007'), (8, '1100000008');
```

**Tabla `Medico`:**

```sql
INSERT INTO Medico (ID_medico, cedula, especialidad)
VALUES
(1, '1100000001', 'Medicina General'),
(2, '1100000002', 'Pediatria'),
(3, '1100000003', 'Cardiologia'),
(4, '1100000004', 'Dermatologia'),
(5, '1100000005', 'Traumatologia'),
(6, '1100000006', 'Neurologia'),
(7, '1100000007', 'Ginecologia'),
(8, '1100000008', 'Oftalmologia');
```

**Tabla `Cliente`:**

```sql
INSERT INTO Cliente (id_cliente, cedula)
VALUES
(1, '1100000001'), (2, '1100000002'),
(3, '1100000003'), (4, '1100000004'),
(5, '1100000005'), (6, '1100000006'),
(7, '1100000007'), (8, '1100000008');
```

> **Nota:** esta sección del PDF contiene inserciones para cuatro tablas. No se añadieron inserciones ausentes del documento.

## 6. Consultas de álgebra relacional y su traducción a SQL

### Consulta 1 — Selección

**Objetivo:** Obtener los nombres de los pacientes que tienen citas médicas confirmadas, incluyendo la fecha y hora de atención. Esta consulta permite identificar qué pacientes tienen una cita programada y confirmada.

**Álgebra relacional:**

```text
π nombre1,apellido_paterno,fecha,hora (σ estado=="confirmada"(usuario⋈cliente⋈cita⋈horariomedico))
```

![Figura 4. Resultado en Relational de la selección](imagenes/pagina_09.png)

*Figura 4. Resultado Relational sobre el método de selección (página original con la consulta y su captura).*

**SQL:**

```sql
SELECT u.nombre1, u.apellido_paterno, h.fecha, h.hora
FROM Usuario u
INNER JOIN Cliente cl ON u.cedula = cl.cedula
INNER JOIN Cita c ON cl.id_cliente = c.id_cliente
INNER JOIN HorarioMedico h ON c.id_horario = h.id_horario
WHERE c.estado = 'confirmada';
```

*Figura 5. El resultado de MariaDB se encuentra en la captura de la página 9, incluida arriba.*

### Consulta 2 — Proyección

**Objetivo:** Consultar los nombres de los médicos, sus especialidades y los horarios que tienen asignados. Esto permite visualizar la distribución de los horarios de atención entre los diferentes profesionales.

**Álgebra relacional:**

```text
π nombre1,apellido_paterno,especialidad,fecha,hora(usuario⋈medico⋈horariomedico)
```

![Figuras 6 y 7. Resultados de proyección en Relational y MariaDB](imagenes/pagina_10.png)

**SQL:**

```sql
SELECT u.nombre1, u.apellido_paterno, m.especialidad, h.fecha, h.hora
FROM Usuario u
INNER JOIN Medico m ON u.cedula = m.cedula
INNER JOIN HorarioMedico h ON m.ID_medico = h.ID_medico
ORDER BY h.fecha, h.hora;
```

### Consulta 3 — Intersección y proyección

**Objetivo:** Identificar a las personas que desempeñan simultáneamente los roles de administrador y médico. Esta consulta permite comprobar el funcionamiento de la especialización solapada de Usuario.

**Álgebra relacional:**

```text
π nombre1,apellido_paterno(usuario⋈(π cedula(administrador)∩π cedula(medico)))
```

![Figura 8. Resultado Relational de la intersección](imagenes/pagina_11.png)

**SQL:**

```sql
SELECT u.nombre1, u.apellido_paterno
FROM Usuario u
INNER JOIN (
    SELECT cedula FROM Administrador
    INTERSECT
    SELECT cedula FROM Medico
) AS roles ON u.cedula = roles.cedula;
```

![Figura 9. Resultado MariaDB de la intersección](imagenes/pagina_12.png)

### Consulta 4 — Reunión natural y diferencia

**Objetivo:** Identificar los horarios médicos que todavía no tienen ninguna cita registrada. Esto permite conocer qué horarios se encuentran disponibles para agendar una consulta.

**Álgebra relacional:**

```text
π id_horario,fecha,hora(horariomedico⋈(π id_horario(horariomedico)-π id_horario(cita)))
```

*Figura 10. El resultado en Relational aparece en la página 12, incluida arriba.*

**SQL:**

```sql
SELECT h.id_horario, h.fecha, h.hora, m.especialidad
FROM HorarioMedico h
INNER JOIN Medico m ON h.ID_medico = m.ID_medico
WHERE h.id_horario NOT IN (
    SELECT c.id_horario FROM Cita c
);
```

![Figura 11. Resultado MariaDB de la diferencia](imagenes/pagina_13.png)

### Consulta 5 — Agrupamiento y función de agregación

**Objetivo:** Determinar cuántas citas médicas tiene cada especialidad para identificar la demanda de atención.

**Álgebra relacional extendida:**

```text
γ especialidad; count(id_cita)->total_citas(medico ⨝ horariomedico ⨝ cita)
```

**SQL:**

```sql
SELECT m.especialidad, COUNT(c.id_cita) AS total_citas
FROM Medico m
INNER JOIN HorarioMedico h ON m.ID_medico = h.ID_medico
INNER JOIN Cita c ON h.id_horario = c.id_horario
GROUP BY m.especialidad;
```

**Resultado esperado:** Se obtendrá un resumen de la cantidad total de citas médicas registradas por cada especialidad. Los registros se agruparán según la especialidad del médico y, mediante la función `COUNT`, se calculará el número de citas correspondientes a cada una. Con los datos actuales, se espera obtener ocho especialidades con una cita cada una. Esta consulta permitirá identificar cuáles especialidades tienen mayor demanda de atención médica a medida que se registren nuevas citas.

![Figura 12. Resultado MariaDB del agrupamiento y agregación](imagenes/pagina_14.png)

## 7. Conclusiones

**Conclusión 1.** La elaboración del diagrama Entidad-Relación y su transformación al modelo relacional permitió comprender la importancia de organizar correctamente la información antes de implementar una base de datos. Durante este proceso, se identificaron las entidades principales del sistema de agendamiento de citas médicas, como Usuario, Administrador, Médico, Cliente, Horario Médico, Cita y Receta, junto con sus atributos y relaciones. Una de las principales dificultades fue establecer correctamente las cardinalidades y representar los diferentes roles que puede tener un usuario, así como evitar la duplicación de información. Esta actividad permitió fortalecer los conocimientos sobre claves primarias, claves foráneas y relaciones entre entidades, logrando una estructura más organizada y acorde con las necesidades del sistema.

**Conclusión 2.** La implementación de la base de datos en MariaDB permitió llevar el modelo relacional a una estructura funcional mediante el uso de instrucciones SQL. A través del lenguaje DDL, se crearon las ocho tablas del sistema, definiendo sus atributos, tipos de datos y restricciones para mantener la integridad de la información. Por otro lado, el lenguaje DML permitió insertar registros de prueba y comprobar las relaciones existentes entre las tablas. Entre los aspectos más importantes se encontraron el uso de `CREATE TABLE`, `INSERT INTO`, `PRIMARY KEY`, `FOREIGN KEY` y `UNIQUE`, ya que ayudaron a comprender cómo se almacenan y relacionan los datos. Además, este proceso permitió reconocer la importancia del orden de creación de las tablas y de la consistencia de los registros para evitar errores al trabajar con claves foráneas.

**Conclusión 3.** El desarrollo de las consultas mediante álgebra relacional permitió comprender de mejor manera cómo se obtiene y relaciona la información almacenada en una base de datos. El uso de operadores como selección, proyección, reunión natural, intersección y diferencia facilitó la construcción de consultas SQL, al permitir identificar primero los datos necesarios y las condiciones que debían cumplirse. Entre las consultas más útiles estuvieron las relacionadas con la identificación de pacientes con citas confirmadas, la visualización de horarios médicos disponibles y el conteo de citas por especialidad, ya que proporcionan información importante para la organización de la atención médica. Asimismo, el trabajo con diferentes herramientas permitió reconocer que algunas operaciones, como el agrupamiento y las funciones de agregación, requieren álgebra relacional extendida. En general, esta actividad ayudó a relacionar los conceptos teóricos con su aplicación práctica en SQL y a comprender cómo las consultas contribuyen a obtener información útil para el funcionamiento del sistema.

## 8. Declaración de uso de IA

Para el desarrollo de esta actividad se tomó ayuda de la IA ChatGPT, a la que se pidió que actuara como tutor para aclarar los aspectos que no se entendían, además de solicitar datos para los ejemplos de cada tabla.

## 9. Bibliografía

[1] R. Elmasri y S. B. Navathe, *Fundamentals of Database Systems*, 7.ª ed. Pearson, 2016. [En línea]. Disponible: https://books.google.com/books?id=Yb_uoQEACAAJ

[2] MariaDB Foundation, “CREATE TABLE,” *MariaDB Server Documentation*. [En línea]. Disponible: https://mariadb.com/docs/server/server-usage/tables/create-table. [Accedido: 11-nov-2026].

[3] MariaDB Foundation, “INSERT SELECT,” *MariaDB Server Documentation*. [En línea]. Disponible: https://mariadb.com/docs/server/reference/sql-statements/data-manipulation/inserting-loading-data/insert-select. [Accedido: 11-nov-2026].

[4] MariaDB Foundation, “MariaDB Standard Developer Cheat Sheet,” *MariaDB Documentation*. [En línea]. Disponible: https://mariadb.com/wp-content/uploads/2021/08/mariadb-standard-developer_cheat-sheet_1113.pdf. [Accedido: 11-nov-2026].

[5] J. Kessler, “RelaX: Relational Algebra Calculator,” Universidad de Innsbruck. [En línea]. Disponible: https://relax.mad.uom.gr/. [Accedido: 11-nov-2026].

[6] “RelaX: Relational Algebra Calculator — Help,” *RelaX Documentation*. [En línea]. Disponible: https://relax.labs.schubotz.org/relax/help. [Accedido: 11-nov-2026].

---