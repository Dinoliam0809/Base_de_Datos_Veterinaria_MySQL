# Base_de_Datos_Veterinaria_MySQL
# 🐾 Clínica Veterinaria — Sistema de Base de Datos MySQL

Sistema de base de datos relacional diseñado para gestionar el seguimiento médico 
de mascotas en una clínica veterinaria. Incluye gestión de propietarios, mascotas, 
vacunas, consultas y tratamientos.

---

## 📋 Descripción

Este proyecto fue desarrollado como trabajo final de la asignatura **Diseño e 
Implementación de Bases de Datos** en el ITLA. El objetivo fue modelar y construir 
una base de datos funcional que resuelva un problema real, siguiendo buenas 
prácticas de diseño relacional, seguridad y mantenimiento.

---

## 🗄️ Tecnologías utilizadas

- **MySQL 8.0**
- **MySQL Workbench** (diseño ERD y administración)

---

## 📐 Estructura de la base de datos

El sistema cuenta con **8 tablas** relacionadas entre sí:

| Tabla | Descripción |
|---|---|
| `Propietarios` | Datos de los dueños de mascotas |
| `Mascotas` | Información de cada paciente |
| `Veterinarios` | Personal médico de la clínica |
| `Consultas` | Historial de citas médicas |
| `Vacunas` | Catálogo de vacunas disponibles |
| `Vacunas_Mascotas` | Registro de vacunas aplicadas |
| `Tratamientos` | Catálogo de tratamientos |
| `Tratamientos_Consultas` | Tratamientos aplicados por consulta |

---

## ⚙️ Funcionalidades implementadas

- ✅ Diseño ERD y modelo relacional completo
- ✅ Scripts DDL para creación de tablas con constraints y foreign keys
- ✅ Inserción de datos de prueba realistas
- ✅ Índices para optimización de consultas
- ✅ Stored procedures (ej: registrar consulta, listar vacunas por mascota)
- ✅ Funciones almacenadas (ej: edad promedio, total de consultas por veterinario)
- ✅ Triggers de auditoría
- ✅ Control de acceso con roles (administrador, veterinario, recepción)
- ✅ Consultas analíticas (carga laboral por veterinario, motivos más frecuentes, emergencias recientes)

---

## 🚀 Cómo ejecutar el proyecto

1. Tener instalado **MySQL Server 8.0+** y **MySQL Workbench**
2. Clonar este repositorio
3. Abrir MySQL Workbench y conectarse al servidor local
4. Ejecutar el archivo `clinica_veterinaria.sql` en orden
```sql
