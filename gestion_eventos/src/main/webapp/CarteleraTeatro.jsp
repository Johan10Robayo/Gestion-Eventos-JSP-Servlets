<%-- 
    Document   : CarteleraTeatro
    Created on : 24/10/2020, 8:49:22 p. m.
    Author     : Windows 10
--%>

<%@page import="com.is.modelo.Evento"%>
<%@page import="com.is.database.MisConsultas"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CARTELERA TEATRO</title>
        <link rel="icon" type="image/jpg" href="imagenes/iconocaras.jpg">
        <link rel="stylesheet" href="estilos/fontello.css"> 
        <link rel="stylesheet" href="estilos/estilos.css"> 
        <link rel="stylesheet" href="estilos/menu.css"> 
        <link rel="stylesheet" href="estilos/banner.css"> 
        <link rel="stylesheet" href="estilos/blog.css"> 
        
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">
        <!-- Optional theme -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css" integrity="sha384-6pzBo3FDv/PJ8r2KRkGHifhEocL+1X2rVCTTkUfGk7/0pbek5mMa1upzvWbrUbOZ" crossorigin="anonymous">
</head>
    <body>
        <header>
            <div class="contenedor">
                    <h1>EVENTOS COLOMBIA</h1>
                    <input type="checkbox" id="menu-bar">
                    <label class="icon-menu" for="menu-bar"></label>
                    <nav class="menu">
                            <a href="index.jsp">Inicio</a>
                            <a href="CarteleraAuditorio.jsp">Cartelera auditorio</a>
                            <a href="Login.jsp">Login</a>
                            <a href="Registro.jsp">Registro</a>
                    </nav>
                     <%
                        HttpSession sesion = request.getSession();
                        if(session.getAttribute("user")!=null ){
                            if(session.getAttribute("user").equals("Inicie sesion")){
                                out.println("<label><a href='Login.jsp'>Inicie sesión</a></label>");
                            }else{
                                out.println("<label> <a href='Controlador?accion=Salir'>  Cerrar sesión   </a>  </label>");
                                out.println("<label>User: "+session.getAttribute("user") +" <label></label></label>");   
                            }
                        }
                        else{
                            session.setAttribute("user", "Inicie sesion");
                            String user = (String)session.getAttribute("user");
                            if(session.getAttribute("user").equals("Inicie sesion")){
                                out.println("<label><a href='Login.jsp'>Inicie sesión</a></label>");
                            }
                        }
                         %>
            </div>
           
        </header> 
          <br><br><br>
             <center><h2>Cartelera teatro.</h2></center>
        <div class="container">
            <section class="main row">
                <div class="col-lg-12">	
                    <div class="container">	

                            <!--PRIMERA FILA-->
                            <div class="container-fluid">
                                <div class="row">
   
                                    <%
                                    MisConsultas misConsultas = new MisConsultas();
                                    
                                         for(Evento event : misConsultas.consultaEventoTeatro()){

                                        
                                        
                                        out.println("<div class='col-xs-6 col-sm-6 col-md-6 col-lg-6'>");	
                                            out.println("<form action='MostrarInfoTeatro.jsp'>");
                                                out.println("<h4>"+event.getNombre()+"</h4>");
                                                    out.println("<input type='hidden' value='"+event.getId()+"' name='id2' >");
                                                    out.println("<img src='"+event.getPoster()+"' class='img-responsive img-rounded'/>");
                                                    out.println("<center><ol>"+event.getDescripcion()+"</ol></center>");
                                                    out.println("<center><ol>Director:"+event.getDirector()+"</ol></center>");
                                                    out.println("<input class='btn btn-info' type='SUBMIT' value='M&aacute;s informaci&oacute;n.'>");
                                            out.println("</form>");
                                        out.println("</div>");
                                        
                                        
                                        }  
                                    %> 
      
                                    
                                </div>	
                            </div>
                    </div>
                </div>
            </section>
	</div>
    </body>
</html>
