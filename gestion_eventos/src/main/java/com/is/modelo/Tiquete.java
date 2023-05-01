
package com.is.modelo;

import java.util.ArrayList;


public class Tiquete {
    private ArrayList <String> sillas;
    private ArrayList <Double> precios_sillas;
    private double precio_total; 
    private String usuario;

    public Tiquete(ArrayList<String> sillas, ArrayList<Double> precios_sillas, double precio_total, String usuario) {
        this.sillas = sillas;
        this.precios_sillas = precios_sillas;
        this.precio_total = precio_total;
        this.usuario = usuario;
    }
    
    public Tiquete(){
    
    }

    public ArrayList<String> getSillas() {
        return sillas;
    }

    public void setSillas(ArrayList<String> sillas) {
        this.sillas = sillas;
    }

    public ArrayList<Double> getPrecios_sillas() {
        return precios_sillas;
    }

    public void setPrecios_sillas(ArrayList<Double> precios_sillas) {
        this.precios_sillas = precios_sillas;
    }

    public double getPrecio_total() {
        return precio_total;
    }

    public void setPrecio_total(double precio_total) {
        this.precio_total = precio_total;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usario) {
        this.usuario = usario;
    }
    
    
    
}
