<%-- 
    Document   : SillasAuditorio
    Created on : 24/10/2020, 9:16:24 p. m.
    Author     : Windows 10
--%>

<%@page import="com.is.modelo.funcion_recinto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.is.modelo.Silla"%>
<%@page import="com.is.modelo.Silla"%>
<%@page import="com.is.database.MisConsultas"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% int cod_evento=Integer.parseInt(request.getParameter("codigo_evento"));
   String sala = request.getParameter("sala");
   MisConsultas misconsultas =new MisConsultas();
%>
<html>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sillas auditorio.</title>
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
        <link rel="stylesheet" type="text/css" href="estilos/estilo_sillas_teatro.css">
    </head>
    <body class="fondo3">
        <header>
                <div class="contenedor">
                        <h1>EVENTOS COLOMBIA</h1>
                        <input type="checkbox" id="menu-bar">
                        <label class="icon-menu" for="menu-bar"></label>
                        <nav class="menu">
                                <a href="index.jsp">Inicio</a>
                                <a href="CarteleraTeatro.jsp">Cartelera teatro.</a>
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
        <br><br><br><br>
        
        <br><br><br>
        <label id="usuario"><%= session.getAttribute("user") %></label>
        <div class="container">
            <div>
                <% funcion_recinto func_rec=misconsultas.obtener_info_funcion_evento(cod_evento,sala); %>
                <div class="container fondo_info">
                    <div class="form-row">
				<div class="form-group col-md-6">
                                    <label class="control-label" > Nombre de recinto: <label id="nombre_recinto"><%=func_rec.getNombre_recinto()%></label></label>
                                </div>

                                <div class="form-group col-md-6">
                                    <label class="control-label" > Nombre de evento: <label id="nombre_evento"><%=func_rec.getNombre_evento()%></label></label>
                                </div>
                                <!--AGREGADO POR SANTI-->
                                <%
                                    out.println("<input type='hidden' id='cod_evento' value='"+cod_evento+"'>");
                                    out.println("<input type='hidden' id='sillas' value='SillasAuditorio'>");
                                
                                %>
                                <!---->
                              
                    </div> 
                    
                    <div class="form-row">
				<div class="form-group col-md-6">
                                    <label class="control-label" > Tipo de recinto: <%=func_rec.getTipo_recinto()%></label>
                                </div>

                                <div class="form-group col-md-6">
                                    <label class="control-label" > Fecha: <label id="fecha_funcion"><%=func_rec.getFecha()%></label></label>
                                </div>
                    </div> 
                    
                    <div class="form-row">
				<div class="form-group col-md-6">
                                    <label class="control-label" > Hora: <label id="hora_funcion"><%=func_rec.getHora()%></label></label>
                                </div>
                    </div>
                </div>
                
                <div class="container tabla">
                    <table  border="1">
                       <tbody id="tabla_sillas" >
                 
                    <%
                        
                        
                        ArrayList<Silla> sillas =func_rec.getSillas();
                        ArrayList<String> letras = new ArrayList<String>();
                        letras.add("A");
                        letras.add("B");
                        letras.add("C");
                        letras.add("D");
                        letras.add("E");
                        letras.add("F");
                        letras.add("G");
                        letras.add("H");
                        letras.add("I");
                        letras.add("J");
                        letras.add("K");
                        letras.add("L");
                        letras.add("M");
                        letras.add("N");
                        letras.add("O");
                        letras.add("P");
                        letras.add("Q");
                        letras.add("R");
                        letras.add("S");
                        letras.add("T");
                        letras.add("U");
                        letras.add("V");
                        letras.add("W");
                        letras.add("X");
                        letras.add("Y");
                        letras.add("Z");
                    
                    %>
                    
                        
                   <% for (int i=0;i<18;i++){%>
                   <tr>
                        <%for(int j=0;j<13;j++){%>
                            
                                <% String id=letras.get(i)+j;
                                boolean bandera=false;
                                for(int x=0;x<sillas.size();x++){
                                    System.out.println(id);
                                    System.out.println(sillas.get(x).getPosicion());
                                    if (id.compareTo(sillas.get(x).getPosicion())==0){%>   
                                     <td id="<%=id%>" class='ocupada'><img  src="imagenes/silla_ocupada.png"> </td>
                                     <%
                                          bandera=true;
                                         }
                                    }
                                 if(!bandera){%>
                                    <td id="<%=id%>" class='desocupada'><img  src="imagenes/silla_desocupada.png"></td>
                                  <%bandera=false;
                                  }

                    }%>
                   </tr>
                       <%}
                    %>
                          </tbody>
                    </table>
                    
                     <br>
                     <br>
                    <div class="container">
                        <button class="btn btn-primary" onclick="comprar()">comprar puesto</button>
                    </div>
                     <br>
                     <br>
                </div>
            
        </div>
        
        
        
    </body>
        <script src="js/comprar.js"></script> 
</html>
