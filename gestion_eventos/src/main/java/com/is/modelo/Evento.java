
package com.is.modelo;

public class Evento {
    private int id;
    private String nombre;
    private String tematica;
    private String precio;
    private int duracion;
    private String reparto;
    private String director;
    private String descripcion;
    private String poster;
    
    public Evento(){}

    public Evento(int id, String nombre, String tematica, String precio, int duracion, String reparto, String director, String descripcion, String poster) {
        this.id = id;
        this.nombre = nombre;
        this.tematica = tematica;
        this.precio = precio;
        this.duracion = duracion;
        this.reparto = reparto;
        this.director = director;
        this.descripcion = descripcion;
        this.poster = poster;
    }

    public String getPoster() {
        return poster;
    }

    public void setPoster(String poster) {
        this.poster = poster;
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

    public String getTematica() {
        return tematica;
    }

    public void setTematica(String tematica) {
        this.tematica = tematica;
    }

    public String getPrecio() {
        return precio;
    }

    public void setPrecio(String precio) {
        this.precio = precio;
    }

    public int getDuracion() {
        return duracion;
    }

    public void setDuracion(int duracion) {
        this.duracion = duracion;
    }

    public String getReparto() {
        return reparto;
    }

    public void setReparto(String reparto) {
        this.reparto = reparto;
    }

    public String getDirector() {
        return director;
    }

    public void setDirector(String director) {
        this.director = director;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
    
    
}
