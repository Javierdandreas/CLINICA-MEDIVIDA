﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PortalAdmin.aspx.cs" Inherits="Vistas.PortalAdmin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">


    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Inicio</title>

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body id="page-top">

    <form id="form1" runat="server">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="PortalAdmin.aspx">
                <div class="sidebar-brand-icon rotate-n-15">
                    <i class="fas fa-laugh-wink"></i>
                </div>
                <div class="sidebar-brand-text mx-3">Medivida</div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
            <li class="nav-item">
                <a class="nav-link" href="PortalAdmin.aspx">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span>Dashboard</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
                    aria-expanded="true" aria-controls="collapseTwo">
                    <i class="fas fa-fw fa-cog"></i>
                    <span>Medicos</span>
                </a>
                <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <a class="collapse-item" href="AgregarMedico.aspx">Agregar Medicos</a>
                        <a class="collapse-item" href="ListarMedicos.aspx">Listar Medicos</a>  
                    </div>
                </div>
            </li>

            <!-- Nav Item - Utilities Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities"
                    aria-expanded="true" aria-controls="collapseUtilities">
                    <i class="fas fa-fw fa-wrench"></i>
                    <span>Pacientes</span>
                </a>
                <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities"
                    data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <a class="collapse-item" href="AgregarPaciente.aspx">Agregar Pacientes</a>
                        <a class="collapse-item" href="ListarPacientes.aspx">Listar Pacientes</a>                    </div>
                </div>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages"
                    aria-expanded="true" aria-controls="collapsePages">
                    <i class="fas fa-fw fa-folder"></i>
                    <span>Reportes</span>
                </a>
                <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <a class="collapse-item" href="Reporte1.aspx">Reporte 1</a>
                        <a class="collapse-item" href="Reporte2.aspx">Reporte 2</a>
                        <a class="collapse-item" href="Reporte3.aspx">Reporte 3</a>
                    </div>
                </div>
            </li>

            <li class="nav-item">
                <a class="nav-link" href="TurnosAdmin.aspx">
                    <i class="fas fa-fw fa-table"></i>
                    <span>Turnos</span></a>
            </li>


            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">

            <!-- Sidebar Toggler (Sidebar) -->
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>

        </ul>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                    <!-- Sidebar Toggle (Topbar) -->
                    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                        <i class="fa fa-bars"></i>
                    </button>

                    <!-- Topbar Navbar -->
                   
                    <ul class="navbar-nav ml-auto">

                        <div class="topbar-divider d-none d-sm-block"></div>

                        <!-- Nav Item - User Information -->
                        <li class="nav-item dropdown no-arrow">
                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <asp:Label ID="lblNombre" runat="server" Text="Label" class="mr-2 d-none d-lg-inline text-gray-600 small"></asp:Label>
                                
                                <img class="img-profile rounded-circle"
                                    src="img/undraw_profile.svg">
                            </a>
                            <!-- Dropdown - User Information -->
                            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="userDropdown">
                                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Cerrar Sesión
                                </a>
                            </div>
                        </li>

                    </ul>

                </nav>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1  id="titulo">Página Principal</h1>

                    <div class="container">
                        <h1>Funciones del Administrador</h1>
                        <h2>Sistema de Gestión Bancario</h2>

                        <p>El administrador del sistema tiene un rol esencial en la gestión de la clínica, con acceso a funciones clave para el control de los datos y las operaciones relacionadas con los médicos, pacientes y reportes. Las funciones específicas del administrador incluyen:</p>

                        <h3>1. Gestión Completa de Pacientes (ABML de Pacientes)</h3>
                        <ul>
                            <li>El administrador puede agregar, modificar, eliminar y listar pacientes en el sistema.</li>
                            <li>Además, puede asignar turnos a los pacientes según las disponibilidades de los médicos, facilitando una organización eficiente de la atención.</li>
                        </ul>

                        <h3>2. Gestión de Médicos (ABML de Médicos)</h3>
                        <ul>
                            <li>El administrador puede registrar, actualizar, eliminar y listar a los médicos.</li>
                            <li>Puede configurar los días y horarios en los que los médicos están disponibles, asignándoles turnos y emparejándolos con pacientes en función de estos horarios.</li>
                            <li>Esta funcionalidad permite una asignación optimizada de los turnos, asegurando que cada médico tenga un calendario organizado con sus pacientes correspondientes.</li>
                        </ul>

                        <h3>3. Reportes y Estadísticas</h3>
                        <ul>
                            <li>El administrador tiene acceso a informes detallados y estadísticas relevantes para la toma de decisiones.</li>
                            <li>Los reportes incluyen datos sobre la cantidad de turnos asignados, la ocupación de los médicos y otras métricas importantes para la gestión de la clínica.</li>
                            <li>Estas estadísticas ayudan al administrador a identificar patrones, optimizar la asignación de recursos y mejorar el servicio general de la clínica.</li>
                        </ul>

                        <h3>4. Gestión de Usuarios</h3>
                        <ul>
                            <li>El administrador puede gestionar los usuarios del sistema, asegurando que solo las personas autorizadas puedan acceder a las distintas funcionalidades.</li>
                            <li>Esto incluye la creación de cuentas para médicos y otros administradores, la modificación de datos de acceso, y el bloqueo o eliminación de usuarios si es necesario.</li>
                        </ul>

                        <p>Gracias a estas funcionalidades, el administrador mantiene un control integral sobre las operaciones de la clínica, facilitando la coordinación entre médicos y pacientes y asegurando que la gestión de turnos y recursos sea eficiente.</p>
                    </div>

                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; Tu sitio 2024</span>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Cerrar Sesión Modal-->
    <div class="modal fade" id="logoutModal" tabPortalAdmin="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Listo para irse?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Seleccione "Cerrar sesión" si esta listo para finalizar su sesión actual!</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="Login.aspx">Cerrar Sesión</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>

    <style>
    .titulo {
        font-size: 70px;
    }

    .container {
        max-width: 800px;
        margin: 20px auto;
        background: #fff;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }
    h1, h2 {
        color: #333;
        text-align: center;
    }
    h3 {
        color: #0056b3;
        margin-top: 20px;
    }
    p {
        color: #555;
    }
    ul {
        list-style-type: disc;
        padding-left: 20px;
        color: #555;
    }
    </style>

    </form>

</body>
</html>
