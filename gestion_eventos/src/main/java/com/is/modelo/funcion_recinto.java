
package com.is.modelo;

import com.is.modelo.Silla;
import java.util.ArrayList;


public class funcion_recinto {
    private String nombre_recinto;
    private String nombre_evento;
    private String tipo_recinto;
    private String fecha;
    private String hora;
    private ArrayList<Silla> sillas ;

    public funcion_recinto(String nombre_recinto, String nombre_evento, String tipo_recinto, String fecha, String hora, ArrayList<Silla> nombreArrayList) {
        this.nombre_recinto = nombre_recinto;
        this.nombre_evento = nombre_evento;
        this.tipo_recinto = tipo_recinto;
        this.fecha = fecha;
        this.hora = hora;
        this.sillas = nombreArrayList;
    }
   
    public funcion_recinto() {
        this.nombre_recinto = "";
        this.nombre_evento ="";
        this.tipo_recinto ="";
        this.fecha = "";
        this.hora = "";
        this.sillas = null;
    }

    public String getNombre_recinto() {
        return nombre_recinto;
    }

    public void setNombre_recinto(String nombre_recinto) {
        this.nombre_recinto = nombre_recinto;
    }

    public String getNombre_evento() {
        return nombre_evento;
    }

    public void setNombre_evento(String nombre_evento) {
        this.nombre_evento = nombre_evento;
    }

    public String getTipo_recinto() {
        return tipo_recinto;
    }

    public void setTipo_recinto(String tipo_recinto) {
        this.tipo_recinto = tipo_recinto;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getHora() {
        return hora;
    }

    public void setHora(String hora) {
        this.hora = hora;
    }

    public ArrayList<Silla> getSillas() {
        return sillas;
    }

    public void setSillas(ArrayList<Silla> sillas) {
        this.sillas = sillas;
    }
    
    
}


