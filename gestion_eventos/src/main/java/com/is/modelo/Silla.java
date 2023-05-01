package com.is.modelo;

public class Silla {
    private int id;
    private String estado;
    private String posicion;

    public Silla(int id, String estado, String posicion) {
        this.id = id;
        this.estado = estado;
        this.posicion = posicion;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getPosicion() {
        return posicion;
    }

    public void setPosicion(String posicion) {
        this.posicion = posicion;
    }
    
    
}
