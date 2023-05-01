package com.is.modelo;

public class Recinto {
    private int id;
    private String nombre;
    private String tipo;

    public Recinto(String nombre, String tipo) {
        this.id = 0;
        this.nombre = nombre;
        this.tipo = tipo;
    }
    public Recinto(int id,String nombre, String tipo) {
        this.id = id;
        this.nombre = nombre;
        this.tipo = tipo;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }
    
    
    
}
