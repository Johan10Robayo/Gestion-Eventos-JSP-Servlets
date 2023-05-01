package com.is.modelo;

public class Funcion {

    private int id;
    private String fecha;
    private String hora;
    private int id_login;
    private int id_recinto;
    private int id_silla;
    private int id_evento;
    

    public Funcion() {
    }

    public Funcion(int id, String fecha, String hora, int id_login, int id_recinto, int id_silla, int id_evento) {
        this.id = id;
        this.fecha = fecha;
        this.hora = hora;
        this.id_login = id_login;
        this.id_recinto = id_recinto;
        this.id_silla = id_silla;
        this.id_evento = id_evento;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public int getId_login() {
        return id_login;
    }

    public void setId_login(int id_login) {
        this.id_login = id_login;
    }

    public int getId_recinto() {
        return id_recinto;
    }

    public void setId_recinto(int id_recinto) {
        this.id_recinto = id_recinto;
    }

    public int getId_silla() {
        return id_silla;
    }

    public void setId_silla(int id_silla) {
        this.id_silla = id_silla;
    }

    public int getId_evento() {
        return id_evento;
    }

    public void setId_evento(int id_evento) {
        this.id_evento = id_evento;
    }

}
