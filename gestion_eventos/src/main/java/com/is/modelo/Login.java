package com.is.modelo;

public class Login {
    private int id;
    private String usuario;
    private String tipo;
    private String password;
    private String id_persona;
    
    public Login(){}

    public Login(String usuario, String tipo, String password, String id_persona) {
        this.id = 0;
        this.usuario = usuario;
        this.tipo = tipo;
        this.password = password;
        this.id_persona = id_persona;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getId_persona() {
        return id_persona;
    }

    public void setId_persona(String id_persona) {
        this.id_persona = id_persona;
    }
    
    
}
