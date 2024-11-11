﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AgregarPaciente.aspx.cs" Inherits="Vistas.AgregarPaciente" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Agregar Pacientes</title>

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
                        <a class="collapse-item" href="ModificarMedico.aspx">Modificar Medicos</a>
                        <a class="collapse-item" href="ListarMedicos.aspx">Listar Medicos</a>
                        <a class="collapse-item" href="EliminarMedico.aspx">Eliminar Medicos</a>
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
                        <a class="collapse-item" href="ModificarPaciente.aspx">Modificar Pacientes</a>
                        <a class="collapse-item" href="ListarPacientes.aspx">Listar Pacientes</a>
                        <a class="collapse-item" href="EliminarPaciente.aspx">Eliminar Pacientes</a>
                    </div>
                </div>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages"
                    aria-expanded="true" aria-controls="collapsePages">
                    <i class="fas fa-fw fa-folder"></i>
                    <span>
                
                Reportes</span>
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


            <!-- Nav Item - Tables -->
            <li class="nav-item">
                <a class="nav-link" href="tables.aspx">
                    <i class="fas fa-fw fa-table"></i>
                    <span>Tables</span></a>
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
                                <asp:Label ID="lblNombre" runat="server" class="mr-2 d-none d-lg-inline text-gray-600 small" Text="Label"></asp:Label>
                             
                                <img class="img-profile rounded-circle"
                                    src="img/undraw_profile.svg">
                            </a>
                            <!-- Dropdown - User Information -->
                            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="userDropdown">
                                <a class="dropdown-item" href="#">
                                    <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Profile
                                </a>
                                <a class="dropdown-item" href="#">
                                    <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Settings
                                </a>
                                <a class="dropdown-item" href="#">
                                    <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Activity Log
                                </a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Logout
                                </a>
                            </div>
                        </li>

                    </ul>

                </nav>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
          
                    <div class="container">
                        <div class="header">
                            <h1>Agregar Paciente</h1>
                        </div>

                            <div class="section-title">DATOS PERSONALES</div>
            
                            <div class="form-group">
                                <div class="form-field">
                                    <label for="dni">DNI:</label>
                                    <input type="text" id="dni" name="dni" required>
                                </div>
                                <div class="form-field">
                                    <label for="nombre">NOMBRE:</label>
                                    <input type="text" id="nombre" name="nombre" required>
                                </div>
                                <div class="form-field">
                                    <label for="apellido">APELLIDO:</label>
                                    <input type="text" id="apellido" name="apellido" required>
                                </div>
                                <div class="form-field">
                                    <label for="fechaNacimiento">FECHA DE NACIMIENTO:</label>
                                    <input type="date" id="fechaNacimiento" name="fechaNacimiento" required>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="form-field">
                                    <label>SEXO:</label>
                                    <div class="radio-group">
                                        <div class="radio-option">
                                            <input type="radio" id="masculino" name="sexo" value="masculino">
                                            <label for="masculino">Masculino</label>
                                        </div>
                                        <div class="radio-option">
                                            <input type="radio" id="femenino" name="sexo" value="femenino">
                                            <label for="femenino">Femenino</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-field">
                                    <label for="nacionalidad">NACIONALIDAD:</label>
                                    <select id="nacionalidad" name="nacionalidad" required>
                                        <option value="">--Seleccionar--</option>
                                        <option value="argentina">Argentina</option>
                                        <option value="chile">Chile</option>
                                        <option value="uruguay">Uruguay</option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="form-field">
                                    <label for="telefono">TELÉFONO:</label>
                                    <input type="tel" id="telefono" name="telefono" required>
                                </div>
                                <div class="form-field">
                                    <label for="correo">CORREO ELECTRÓNICO:</label>
                                    <input type="email" id="correo" name="correo" required>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="form-field">
                                    <label for="provincia">PROVINCIA:</label>
                                    <select id="provincia" name="provincia" required>
                                        <option value="">--Seleccionar--</option>
                                        <option value="buenosaires">Buenos Aires</option>
                                        <option value="cordoba">Córdoba</option>
                                        <option value="santafe">Santa Fe</option>
                                    </select>
                                </div>
                                <div class="form-field">
                                    <label for="localidad">LOCALIDAD:</label>
                                    <select id="localidad" name="localidad" required>
                                        <option value="">--Seleccionar--</option>
                                    </select>
                                </div>
                                <div class="form-field">
                                    <label for="direccion">DIRECCIÓN:</label>
                                    <input type="text" id="direccion" name="direccion" required>
                                </div>
                            </div>

                            <button type="submit" id="boton">Agregar Paciente</button>
                    </div>
                    <br/>
                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class=" my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; Your Website 2020</span>
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

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabPortalAdmin="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="Login.aspx">Logout</a>
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
                    * {
                        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                    }

                    .container {
                        max-width: 800px;
                        margin: 0 auto;
                        background: white;
                        padding: 30px;
                        border-radius: 10px;
                        box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
                    }

                    .header {
                        background: #3f65d3;
                        color: white;
                        padding: 20px;
                        border-radius: 8px;
                        margin-bottom: 25px;
                        text-align: center;
                    }

                    .section-title {
                        background: #3f65d3;
                        color: white;
                        padding: 10px;
                        border-radius: 5px;
                        margin: 20px 0 15px 0;
                    }

                    .form-group {
                        display: grid;
                        grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
                        gap: 20px;
                        margin-bottom: 15px;
                    }

                    .form-field {
                        margin-bottom: 15px;
                    }

                    label {
                        display: block;
                        margin-bottom: 5px;
                        color: #333;
                        font-weight: 500;
                    }

                    input[type="text"],
                    input[type="email"],
                    input[type="tel"],
                    select {
                        width: 100%;
                        padding: 10px;
                        border: 1px solid #ddd;
                        border-radius: 5px;
                        font-size: 14px;
                        transition: border-color 0.3s;
                    }

                    input[type="text"]:focus,
                    input[type="email"]:focus,
                    input[type="tel"]:focus,
                    select:focus {
                        border-color: #3f65d3;
                        outline: none;
                        box-shadow: 0 0 5px rgba(70, 72, 212, 0.3);
                    }

                    .radio-group {
                        display: flex;
                        gap: 20px;
                        align-items: center;
                    }

                    .radio-option {
                        display: flex;
                        align-items: center;
                        gap: 5px;
                    }

                    .radio-option input[type="radio"] {
                        width: 18px;
                        height: 18px;
                        cursor: pointer;
                    }

                    .radio-option label {
                        margin: 0;
                        cursor: pointer;
                    }

                    #boton {
                        background: #3f65d3;
                        color: white;
                        padding: 12px 25px;
                        border: none;
                        border-radius: 5px;
                        cursor: pointer;
                        font-size: 16px;
                        transition: all 0.3s ease;
                        display: block;
                        margin: 30px auto;
                        min-width: 200px;
                    }

                    #boton:hover {
                        background: #3a3bb8;
                        transform: translateY(-2px);
                        box-shadow: 0 4px 8px rgba(70, 72, 212, 0.3);
                    }

                    #boton:active {
                        transform: translateY(0);
                        box-shadow: 0 2px 4px rgba(70, 72, 212, 0.2);
                    }

                    @media (max-width: 600px) {
                        .container {
                            padding: 15px;
                        }

                        .form-group {
                            grid-template-columns: 1fr;
                        }

                        #boton {
                            width: 100%;
                            min-width: unset;
                            padding: 15px;
                        }
                    }
        </style>

    </form>

</body>

</html>