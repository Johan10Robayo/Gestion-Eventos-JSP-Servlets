<%-- 
    Document   : InsertarUsuario
    Created on : 3/11/2020, 7:54:57 a. m.
    Author     : santi
--%>

<%@page import="com.is.modelo.Login"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.is.database.BaseDatos"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.is.modelo.Persona"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
       <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Usuario.</title>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link rel="stylesheet" href="estilos/fontello.css"> 
        <link rel="stylesheet" href="estilos/estilos.css"> 
        <link rel="stylesheet" href="estilos/menu.css"> 
        <link rel="stylesheet" href="estilos/banner.css"> 
        <link rel="stylesheet" href="estilos/blog.css"> 
        <link rel="stylesheet" type="text/css" href="estilos/estilos_1.css">
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">
        <!-- Optional theme -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css" integrity="sha384-6pzBo3FDv/PJ8r2KRkGHifhEocL+1X2rVCTTkUfGk7/0pbek5mMa1upzvWbrUbOZ" crossorigin="anonymous">
    </head>
    <body class="fondologin">
        <header>
            <div class="contenedor">
                <h1>EVENTOS COLOMBIA</h1>
                <input type="checkbox" id="menu-bar">
                <label class="icon-menu" for="menu-bar"></label>
                <nav class="menu">
                    <a href="index.jsp">Inicio</a>
                    <a href="CarteleraTeatro.jsp">Cartelera teatro.</a>
                    <a href="CarteleraAuditorio.jsp">Cartelera auditorio</a>
                    <a href="Login.jsp">Iniciar sesi&oacute;n.</a>
                </nav>
            </div>
        </header>
 
         <section class="main row">
                    <div class="col-lg-12">	
                        
    
        <%
            Persona per = new Persona(request.getParameter("numdocu"),request.getParameter("tipodocu"),request.getParameter("nombresapel"),request.getParameter("correo"),request.getParameter("celular"));
            
            
            //insert persona
            int res=0;
             boolean inserto=false;
            Connection conne=BaseDatos.getConecction();
            PreparedStatement pstatement=null;
            ResultSet resultSet = null;
            String sql="";
            
            sql="insert into Persona value(";
            sql=sql+"'"+ per.getNumero_documento() + "',";
            sql=sql+"'"+ per.getTipo_documento() + "',";
            sql=sql+"'"+ per.getNombre() + "',";
            sql=sql+"'"+ per.getCorreo() + "',";
            sql=sql+"'"+ per.getCelular() + "'";
            sql=sql+ ")";
            
        pstatement=conne.prepareStatement(sql);
        res=pstatement.executeUpdate();
        try {
            if(res==1){
                //confirmar la transacciòn
                conne.commit();
                inserto=true;
            }else{
                System.out.println("Error al insertar...");
                conne.rollback();
                inserto=false;
            }
        } catch (SQLException ex) {
            conne.rollback();
            Logger.getLogger(Persona.class.getName()).log(Level.SEVERE,null, ex);
        }

        Login login = new Login(request.getParameter("user"),"normal",request.getParameter("passregistro"),request.getParameter("numdocu"));
            
        //insert login
        
        int res2=0;
        boolean inserto2=false;
        Connection conne2=BaseDatos.getConecction();
        PreparedStatement pstatement2=null;
        ResultSet resultSet2 = null;
        
        String sql2="";
        sql2="insert into login (usuario,tipo,password,id_persona) value(";
        sql2=sql2+"'"+ login.getUsuario() + "',";
        sql2=sql2+"'"+ login.getTipo() + "',";
        sql2=sql2+"'"+ login.getPassword() + "',";
        sql2=sql2+"'"+ login.getId_persona() + "'";
        sql2=sql2+ ")";
        
        
        System.out.println("sql="+sql2);
        pstatement=conne.prepareStatement(sql2);
        res=pstatement.executeUpdate();
        try {
            if(res==1){
                //confirmar la transacciòn
                conne.commit();
                inserto2=true;
            }else{
                System.out.println("Error al insertar...");
                conne.rollback();
                inserto2=false;
            }
        } catch (SQLException ex) {
            conne.rollback();
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE,null, ex);
        }
        
        out.print("<br>");
        out.print("<br>");
        out.print("<br>");

        out.print("<div class='contenedorform'>");
        out.print("<section class='main row'>");
        out.print("<div class='col-lg-12'>");
        
          if(inserto==true && inserto2==true){
          out.println("<h1>BIENVENIDO "+per.getNombre()+"</h1>");
          }     
          else{
                out.println("<h1>Error al registrarse</h1>");
            }
        out.print("</div>");
        out.print("</section>");
        out.print("</div>");
            
        
        %>
        
           </div>
        </section>
    </body>
</html>
