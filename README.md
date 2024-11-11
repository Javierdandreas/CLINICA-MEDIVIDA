TP Integrador - LAB4 2C 2024
Universidad Tecnológica Nacional - Facultad Regional General Pacheco
Tecnicatura Universitaria en Programación
Laboratorio III - Trabajo Práctico Integrador
📝 Descripción del Proyecto
Este proyecto consiste en un sistema de gestión para un banco, desarrollado en C# y enfocado en:

ASP.NET
SQL SERVER
MVC
Sessions
El sistema maneja dos tipos de usuarios:

Administrador de la Clínica: gestiona médicos, pacientes, turnos y usuarios.
Médicos: pueden ver sus turnos asignados con sus pacientes.
🔧 Funcionalidades principales
👤 Administrador
ABML de Pacientes:
Gestión de pacientes con asignación de turnos.
ABML de Médicos:
Gestión de médicos con asignaciones de días, horarios y turnos con sus respectivos pacientes.
Reportes y Estadísticas:
Visualización de informes para el administrador.
👨‍⚕️ Medico
Visualización de Turnos:
Podrá ver qué día tiene asignado turnos con sus pacientes y qué días no tiene turnos.
Información Personal:
Acceso a datos personales sin posibilidad de edición.
🔒 Autenticación y Acceso
Login: El sistema incluye un mecanismo de login que permite a los usuarios autenticarse con su nombre de usuario y contraseña.
Roles de usuario: Una vez autenticado, se determina si el usuario es un Administrador o un Médico para proporcionar el acceso adecuado a cada funcionalidad.
Sesiones: El sistema gestiona las sesiones activas para asegurar que solo los usuarios logueados puedan acceder a las funcionalidades del banco.
⚙️ Requisitos Técnicos
Lenguajes y Tecnologías: C#, ASP.NET, MVC, .NET, Manejo de Sesiones.
Base de Datos: SQL Server.
Arquitectura: Programación en tres capas (Presentación, Negocio y Acceso a Datos).
Manejo de Errores: Excepciones personalizadas y validaciones de formularios para evitar datos incompletos.
