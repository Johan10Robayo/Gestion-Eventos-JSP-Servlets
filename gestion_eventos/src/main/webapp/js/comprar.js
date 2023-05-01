cadena_sillas="";
function pintar(e){
    var usuario = document.getElementById("usuario").textContent;
    var id_silla=this.id;
    var clase_silla=this.className;
    var cod_evento = document.getElementById("cod_evento").value;
    var nombre_recinto = document.getElementById("nombre_recinto").textContent;
    var sillas = document.getElementById("sillas").value;
    
    //console.log(id_silla);
    if(clase_silla==="desocupada" && usuario !== "Inicie sesion" && usuario !== "null"){
        document.getElementById(id_silla).innerHTML="<img  src='imagenes/comprar_puesto.png'>";
        cadena_sillas=cadena_sillas+id_silla+";";
    }
    else if(clase_silla==="ocupada"){
         alert("La silla que elegiste está ocupada");
    }
    
    else{
        alert("Debe iniciar sesión");
        window.location.href='Login.jsp?nombrerecinto='+nombre_recinto+'&cod_evento='+cod_evento+'&sillas='+sillas ;
    }
    
    //console.log(clase_silla);
    
    //animals.push('cows');
}

function comprar (){

    if(cadena_sillas.length>0){
       var fecha =document.getElementById("fecha_funcion").textContent;
       var hora = document.getElementById("hora_funcion").textContent;
       var nombre_recinto=document.getElementById("nombre_recinto").textContent;
       var nombre_evento=document.getElementById("nombre_evento").textContent;
        window.location.href='info_compras.jsp?puestos_comprados='+cadena_sillas+
                "&fecha="+fecha+"&hora="+hora+"&nombre_recinto="+nombre_recinto+
                "&nombre_evento="+nombre_evento;
    }else{
        alert("Haz una compra");
    }
     
    
}

(function escucha_eventos(){
				tds= document.querySelectorAll('#tabla_sillas td');
                          
				console.log(tds);
				tds.forEach(function(td){
					td.addEventListener('click',pintar);
					
				});
		}())