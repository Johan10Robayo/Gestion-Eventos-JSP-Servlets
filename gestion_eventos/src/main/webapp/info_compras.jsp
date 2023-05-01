<%-- 
    Document   : info_compras
    Created on : 2/11/2020, 03:04:36 PM
    Author     : ADMIN
--%>

<%@page import="com.is.modelo.Tiquete"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.is.database.MisConsultas"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% MisConsultas misconsultas=new MisConsultas();%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Informaci&oacute;n compras.</title>
        <link rel="icon" type="image/jpg" href="imagenes/iconocaras.jpg">
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
                    <a href="index.jsp">Inicio.</a>
                    <a href="CarteleraTeatro.jsp">Cartelera teatro.</a>
                    <a href="CarteleraAuditorio.jsp">Cartelera auditorio</a>
                    <a href="Login.jsp">Iniciar sesi&oacute;n.</a>
                </nav>
            </div>
        </header>
             <label id="usuario"><%= session.getAttribute("user") %></label>
        <% 
             String user = (String)session.getAttribute("user");
            int id_user = misconsultas.consultaIdUsuario(user);
   
            String puestos=request.getParameter("puestos_comprados");
            String [] array_sillas = puestos.split(";");
            String fecha=request.getParameter("fecha");
            String hora=request.getParameter("hora");
            String nombre_recinto=request.getParameter("nombre_recinto");
            String nombre_evento=request.getParameter("nombre_evento");
            int id_recinto=misconsultas.consultar_id_recinto(nombre_recinto);
            int id_evento=misconsultas.consultar_id_evento(nombre_evento);
            ArrayList<Integer> ids_sillas=misconsultas.ids_sillas(array_sillas);
            misconsultas.generar_compra(fecha, hora, id_user, id_recinto, ids_sillas, id_evento);                
            Tiquete tiquete=misconsultas.generar_tiquete(ids_sillas, id_user);
            ArrayList <String> posiciones=tiquete.getSillas();
            ArrayList<Double> precios=tiquete.getPrecios_sillas();
            
        %>
        
        <br>

        
         
        <div class='contenedorform'>
        <section class='main row'>
        <div class='col-lg-12'>
        <center><h2>Detalle compra.</h2></center>
        <h1>FECHA DE LA FUNCION <%=fecha%></h1>
        <h1>HORA DE LA FUNCION <%=hora%></h1>
        <h1>RECINTO <%=nombre_recinto%></h1>
        <h1>EVENTO <%=nombre_evento%></h1>
         
        <h1> USUARIO <%=tiquete.getUsuario()%></h1>
        <h1> Información de las sillas</h1>
         
         <table border="1">
             <tr>
                 <td>posiciones de la sillas</td>
                 <td>valor por unidad</td>
             </tr>
        <%
             for(int i=0;i<posiciones.size();i++){ %>
             <tr>
                 <td><%=posiciones.get(i)%> </td>
                 <td><%=precios.get(i)%> </td>
             </tr> 
         <%} %>
             <tr>
                 <td>Precio total</td>
                 <td><%=tiquete.getPrecio_total()%></td>
             </tr>
           
         </table>
             
         </div>
        </section>
        </div>
             <br><br>
    </body>
</html>
