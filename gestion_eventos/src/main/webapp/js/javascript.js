                
		var bandera = false;
		
		var turno = 0;
		
		var tab = new Array();
		
		var turnoj1 = 0;
		var turnoj2 = 0;

		var coordenadaAnteriorj1 = "";
		var coordenadaAnteriorj2 = "";

		var coordenadaj1 = 0;
		var coordenadaj2 = 0;

		window.onload = function(){
			var iniciar = document.getElementById("iniciar");
		
			iniciar.addEventListener("click", comenzar);};

		function comenzar(){
				
				bandera = true;
				
				var jugador1 = document.getElementById("jugador1");
				var jugador2= document.getElementById("jugador2");                                
				
				if(jugador1.value===jugador2.value){
					alert("Advertencia, no pueden tener el mismo nombre");
					
				}
				else{
				if(jugador2.value===jugador1.value){
					alert("Advertencia,  no pueden tener el mismo nombre");
					
				}
				else{
					
					turnoj1 = 0;
					turnoj2 = 0;
					
					document.getElementById("resultado").innerHTML = " Juego en marcha. ";
					
					coordenadaAnteriorj1 = document.getElementById("coordenadajugador1tabla").innerHTML;
					coordenadaAnteriorj2 = document.getElementById("coordenadajugador2tabla").innerHTML;
					document.getElementById("coordenadajugador1tabla").innerHTML = " ";
					document.getElementById("coordenadajugador2tabla").innerHTML = " ";
					coordenadaAnteriorj1 = "";
					coordenadaAnteriorj2 = "";

					
					document.getElementById("jugador1tabla").innerHTML =  jugador1.value;
					document.getElementById("jugador2tabla").innerHTML =  jugador2.value;
					
					document.getElementById("turnojugador1tabla").innerHTML =  turnoj1;
					document.getElementById("turnojugador2tabla").innerHTML =  turnoj2;


					tab[0] = document.getElementById("b0");
					tab[1] = document.getElementById("b1");
					tab[2] = document.getElementById("b2");
					tab[3] = document.getElementById("b3");
					tab[4] = document.getElementById("b4");
					tab[5] = document.getElementById("b5");
					tab[6] = document.getElementById("b6");
					tab[7] = document.getElementById("b7");
					tab[8] = document.getElementById("b8");

					for(var i=0;i<9;i++){
						
						tab[i].className = "botonInicial";
						
						tab[i].value = "I";
					}
					turno = 1;
					document.getElementById("turnoJugador").innerHTML = "Turno del jugador:  " + jugador1.value;
					}
				}
			} 

			function colocar(boton){
				
				if(bandera===true){
					
					if(turno===1 && boton.value==="I"){
				                var jugador2= document.getElementById("jugador2");
						document.getElementById("turnoJugador").innerHTML = "Turno del jugador:  " + jugador2.value;
						
						turnoj1++;
						document.getElementById("turnojugador1tabla").innerHTML =  turnoj1;
						
						boton.value = "X";
						
						boton.className = "botonJugador1";

						coordenadaj1 = boton.id;
						coordenadaJuego();
					
						revisar();
						turno = 2;
					}else{
						if(turno===2 && boton.value==="I"){
							
                                                        var jugador1 = document.getElementById("jugador1");
				
							document.getElementById("turnoJugador").innerHTML = "Turno del jugador: " + jugador1.value;
							turnoj2++;
							document.getElementById("turnojugador2tabla").innerHTML =  turnoj2;
							
							boton.value = "O";
							
							boton.className = "botonJugador2";

							coordenadaj2 = boton.id;
							coordenadaJuego();
							turno = 1;
						}
						
						revisar();
					}
				}
				
		}

		function coordenadaJuego(){
				
				if (turno === 1){
					
							if(coordenadaj1 === "b0"){
								
								document.getElementById("coordenadajugador1tabla").innerHTML = coordenadaAnteriorj1 + "(1,1)";
								coordenadaAnteriorj1 = document.getElementById("coordenadajugador1tabla").innerHTML;	
							}
							if(coordenadaj1 === "b1"){
								document.getElementById("coordenadajugador1tabla").innerHTML = coordenadaAnteriorj1 + "(1,2)";
								coordenadaAnteriorj1 = document.getElementById("coordenadajugador1tabla").innerHTML;	
							}
							if(coordenadaj1 === "b2"){
								document.getElementById("coordenadajugador1tabla").innerHTML = coordenadaAnteriorj1 + "(1,3)";
								coordenadaAnteriorj1 = document.getElementById("coordenadajugador1tabla").innerHTML;	

							}
							if(coordenadaj1 === "b3"){
								document.getElementById("coordenadajugador1tabla").innerHTML = coordenadaAnteriorj1 + "(2,1)";
								coordenadaAnteriorj1 = document.getElementById("coordenadajugador1tabla").innerHTML;	

							}
							if(coordenadaj1 === "b4"){
								document.getElementById("coordenadajugador1tabla").innerHTML = coordenadaAnteriorj1 + "(2,2)";
								coordenadaAnteriorj1 = document.getElementById("coordenadajugador1tabla").innerHTML;	

							}
							if(coordenadaj1 === "b5"){
								document.getElementById("coordenadajugador1tabla").innerHTML = coordenadaAnteriorj1 + "(2,3)";
								coordenadaAnteriorj1 = document.getElementById("coordenadajugador1tabla").innerHTML;	

							}
							if(coordenadaj1 === "b6"){
									document.getElementById("coordenadajugador1tabla").innerHTML = coordenadaAnteriorj1 + "(3,1)";
									coordenadaAnteriorj1 = document.getElementById("coordenadajugador1tabla").innerHTML;	
							}
							if(coordenadaj1 === "b7"){
								document.getElementById("coordenadajugador1tabla").innerHTML = coordenadaAnteriorj1 + "(3,2)";
								coordenadaAnteriorj1 = document.getElementById("coordenadajugador1tabla").innerHTML;	
							}
							if(coordenadaj1 === "b8"){
								document.getElementById("coordenadajugador1tabla").innerHTML = coordenadaAnteriorj1 + "(3,3)";
								coordenadaAnteriorj1 = document.getElementById("coordenadajugador1tabla").innerHTML;	

							}
					
						}
				if(turno === 2){
						
							if(coordenadaj2 === "b0"){
								
								document.getElementById("coordenadajugador2tabla").innerHTML = coordenadaAnteriorj2 + "(1,1)";
								coordenadaAnteriorj2 = document.getElementById("coordenadajugador2tabla").innerHTML;	
							}
							if(coordenadaj2 === "b1"){
								document.getElementById("coordenadajugador2tabla").innerHTML = coordenadaAnteriorj2 + "(1,2)";
								coordenadaAnteriorj2 = document.getElementById("coordenadajugador2tabla").innerHTML;	
							}
							if(coordenadaj2 === "b2"){
								document.getElementById("coordenadajugador2tabla").innerHTML = coordenadaAnteriorj2 + "(1,3)";
								coordenadaAnteriorj2 = document.getElementById("coordenadajugador2tabla").innerHTML;	

							}
							if(coordenadaj2 === "b3"){
								document.getElementById("coordenadajugador2tabla").innerHTML = coordenadaAnteriorj2 + "(2,1)";
								coordenadaAnteriorj2 = document.getElementById("coordenadajugador2tabla").innerHTML;	

							}
							if(coordenadaj2 === "b4"){
								document.getElementById("coordenadajugador2tabla").innerHTML = coordenadaAnteriorj2 + "(2,2)";
								coordenadaAnteriorj2 = document.getElementById("coordenadajugador2tabla").innerHTML;	

							}
							if(coordenadaj2 === "b5"){
								document.getElementById("coordenadajugador2tabla").innerHTML = coordenadaAnteriorj2 + "(2,3)";
								coordenadaAnteriorj2 = document.getElementById("coordenadajugador2tabla").innerHTML;	

							}
							if(coordenadaj2 === "b6"){
								document.getElementById("coordenadajugador2tabla").innerHTML = coordenadaAnteriorj2 + "(3,1)";
								coordenadaAnteriorj2 = document.getElementById("coordenadajugador2tabla").innerHTML;	
							}
							if(coordenadaj2 === "b7"){
								document.getElementById("coordenadajugador2tabla").innerHTML = coordenadaAnteriorj2 + "(3,2)";
								coordenadaAnteriorj2 = document.getElementById("coordenadajugador2tabla").innerHTML;	
							}
							if(coordenadaj2 === "b8"){
								document.getElementById("coordenadajugador2tabla").innerHTML = coordenadaAnteriorj2 + "(3,3)";
								coordenadaAnteriorj2 = document.getElementById("coordenadajugador2tabla").innerHTML;	

							}
						}
		}
                var result = "";
                var jugador1="";
                var jugador2="";
                
			function revisar(){
				
				if((tab[0].value === "X" && tab[1].value === "X" && tab[2].value === "X") || (tab[3].value === "X" && tab[4].value === "X" && tab[5].value === "X") || (tab[6].value === "X" && tab[7].value === "X" && tab[8].value === "X") || (tab[0].value === "X" && tab[3].value === "X" && tab[6].value === "X") || (tab[1].value === "X" && tab[4].value === "X" && tab[7].value === "X") || (tab[2].value === "X" && tab[5].value === "X" && tab[8].value === "X") || (tab[0].value === "X" && tab[4].value === "X" && tab[8].value === "X") || (tab[2].value === "X" && tab[4].value === "X" && tab[6].value === "X"))
				{
                                 jugador1 = document.getElementById("jugador1");
		                 jugador2= document.getElementById("jugador2");
                                result= "El ganador es: "+jugador1.value;  
                                window.location.href= 'CargarHistorial?jugador1='+jugador1.value+'&jugador2='+jugador2.value+'&coordenadaj1='+coordenadaAnteriorj1+'&coordenadaj2='+coordenadaAnteriorj2+'&resultado='+result;
				bandera = false;
                                }
                               
				if((tab[0].value === "O" && tab[1].value === "O" && tab[2].value === "O") || (tab[3].value === "O" && tab[4].value === "O" && tab[5].value === "O") || (tab[6].value === "O" && tab[7].value === "O" && tab[8].value === "O") || (tab[0].value === "O" && tab[3].value === "O" && tab[6].value === "O") || (tab[1].value === "O" && tab[4].value === "O" && tab[7].value === "O") || (tab[2].value === "O" && tab[5].value === "O" && tab[8].value === "O") || (tab[0].value === "O" && tab[4].value === "O" && tab[8].value === "O") || (tab[2].value === "O" && tab[4].value === "O" && tab[6].value === "O"))
				{
                                jugador1 = document.getElementById("jugador1");
		                jugador2= document.getElementById("jugador2");
                                result= "El ganador es: "+jugador2.value;   
                                window.location.href= 'CargarHistorial?jugador1='+jugador1.value+'&jugador2='+jugador2.value+'&coordenadaj1='+coordenadaAnteriorj1+'&coordenadaj2='+coordenadaAnteriorj2+'&resultado='+result;
                                bandera = false;
                                }
                               
				if(tab[0].value !== "I" && tab[1].value !== "I" && tab[2].value !== "I" && tab[3].value !== "I" && tab[4].value !== "I" && tab[5].value !== "I" && tab[6].value !== "I" && tab[7].value !== "I" && tab[8].value !== "I" && bandera === true){				
                                     jugador1 = document.getElementById("jugador1");
		                     jugador2= document.getElementById("jugador2");
                                    result= "EMPATE ";
                                    window.location.href= 'CargarHistorial?jugador1='+jugador1.value+'&jugador2='+jugador2.value+'&coordenadaj1='+coordenadaAnteriorj1+'&coordenadaj2='+coordenadaAnteriorj2+'&resultado='+result;
				    bandera = false;
                            
                                }
                                
			}//fin funcion revisar


