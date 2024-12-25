<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TurnosAdmin.aspx.cs" Inherits="Vistas.TurnosAdmin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Turnos Administrador</title>

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>

    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-sweetalert/1.0.1/sweetalert.css" rel="stylesheet"/>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-sweetalert/1.0.1/sweetalert.js" type="text/javascript"></script>

    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>


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
                        <a class="collapse-item" href="ListarPacientes.aspx">Listar Pacientes</a>
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
                    <span>
                
                Turnos</span></a>
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
                    <div class="container">
                        <div class="header">
                            <h1>Asignar Turno a paciente</h1>
                        </div>

                            <div class="section-title">DATOS DEL MEDICO</div>
            
                            <div class="form-group">
                                <div class="form-field">
                                    <label for="dni">Especialidad:</label>
                                    <asp:DropDownList ID="ddl_especialidades" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddl_especialidades_SelectedIndexChanged">
                                    </asp:DropDownList>
                                </div>
                                <div class="form-field">
                                    <label for="nombre">Medico</label>
                                    <asp:DropDownList ID="ddl_medicos" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddl_medicos_SelectedIndexChanged">
                                    </asp:DropDownList>          
                                </div>
                                <div class="form-field">
                                    <label for="apellido">Día</label>
                                    <asp:DropDownList ID="ddl_dias" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddl_dias_SelectedIndexChanged">
                                    </asp:DropDownList>
                                </div>
                                <div class="form-field">
                                    <label for="fechaNacimiento">Horario</label>
                                    <asp:DropDownList ID="ddl_horarios" runat="server">
                                    </asp:DropDownList> 
                                </div>
                                <div class="form-field">
                                    <asp:Button runat="server" ID="btnFiltrarTurnos" Text="Filtrar Turnos" OnClick="btnFiltrarTurnos_Click"/>
                                </div>
                            </div>
                            

                            <div class="section-title">DATOS DEL PACIENTE</div>
                            <div class="form-group">
                                <div class="form-field">
                                    <label for="dni">Nombre o apellido del paciente:</label>
                                    <asp:TextBox ID="txt_nom_ape" runat="server"></asp:TextBox>
                                    <asp:Button runat="server" ID="btnBuscarPaciente" Text="Buscar" OnClick="btnBuscarPaciente_Click"/>
                                </div>
                                <div class="form-field">
                                    <label for="dni">Pacientes:</label>
                                    <asp:DropDownList ID="ddl_pacientes" class="ddl" runat="server">
                                    </asp:DropDownList>          
                                </div>
                            </div>
                        <div class="form-group">
                            <div class="table-responsive">
                                <asp:GridView ID="grdTurnos" runat="server" AutoGenerateColumns="False" Visible="false" class="table" AllowPaging="True" OnPageIndexChanging="grdTurnos_PageIndexChanging">
                                    <Columns>
                                        <asp:TemplateField HeaderText="TURNO">
                                            <ItemTemplate>
                                                <asp:Label ID="lbl_it_Turno" runat="server" Text='<%# Bind("Id_turno") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="MEDICO" >
                                            <ItemTemplate>
                                                <asp:Label ID="lbl_it_medico" runat="server" Text='<%# Bind("NombreCompleto") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="DÍA">
                                            <ItemTemplate>
                                                <asp:Label ID="lbl_it_Dia" runat="server" Text='<%# Bind("Dias") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="HORAIO" >
                                            <ItemTemplate>
                                                <asp:Label ID="lbl_it_Horario" runat="server" Text='<%# Bind("CodHorario_TJ") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="FECHA" >
                                            <ItemTemplate>
                                                <asp:Label ID="lbl_it_fecha" runat="server" Text='<%# Bind("CodFecha_TJ") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:Button CssClass="btn btnTomarTurno" ID="btnTomarTurno" runat="server" CommandArgument='<%# Eval("Id_turno")+";"+Eval("NombreCompleto")+";"+Eval("Dias")+";"+Eval("CodHorario_TJ")+";"+Eval("CodFecha_TJ") %>' CommandName="eventoTomarTurno" OnCommand="btnTomarTurno_Command" Text="Tomar Turno" ValidationGroup="Paciente" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <RowStyle CssClass="centered"/>
                                    <HeaderStyle CssClass="centered" />
                                </asp:GridView>
                            </div>
                        </div>
                    </div>

                    </div>
                    <br/>
                </div>
                <!-- /.container-fluid -->

            
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


    </form>
     
    <style>
                    .btnTomarTurno {
                        background-color: #4CAF50;
                        color: white;
                    }
                    .btn:hover.btnTomarTurno {
                        color: white;
                        background-color: darkgreen;
                    }
                    .centered {
                        text-align: center;
                    }
                    * {
                        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                    }

                    #btnBuscarPaciente, #btnFiltrarTurnos {
                        margin-top: 18px;
                        background: #3f65d3;
                        color: white;
                        padding: 12px 25px;
                        border: none;
                        border-radius: 5px;
                        cursor: pointer;
                        font-size: 16px;
                        transition: background 0.3s;
                    }

                    .btn {
                        padding: 10px 15px;
                        margin: 5px;
                        border: none;
                        border-radius: 5px;
                        cursor: pointer;
                        font-weight: bold;
                        transition: transform 0.2s ease;
                    }

                    .btn:hover {
                        opacity: 0.8;
                        transform: scale(1.05);
                    }

                    #btnBuscarPaciente:hover, #btnFiltrarTurnos {
                        background: #1976D2;
                    }

                    .container {
                        max-width: 1200px;
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
                        grid-template-columns: repeat(auto-fit, minmax(50px, 1fr));
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
        </style>

</body>

</html>
