# 🏦 TP Integrador - LAB4 2C 2024

## Universidad Tecnológica Nacional - Facultad Regional General Pacheco
### Tecnicatura Universitaria en Programación  
#### Laboratorio III - Trabajo Práctico Integrador

## 📋 Descripción del Proyecto
Este proyecto consiste en un sistema de gestión para un banco, desarrollado en **C#** y enfocado en:
- **ASP.NET**
- **SQL SERVER**
- **MVC**
- **Sessions**

El sistema maneja dos tipos de usuarios:
- **Administrador de la Clinica**: gestiona médicos, pacientes, turnos y usuarios.
- **Médicos**: pueden ver sus turnos asignados con sus pacientes.

## ⚙️ Funcionalidades principales

### 👤 Administrador
1. **ABML de Pacientes**: 
   - Gestión de pacientes con asignación de turnos.
2. **ABML de Medicos**: 
   - Gestión de medicos con asignaciones de dias, horarios y turnos con sus respectivos pacientes.
3. **Reportes y Estadísticas**: 
   - Visualización de informes para el administrador.

### 👥 Medico
1. **Visualización de Turnos**: 
   - Podra ver que dia tiene asignado turnos con sus pacientes y que dias no tiene turnos.
2. **Información Personal**: 
   - Acceso a datos personales sin posibilidad de edición.

## 🔐 Autenticación y Acceso
- **Login**: El sistema incluye un mecanismo de login que permite a los usuarios autenticarse con su nombre de usuario y contraseña.
- **Roles de Usuario**: Una vez autenticados, se determina si el usuario es un **Administrador** o un **Medico** para proporcionar el acceso adecuado a cada funcionalidad.
- **Sesiones**: El sistema gestiona las sesiones activas para asegurar que solo los usuarios logueados puedan acceder a las funcionalidades del banco.

## 🛠️ Requisitos Técnicos
- **Lenguajes y Tecnologías**: C#, ASP.NET, MVC, .NET 8, Manejo de Sesiones.
- **Base de Datos**: SQL Server.
- **Arquitectura**: Programación en tres capas (Presentación, Negocio y Acceso a Datos).
- **Manejo de Errores**: Excepciones personalizadas y validaciones de formularios para evitar datos incompletos.

---
