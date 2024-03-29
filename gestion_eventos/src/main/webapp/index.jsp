<%-- 
    Document   : index
    Created on : 5/11/2020, 10:21:06 a. m.
    Author     : santi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<!DOCTYPE html>
<html>
    <head>
        <title>EVENTOS COLOMBIA</title>
        <meta charset="UTF-8">
        <link rel="icon" type="image/jpg" href="imagenes/iconocaras.jpg">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="viewport content="width=device-width,user-scalable=no,initial-scale=1, maximun-scale=1, minimum-scale=1">
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
                        <br>
                       
                        <input type="checkbox" id="menu-bar">
                        <label class="icon-menu" for="menu-bar"></label>
                        <nav class="menu">
                                <a href="index.jsp">Inicio.</a>
                                <a href="CarteleraTeatro.jsp">Cartelera teatro.</a>
                                <a href="CarteleraAuditorio.jsp">Cartelera auditorio.</a>
                                <a href="Login.jsp">Login.</a>
                                <a href="Registro.jsp">Registro.</a>
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
        
        <main>
            <section id="banner">
            <img src="imagenes/banner.jpg"/>
                    <div class="contenedor">
                    <h2>TEATRO Y PONENCIAS.</h2>
                    <p>Somos l&iacute;deres en eventos.</p>
                   
                    </div>
            </section>
	</main>
        
        <div class="container">
            <h1>BIENVENIDOS AMANTES DEL ARTE</h1>
            <article><br>
                    <p>Eventos Colombia con m&aacute;s de 150 obras desde su nacimiento en 1981 y guiada por la actriz, 
                        directora y empresaria argentina Fanny Mikey se ha convertido en uno de los escenarios m&aacute;s importantes 
                        del teatro en Bogot&aacute; y Colombia.Desde su creaci&oacute;n Eventos Colombia ha trabajado en la producci&oacute;n y 
                        difusi&oacute;n de la actividad teatral y la formaci&oacute;n integral de actores en Colombia, lo que ha logrado que 
                        este espacio cultural se convierta en uno de los teatros con mayor reconocimiento y trayectoria del pa&iacute;s.
                        En la actualidad la fundaci&oacute;n cuenta con tres sedes, todas estas tienen objetivos espec&iacute;ficos, sin embargo, 
                        en las tres podr&aacute;s reencontrarte con el arte teatral y con toda la amplia y variada programaci&oacute;n que ofrece 
                        este m&aacute;gico y cultural Teatro.Es importante destacar que Eventos Colombia debido a su extensa programaci&oacute;n 
                        y siempre con el objetivo de fomentar el arte en la capital colombiana ofrece a su público puestas en escena 
                        en otros espacios de la ciudad como calles, parques, coliseos y plaza de toros entre otros espacios a los que 
                        pueden acceder las personas y disfrutar de este arte</p>
            </article>
            <section class="main row">
                <div class="col-lg-12">	
                    <div class="container">					
                            
                                
                             
                <!--IMAGEN 1 Y 2-->
                <div class="container-fluid">
                                <div class="row">
                                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 ">
                                                        <h2>TEATROS</h2>
                                                        <p>La sala Jaime Garz&oacute;n es uno de los principales anfitriones del Festival Iberoamericano de 
                                                            Teatro de Bogot&aacute;, adem&aacute;s, por su capacidad para 714 personas se convierte un uno de los principales teatros 
                                                            de la capital colombiana.

                                                            Este teatro tiene una amplia y fuerte programación cultural durante todo el año, su ubicación estratégica le 
                                                            permite a este recinto de magia, cultura, arte y encantamiento ser uno de los teatros preferidos por los colombianos 
                                                            y extranjeros.</p>
                                                        <a href="CarteleraTeatro.jsp">
                                                                <center><img src="imagenes/mascaras.jpg"  class="img-responsive img-rounded"/></center>
                                                        </a>
                                        </div>
                                        <br><br>
                                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 ">
                                                        <h2>AUDITORIOS</h2>
                                                        <p>En general, un auditorio (del lat&iacute;n auditorium, una serie de asientos puestos de manera semicircular en el anfiteatro romano) 
                                                            es el espacio dentro de un teatro, de un cine, de una sala de conciertos, de una escuela o universidad, o de cualquier otro
                                                            espacio p&uacute;blico (incluso al aire libre) al que asiste una audiencia (público) a escuchar y/u observar un evento o 
                                                            presentaci&oacute;n cultural, o de tem&aacute;tica educativa, poltica, social, o cient&iacute;fica (espect&aacute;culo, concierto, pel&iacute;cula, 
                                                            obra de teatro, examen, recital, coloquio, lectura p&uacute;blica, performance, happening, fiesta, mitin, debate, conferencia, 
                                                            asamblea, etc&eacute;tera).En el caso espec&iacute;fico de los cines, el n&uacute;mero de auditorios suele expresarse como el n&uacute;mero de salas.</p>
                                                        <a href="CarteleraAuditorio.jsp">
                                                                <center><img src="imagenes/auditorio.jpg" class="img-responsive img-rounded"/></center>
                                                        </a>

                                        </div>
                                </div>	
                            </div>
                    
                    <!--IMAGEN MEDIOS DE PAGO-->
                            <div class="container-fluid">
                                    <div class="row">
                                                    <div class="col-xs-12 col-md-9 col-lg-9 col-md-offset-2 col-lg-offset-3">
                                                        <br><br>
                                                        <h5>Términos y Condiciones — Política de Privacidad y Confidencialidad</h5>
                                                        <h5>Eventos Colombia 2020 - Todos los derechos reservados</h5>

                                                    </div>
                                    </div>	
                            </div>
                    </div>
                </div>
            </section>
	</div>
    </body>
</html>
