package com.is.modelo;

import com.is.database.BaseDatos;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LoginDAO implements Validar {

    Connection con;
    //BaseDatos cn= new BaseDatos();
    PreparedStatement ps;
    ResultSet rs;

   

    @Override
    public int validar(Login login) {
         int r = 0;
        String sql = "select * from gestioneventos.login where usuario=? AND password=?";
        try {
            con = BaseDatos.getConecction();
            ps = con.prepareStatement(sql);
            ps.setString(1, login.getUsuario());
            ps.setString(2, login.getPassword());
            rs = ps.executeQuery();
            while (rs.next()) {
                r = r + 1;
                login.setUsuario(rs.getString("usuario"));
                login.setPassword(rs.getString("password"));
            }
            if (r == 1) {
                return 1;
            } else {
                return 0;
            }

        } catch (Exception e) {
            return 0;
        }
    }
    public int validadAdmin(Login login){
         int r = 0;
        String sql = "select * from gestioneventos.login where usuario=? AND password=? AND tipo ='admin\'";
        try {
            con = BaseDatos.getConecction();
            ps = con.prepareStatement(sql);
            ps.setString(1, login.getUsuario());
            ps.setString(2, login.getPassword());
            rs = ps.executeQuery();
            while (rs.next()) {
                r = r + 1;
                login.setUsuario(rs.getString("usuario"));
                login.setPassword(rs.getString("password"));
            }
            if (r == 1) {
                return 1;
            } else {
                return 0;
            }

        } catch (Exception e) {
            return 0;
        }
        
    
    }

}
