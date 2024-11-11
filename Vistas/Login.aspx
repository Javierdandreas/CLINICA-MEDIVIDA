<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Vistas.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin 2 - Login</title>

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body class="bg-gradient-primary">

    <form id="form1" runat="server">

    <div class="container">

        <!-- Outer Row -->
        <div class="row justify-content-center">

            <div class="col-xl-10 col-lg-12 col-md-9">

                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="row">
                            <div class="col-lg-6 d-none d-lg-block bg-Login-image"></div>
                            <div class="col-lg-6">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-4">Welcome Back!</h1>
                                    </div>
                                        <div class="form-group">
                                            <asp:RadioButtonList ID="rblTipoUsuario" runat="server" ValidationGroup="G1" RepeatDirection="Vertical" Font-Bold="True">
                                                 <asp:ListItem>Administrador</asp:ListItem> 
                                                 <asp:ListItem>Medico</asp:ListItem>
                                            </asp:RadioButtonList>
                                            <asp:RequiredFieldValidator ID="rfvTipoUsuario" runat="server" ControlToValidate="rblTipoUsuario" ForeColor="Red" ValidationGroup="G1">Seleccione un tipo de usuario</asp:RequiredFieldValidator>
                                        </div>
                                        <div class="form-group">
                                            <asp:TextBox ID="txtUsuario" ValidationGroup="G1" runat="server" class="form-control form-control-user" placeholder="Ingrese su nombre de usuario..."></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="rfvUsuario" runat="server" ControlToValidate="txtUsuario" ForeColor="Red" ValidationGroup="G1">Ingrese un usuario</asp:RequiredFieldValidator>

                                        </div>
                                        <div class="form-group">
                                            <asp:TextBox ID="txtContraseña" runat="server" ValidationGroup="G1" TextMode="Password" placeholder="Ingrese su contraseña..." class="form-control form-control-user"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="rfvContraseña" runat="server" ControlToValidate="txtContraseña" ForeColor="Red" ValidationGroup="G1">Ingrese una contraseña</asp:RequiredFieldValidator>
                                        </div>
                                        <asp:Button ID="btnIngresar" runat="server" Text="Ingresar"  ValidationGroup="G1" OnClick="btnIngresar_Click" class="btn btn-primary btn-user btn-block" />
                                        <asp:Label ID="lbl_Notificacion" runat="server" ForeColor="Red"></asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>
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
</body>
</html>
