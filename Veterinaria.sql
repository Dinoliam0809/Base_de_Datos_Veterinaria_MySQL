create database Clinica_Veterinaria;
use Clinica_Veterinaria;

create table Propietarios(
ID_Propietario int auto_increment primary key,
Nombre varchar(100) not null,
Cedula varchar(15) unique not null,
Telefono varchar(15) unique not null,
Correo varchar (100) unique not null,
Direccion varchar(200) not null 
);

create table Mascotas(
ID_Mascota int auto_increment primary key,
Nombre varchar(100) not null,
Edad int,
Sexo enum('Macho','Hembra','Desconocido') not null,
Tipo_Animal enum('Mamífero','Reptil','Ave','Pez','Anfibio','Arácnido','Insecto','Otro') not null,
Especie varchar(100) not null,
ID_Propietario int,
foreign key (ID_Propietario) references Propietarios(ID_Propietario)
);

create table Veterinarios(
ID_Vet int auto_increment primary key,
Nombre varchar(100) not null,
Telefono varchar(15) unique not null,
Especialidad varchar(100) not null,
Turno enum('Mañana','Tarde','Noche','Mixto') not null
);

create table Consultas(
ID_Consulta int auto_increment primary key,
Fecha_Hora datetime not null,
Motivo enum(
  'Vacunación',
  'Revisión General',
  'Tratamiento',
  'Consulta Periódica',
  'Emergencia',
  'Cirugía',
  'Desparasitación',
  'Control Post-Operatorio'
) not null,
Diagnostico text not null,
ID_Mascota int,
ID_Vet int,
foreign key (ID_Mascota) references Mascotas(ID_Mascota),
foreign key (ID_Vet) references Veterinarios(ID_Vet)
);

create table Vacunas(
ID_Vacuna int auto_increment primary key,
Nombre varchar(100) not null,
Descripcion text,
Dosis varchar(50) not null
);

create table Tratamientos(
ID_Tratamiento int auto_increment primary key,
Nombre varchar(100) not null,
Descripcion text not null
);

create table Vacunas_Mascotas(
ID_Vac_Masc int auto_increment primary key,
ID_Mascota int,
ID_Vacuna int,
Fecha_Aplicacion date not null,
foreign key (ID_Mascota) references Mascotas(ID_Mascota),
foreign key (ID_Vacuna) references Vacunas(ID_Vacuna)
);

create table Tratamientos_Consultas(
ID_Trat_Cons int auto_increment primary key,
ID_Tratamiento int,
ID_Consulta int,
Dosis varchar(50),
Frecuencia varchar(50) not null,
Duracion varchar(50) not null,
Observaciones text,
foreign key (ID_Tratamiento) references Tratamientos(ID_Tratamiento),
foreign key (ID_Consulta) references Consultas(ID_Consulta)
);


INSERT INTO Propietarios (Nombre, Cedula, Telefono, Correo, Direccion) VALUES
('Juan Pérez', '00112345678', '8095551111', 'juanperez@mail.com', 'Calle Duarte #10'),
('María Gómez', '00298765432', '8295552222', 'mariagomez@mail.com', 'Av. Independencia #45'),
('Carlos Rodríguez', '00345678901', '8495553333', 'carlosr@mail.com', 'Calle Sánchez #23'),
('Ana Torres', '00465432109', '8095554444', 'anatorres@mail.com', 'Calle Las Flores #12'),
('Pedro Martínez', '00511122334', '8295555555', 'pedrom@mail.com', 'Av. Libertad #78'),
('Laura Castillo', '00698712345', '8495556666', 'laurac@mail.com', 'Calle 30 de Marzo #50'),
('José Ramírez', '00765432198', '8095557777', 'jramirez@mail.com', 'Calle Mella #89'),
('Sofía Fernández', '00832145678', '8295558888', 'sofiaf@mail.com', 'Calle Colón #60'),
('Miguel Santos', '00914785236', '8495559999', 'miguels@mail.com', 'Av. Kennedy #100'),
('Carolina López', '01075395146', '8095551010', 'carolinal@mail.com', 'Av. Bolívar #25');


INSERT INTO Mascotas (Nombre, Edad, Sexo, Tipo_Animal, Especie, ID_Propietario) VALUES
('Bobby', 3, 'Macho', 'Mamífero', 'Perro', 1),
('Luna', 2, 'Hembra', 'Mamífero', 'Gato', 2),
('Rocky', 5, 'Macho', 'Ave', 'Loro', 3),
('Nala', 1, 'Hembra', 'Mamífero', 'Conejo', 4),
('Max', 4, 'Macho', 'Reptil', 'Iguana', 5),
('Coco', 2, 'Macho', 'Ave', 'Canario', 6),
('Bella', 3, 'Hembra', 'Pez', 'Goldfish', 7),
('Thor', 6, 'Macho', 'Mamífero', 'Perro', 8),
('Maya', 2, 'Hembra', 'Mamífero', 'Gata', 9),
('Zeus', 4, 'Macho', 'Anfibio', 'Rana', 10);


INSERT INTO Veterinarios (Nombre, Telefono, Especialidad, Turno) VALUES
('Dr. Juan Ramírez', '8091111111', 'Cirugía', 'Mañana'),
('Dra. Ana María', '8092222222', 'Dermatología', 'Tarde'),
('Dr. Pedro López', '8093333333', 'Medicina General', 'Noche'),
('Dra. Carmen Reyes', '8094444444', 'Odontología', 'Mixto'),
('Dr. Luis Rodríguez', '8095555555', 'Traumatología', 'Mañana'),
('Dra. Laura Morales', '8096666666', 'Reproducción', 'Tarde'),
('Dr. Miguel Fernández', '8097777777', 'Exóticos', 'Noche'),
('Dra. Sofía Castillo', '8098888888', 'Cardiología', 'Mixto'),
('Dr. Carlos García', '8099999999', 'Oncología', 'Mañana'),
('Dra. Julia Méndez', '8091010101', 'Neurología', 'Tarde');


INSERT INTO Consultas (Fecha_Hora, Motivo, Diagnostico, ID_Mascota, ID_Vet) VALUES
('2025-08-01 09:00:00', 'Vacunación', 'Aplicación de vacuna antirrábica', 1, 1),
('2025-08-02 10:30:00', 'Revisión General', 'Chequeo rutinario', 2, 2),
('2025-08-03 14:00:00', 'Tratamiento', 'Dermatitis leve tratada con pomada', 3, 3),
('2025-08-04 16:00:00', 'Consulta Periódica', 'Control de peso', 4, 4),
('2025-08-05 11:00:00', 'Emergencia', 'Fractura en pata delantera', 5, 5),
('2025-08-06 15:00:00', 'Cirugía', 'Extracción de tumor benigno', 6, 6),
('2025-08-07 12:00:00', 'Desparasitación', 'Aplicación de antiparasitario', 7, 7),
('2025-08-08 09:30:00', 'Control Post-Operatorio', 'Revisión de suturas', 8, 8),
('2025-08-09 13:00:00', 'Vacunación', 'Vacuna contra moquillo', 9, 9),
('2025-08-10 17:00:00', 'Emergencia', 'Intoxicación alimentaria', 10, 10);


INSERT INTO Vacunas (Nombre, Descripcion, Dosis) VALUES
('Rabia', 'Vacuna antirrábica anual', '1 dosis'),
('Moquillo', 'Prevención de moquillo en perros', '1 dosis'),
('Parvovirus', 'Prevención del parvovirus canino', '1 dosis'),
('Triple Felina', 'Protege contra rinotraqueitis, calicivirus y panleucopenia', '1 dosis'),
('Leptospirosis', 'Prevención de leptospirosis', '1 dosis'),
('Tos de las Perreras', 'Prevención de traqueobronquitis infecciosa', '1 dosis'),
('Hepatitis Canina', 'Prevención de adenovirus', '1 dosis'),
('Polivalente', 'Cobertura múltiple en perros', '1 dosis'),
('Influenza Canina', 'Prevención de influenza en perros', '1 dosis'),
('Viruela Aviar', 'Prevención en aves', '1 dosis');


INSERT INTO Tratamientos (Nombre, Descripcion) VALUES
('Antibióticos', 'Tratamiento con antibióticos orales'),
('Analgésicos', 'Reducción del dolor'),
('Antiparasitarios', 'Eliminación de parásitos internos y externos'),
('Cicatrizante', 'Uso tópico en heridas menores'),
('Antiinflamatorios', 'Disminución de inflamación'),
('Suero', 'Hidratación intravenosa'),
('Desparasitante', 'Control de gusanos intestinales'),
('Vitaminas', 'Suplementación nutricional'),
('Antifúngicos', 'Tratamiento de infecciones por hongos'),
('Corticoides', 'Tratamiento de alergias severas');


INSERT INTO Vacunas_Mascotas (ID_Mascota, ID_Vacuna, Fecha_Aplicacion) VALUES
(1, 1, '2025-01-10'),
(2, 4, '2025-02-15'),
(3, 10, '2025-03-20'),
(4, 5, '2025-04-05'),
(5, 2, '2025-04-18'),
(6, 7, '2025-05-02'),
(7, 9, '2025-05-20'),
(8, 3, '2025-06-12'),
(9, 6, '2025-07-01'),
(10, 8, '2025-07-25');


INSERT INTO Tratamientos_Consultas (ID_Tratamiento, ID_Consulta, Dosis, Frecuencia, Duracion, Observaciones) VALUES
(1,1,'500mg','Cada 12h','7 días','Sin efectos secundarios'),
(2,2,'50mg','Cada 8h','5 días','Monitorizar dolor'),
(3,3,'10ml','Única dosis','1 día','Aplicación oral'),
(4,4,'Aplicación local','Cada 24h','3 días','Revisar cicatrización'),
(5,5,'100mg','Cada 12h','10 días','Controlar inflamación'),
(6,6,'250ml','Cada 8h','2 días','Hidratación continua'),
(7,7,'5ml','Cada 24h','1 mes','Repetir en 30 días'),
(8,8,'2 comprimidos','Cada 24h','15 días','Mejora visible'),
(9,9,'20mg','Cada 12h','7 días','Evitar humedad'),
(10,10,'30mg','Cada 8h','5 días','Controlar alergia');

-- Consultas 
-- Se muestra la mascota, su edad, el propietario y el telefono del mismo 
SELECT m.Nombre AS Mascota, m.Edad, p.Nombre AS Propietario, p.Telefono
FROM Mascotas m
JOIN Propietarios p ON m.ID_Propietario = p.ID_Propietario;

-- Se muestra todas las consultas médicas realizadas 
SELECT c.ID_Consulta, c.Fecha_Hora, c.Motivo, c.Diagnostico, m.Nombre AS Mascota, v.Nombre AS Veterinario
FROM Consultas c
JOIN Mascotas m ON c.ID_Mascota = m.ID_Mascota
JOIN Veterinarios v ON c.ID_Vet = v.ID_Vet;

-- Se muestra las vacunas que tiene cada mascota 
SELECT m.Nombre AS Mascota, v.Nombre AS Vacuna, v.Descripcion
FROM Vacunas_Mascotas vm
JOIN Mascotas m ON vm.ID_Mascota = m.ID_Mascota
JOIN Vacunas v ON vm.ID_Vacuna = v.ID_Vacuna;

-- Se muestra tratamientos aplicados en cada consulta 
SELECT c.ID_Consulta, m.Nombre AS Mascota, t.Nombre AS Tratamiento, tc.Dosis, tc.Frecuencia, tc.Duracion
FROM Tratamientos_Consultas tc
JOIN Tratamientos t ON tc.ID_Tratamiento = t.ID_Tratamiento
JOIN Consultas c ON tc.ID_Consulta = c.ID_Consulta
JOIN Mascotas m ON c.ID_Mascota = m.ID_Mascota;

-- Se muestran mascotas atendidas por un veterinario específico 
SELECT m.Nombre AS Mascota, p.Nombre AS Propietario, c.Fecha_Hora, c.Motivo, v.Nombre AS Veterinario
FROM Consultas c
JOIN Mascotas m ON c.ID_Mascota = m.ID_Mascota
JOIN Propietarios p ON m.ID_Propietario = p.ID_Propietario
JOIN Veterinarios v ON c.ID_Vet = v.ID_Vet
WHERE c.ID_Vet = 2;
 -- Para buscar otro vet solo cambiar el ID

-- Se muestra cantidad de consultas por un motivo en especifico
SELECT Motivo, COUNT(*) AS Total_Consultas
FROM Consultas
GROUP BY Motivo;

-- Se muestra las observaciones de cada tratamiento aplicado
SELECT m.Nombre AS Mascota, c.Fecha_Hora AS Fecha_Consulta, t.Nombre AS Tratamiento, tc.Observaciones
FROM Tratamientos_Consultas tc
JOIN Consultas c ON tc.ID_Consulta = c.ID_Consulta
JOIN Tratamientos t ON tc.ID_Tratamiento = t.ID_Tratamiento
JOIN Mascotas m ON c.ID_Mascota = m.ID_Mascota;

-- Se muestran Mascotas que recibieron un tratamiento específico
SELECT m.Nombre AS Mascota, t.Nombre AS Tratamiento, c.Fecha_Hora
FROM Tratamientos_Consultas tc
JOIN Tratamientos t ON tc.ID_Tratamiento = t.ID_Tratamiento
JOIN Consultas c ON tc.ID_Consulta = c.ID_Consulta
JOIN Mascotas m ON c.ID_Mascota = m.ID_Mascota
WHERE t.Nombre = 'Antibióticos'; -- Solo es cambiar el tratamiento

-- Se muestra consultas de emergencia en el último mes
SELECT c.ID_Consulta, c.Fecha_Hora, m.Nombre AS Mascota, v.Nombre AS Veterinario
FROM Consultas c
JOIN Mascotas m ON c.ID_Mascota = m.ID_Mascota
JOIN Veterinarios v ON c.ID_Vet = v.ID_Vet
WHERE c.Motivo = 'Emergencia'
  AND c.Fecha_Hora >= DATE_SUB(NOW(), INTERVAL 1 MONTH);

--  Se muestra la cantidad de consultas realizadas por cada veterinario
SELECT v.Nombre AS Veterinario, COUNT(c.ID_Consulta) AS Total_Consultas
FROM Veterinarios v
LEFT JOIN Consultas c ON v.ID_Vet = c.ID_Vet
GROUP BY v.Nombre
ORDER BY Total_Consultas DESC;

-- Indices:

-- Buscar un propietario por su cedula
CREATE INDEX idx_cedula_propietario ON Propietarios(Cedula);
-- Ejemplo:
SELECT * 
FROM Propietarios
WHERE Cedula = '00112345678';


-- Mostrar la fecha de cada consulta
CREATE INDEX idx_fecha_consulta ON Consultas(Fecha_Hora);
-- Ejemplo:  Mostrar la fecha de cada consulta entre el 1 al 7 de Agosto
SELECT c.ID_Consulta, c.Fecha_Hora, m.Nombre AS Mascota, v.Nombre AS Veterinario
FROM Consultas c
JOIN Mascotas m ON c.ID_Mascota = m.ID_Mascota
JOIN Veterinarios v ON c.ID_Vet = v.ID_Vet
WHERE c.Fecha_Hora BETWEEN '2025-08-01' AND '2025-08-07';

-- Procedimientos y Funciones Almacenadas:
-- Procedimiento almacenado para registrar una nueva consulta
DELIMITER //
CREATE PROCEDURE RegistrarConsulta(
    IN p_fecha_hora DATETIME,
    IN p_motivo ENUM('Vacunación','Revisión General','Tratamiento','Consulta Periódica','Emergencia','Cirugía','Desparasitación','Control Post-Operatorio'),
    IN p_diagnostico TEXT,
    IN p_id_mascota INT,
    IN p_id_vet INT
)
BEGIN
    INSERT INTO Consultas (Fecha_Hora, Motivo, Diagnostico, ID_Mascota, ID_Vet)
    VALUES (p_fecha_hora, p_motivo, p_diagnostico, p_id_mascota, p_id_vet);
END //
DELIMITER ;
CALL RegistrarConsulta('2025-08-18 10:00:00', 'Vacunación', 'Vacuna de refuerzo aplicada', 1, 3);

-- Función para obtener la edad promedio de las mascotas de un propietario:
DELIMITER //
CREATE FUNCTION EdadPromedioMascotas(p_id_propietario INT)
RETURNS DECIMAL(5,2)
DETERMINISTIC
BEGIN
    DECLARE promedio DECIMAL(5,2);
    SELECT AVG(Edad) INTO promedio
    FROM Mascotas
    WHERE ID_Propietario = p_id_propietario;
    
    RETURN promedio;
END //
DELIMITER ;
SELECT EdadPromedioMascotas(1) AS EdadPromedio;

-- Procedimiento para listar todas las vacunas de una mascota:
DELIMITER //
CREATE PROCEDURE VacunasPorMascota(IN p_id_mascota INT)
BEGIN
    SELECT v.Nombre AS Vacuna, v.Descripcion, vm.Fecha_Aplicacion
    FROM Vacunas_Mascotas vm
    JOIN Vacunas v ON vm.ID_Vacuna = v.ID_Vacuna
    WHERE vm.ID_Mascota = p_id_mascota;
END //
DELIMITER ;
CALL VacunasPorMascota(1);

-- Función para contar las consultas de un veterinario:
DELIMITER //
CREATE FUNCTION TotalConsultasVeterinario(p_id_vet INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total INT;
    
    SELECT COUNT(*) INTO total
    FROM Consultas
    WHERE ID_Vet = p_id_vet;
    
    RETURN total;
END //
DELIMITER ;
SELECT TotalConsultasVeterinario(2) AS ConsultasAtendidas;


-- Administración y Mantenimiento:
/* Usando mysqldump (desde consola)
mysqldump -u usuario -p Clinica_Veterinaria > Clinica_Veterinaria_backup.sql */

-- Desde consola
-- mysql -u usuario -p Clinica_Veterinaria < Clinica_Veterinaria_backup.sql


-- Monitoreo del rendimiento
-- Consultas para monitoreo:

-- Consultar la cantidad de conexiones activas:
SHOW STATUS LIKE 'Threads_connected';

-- Revisar consultas lentas (requiere activar slow_query_log):
SET GLOBAL slow_query_log = 'ON';
SHOW VARIABLES LIKE 'slow_query_log_file';


/* 8.3 Mantenimiento rutinario
Objetivo: Mantener la base de datos optimizada y segura para su uso diario.
Tareas recomendadas:
Reindexación de tablas */

-- Mejora el rendimiento de las consultas que usan índices: 
ALTER TABLE Mascotas ENGINE=InnoDB;

-- Actualización de estadísticas:
-- Mantiene el optimizador de consultas informado sobre la distribución de datos:
ANALYZE TABLE Consultas;

-- Limpieza de registros antiguos:
-- Opcionalmente, eliminar datos antiguos que ya no se necesiten, como consultas de hace más de 5 años:
DELETE FROM Consultas WHERE Fecha_Hora < DATE_SUB(NOW(), INTERVAL 5 YEAR);

-- Verificación de integridad:
-- Comprobar tablas para errores:
CHECK TABLE Mascotas;
CHECK TABLE Consultas;

-- Optimización de tablas:
-- Recupera espacio y mejora el acceso a los datos:
OPTIMIZE TABLE Vacunas_Mascotas;
OPTIMIZE TABLE Tratamientos_Consultas;



-- Control de acceso:
-- Creación de usuarios con privilegios específicos
-- Usuario solo con permisos de lectura
CREATE USER 'recepcion'@'localhost' IDENTIFIED BY 'password123';
GRANT SELECT ON Clinica_Veterinaria.* TO 'recepcion'@'localhost';

-- Usuario con permisos de administración limitada
CREATE USER 'veterinario'@'localhost' IDENTIFIED BY 'vetpass456';
GRANT SELECT, INSERT, UPDATE ON Clinica_Veterinaria.* TO 'veterinario'@'localhost';


-- Encriptación
-- Encriptación a nivel de columna:
-- Ejemplo para encriptar correo de propietario
ALTER TABLE Propietarios 
MODIFY COLUMN Correo VARBINARY(100);

-- Para almacenar de forma segura
INSERT INTO Propietarios(Nombre, Cedula, Telefono, Correo, Direccion)
VALUES('Ejemplo', '0012345678', '8095551111', AES_ENCRYPT('correo@mail.com', 'clave_secreta'), 'Calle X');


-- Auditoría
-- Registro de cambios (triggers de auditoría): 
-- Cambiar delimitador temporalmente
DELIMITER $$

CREATE TRIGGER after_insert_consulta
AFTER INSERT ON Consultas
FOR EACH ROW
BEGIN
    INSERT INTO Auditoria_Consultas(ID_Consulta, Usuario, Accion)
    VALUES (NEW.ID_Consulta, USER(), 'INSERT');
END $$
DELIMITER ;
















