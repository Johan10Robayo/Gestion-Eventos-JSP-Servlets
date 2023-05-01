package com.is.database;

import com.is.modelo.Evento;
import com.is.modelo.Funcion;
import com.is.modelo.Login;
import com.is.modelo.Persona;
import com.is.modelo.Recinto;
import com.is.modelo.Silla;
import com.is.modelo.Tiquete;
import com.is.modelo.Usuario;
import com.is.modelo.funcion_recinto;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;
//import sun.util.logging.PlatformLogger;

public class MisConsultas {

    public Collection<Evento> consultaEventoTeatro() {
        PreparedStatement pstatement = null;
        ResultSet resultSet = null;

        String sql = "SELECT DISTINCT tv.id,tv.nombre,tv.tematica,tv.precio,tv.duracion,tv.reparto,tv.director,tv.descripcion,tv.poster FROM gestioneventos.evento as tv INNER JOIN gestioneventos.funcion as fun ON tv.id=fun.id_evento INNER JOIN gestioneventos.recinto as recin ON fun.id_recinto=recin.id WHERE recin.tipo='Teatro'";
        Vector<Evento> listado = new Vector<Evento>();
        try {
            Connection conne = BaseDatos.getConecction();
            pstatement = conne.prepareStatement(sql);
            resultSet = pstatement.executeQuery();
            while (resultSet.next()) {

                Evento evento = new Evento(resultSet.getInt(1), resultSet.getString(2), resultSet.getString(3), resultSet.getString(4), resultSet.getInt(5), resultSet.getString(6), resultSet.getString(7), resultSet.getString(8), resultSet.getString(9));
                listado.add(evento);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Evento.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listado;

    }

    public Collection<Evento> consultaEventoAuditorio() {
        PreparedStatement pstatement = null;
        ResultSet resultSet = null;

        String sql = "SELECT DISTINCT tv.id,tv.nombre,tv.tematica,tv.precio,tv.duracion,tv.reparto,tv.director,tv.descripcion,tv.poster FROM gestioneventos.evento as tv INNER JOIN gestioneventos.funcion as fun ON tv.id=fun.id_evento INNER JOIN gestioneventos.recinto as recin ON fun.id_recinto=recin.id WHERE recin.tipo='Auditorio'";
        Vector<Evento> listado = new Vector<Evento>();
        try {
            Connection conne = BaseDatos.getConecction();
            pstatement = conne.prepareStatement(sql);
            resultSet = pstatement.executeQuery();
            while (resultSet.next()) {

                Evento evento = new Evento(resultSet.getInt(1), resultSet.getString(2), resultSet.getString(3), resultSet.getString(4), resultSet.getInt(5), resultSet.getString(6), resultSet.getString(7), resultSet.getString(8), resultSet.getString(9));
                listado.add(evento);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Evento.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listado;

    }
    

    public Collection<Evento> consultaEventoTeatro(int id) {
        PreparedStatement pstatement = null;
        ResultSet resultSet = null;

        String sql = "SELECT * FROM gestioneventos.evento where id =" + id;
        Vector<Evento> listado = new Vector<Evento>();
        try {
            Connection conne = BaseDatos.getConecction();
            pstatement = conne.prepareStatement(sql);
            resultSet = pstatement.executeQuery();
            while (resultSet.next()) {
                Evento evento = new Evento(resultSet.getInt(1), resultSet.getString(2), resultSet.getString(3), resultSet.getString(4), resultSet.getInt(5), resultSet.getString(6), resultSet.getString(7), resultSet.getString(8), resultSet.getString(9));
                listado.add(evento);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Evento.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listado;
    }

    public Collection<Funcion> consultaCrearFuncion(int id) {
        PreparedStatement pstatement = null;
        ResultSet resultSet = null;

        String sql = "SELECT DISTINCT * FROM gestioneventos.funcion where id_evento =" + id;
        Vector<Funcion> listado = new Vector<Funcion>();
        try {
            Connection conne = BaseDatos.getConecction();
            pstatement = conne.prepareStatement(sql);
            resultSet = pstatement.executeQuery();
            while (resultSet.next()) {
                Funcion funcion = new Funcion(resultSet.getInt(1), resultSet.getString(2), resultSet.getString(3), resultSet.getInt(4), resultSet.getInt(5), resultSet.getInt(6), resultSet.getInt(7));
                listado.add(funcion);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Funcion.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listado;
    }

    public Collection<Recinto> consultaCrearRecinto(int id) {
        PreparedStatement pstatement = null;
        ResultSet resultSet = null;

        String sql = "SELECT DISTINCT recinto.id, recinto.nombre, recinto.tipo FROM funcion JOIN recinto \n"
                + "ON recinto.id = funcion.id_recinto WHERE funcion.id_evento =" + id;
        Vector<Recinto> listado = new Vector<Recinto>();
        try {
            Connection conne = BaseDatos.getConecction();
            pstatement = conne.prepareStatement(sql);
            resultSet = pstatement.executeQuery();
            while (resultSet.next()) {
                Recinto recinto = new Recinto(resultSet.getInt(1), resultSet.getString(2), resultSet.getString(3));
                listado.add(recinto);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Recinto.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listado;
    }

    public funcion_recinto obtener_info_funcion_evento(int id_evento, String nombre_recinto) {

        PreparedStatement pstatement = null;
        ResultSet resultSet = null;
        String sql = " select  recinto.nombre,evento.nombre, recinto.tipo,funcion.fecha,funcion.hora,silla.estado,silla.posicion,silla.id";
        sql = sql + " from funcion join evento on evento.id=funcion.id_evento ";
        sql = sql + " join recinto on recinto.id=funcion.id_recinto ";
        sql = sql + " join  silla on silla.id=funcion.id_silla ";
        sql = sql + " where evento.id=" + id_evento + " and recinto.nombre='" + nombre_recinto + "' and silla.estado='ocupada'";

        funcion_recinto func1 = new funcion_recinto();
        ArrayList<Silla> sillas = new ArrayList<Silla>();

        int cont = 0;
        try {
            Connection conne = BaseDatos.getConecction();
            pstatement = conne.prepareStatement(sql);
            resultSet = pstatement.executeQuery();
            while (resultSet.next()) {
                if (cont == 0) {
                    func1.setNombre_recinto(resultSet.getString(1));
                    func1.setNombre_evento(resultSet.getString(2));
                    func1.setTipo_recinto(resultSet.getString(3));
                    func1.setFecha(resultSet.getString(4));
                    func1.setHora(resultSet.getString(5));
                    cont++;
                }

                Silla silla = new Silla(resultSet.getInt(8), resultSet.getString(6), resultSet.getString(7));
                sillas.add(silla);

            }
            func1.setSillas(sillas);

        } catch (SQLException ex) {
            Logger.getLogger(Persona.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("error :(" + ex.getMessage());
        }
        return func1;
    }

    public int consultar_id_recinto(String nombre_recinto) {

        PreparedStatement pstatement = null;
        ResultSet resultSet = null;
        String sql = "select id from recinto where nombre='" + nombre_recinto + "'";
        int id_recinto = 0;
        try {
            Connection conne = BaseDatos.getConecction();
            pstatement = conne.prepareStatement(sql);
            resultSet = pstatement.executeQuery();
            while (resultSet.next()) {
                id_recinto = resultSet.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Persona.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("error :(" + ex.getMessage());
        }

        return id_recinto;
    }

    public int consultar_id_evento(String nombre_evento) {

        PreparedStatement pstatement = null;
        ResultSet resultSet = null;
        String sql = "select id from evento where nombre='" + nombre_evento + "'";
        int id_evento = 0;
        try {
            Connection conne = BaseDatos.getConecction();
            pstatement = conne.prepareStatement(sql);
            resultSet = pstatement.executeQuery();
            while (resultSet.next()) {
                id_evento = resultSet.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Persona.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("error :(" + ex.getMessage());
        }

        return id_evento;
    }

    public boolean crear_silla(String posicion) throws SQLException {
        int res = 0;
        Connection conne = BaseDatos.getConecction();
        PreparedStatement pstatement = null;
        ResultSet resultSet = null;

        String sql = "insert into silla (estado,posicion) values ("
                + "'ocupada'," + "'" + posicion + "')";
        pstatement = conne.prepareStatement(sql);
        res = pstatement.executeUpdate();
        System.out.println("res=" + res);
        try {
            if (res == 1) {
                conne.commit();
                return true;
            } else {
                System.out.println("error al insertar...");
                conne.rollback();
                return false;

            }
        } catch (SQLException ex) {
            conne.rollback();
            return false;
        }
    }

    public int consultar_id_silla() {

        PreparedStatement pstatement = null;
        ResultSet resultSet = null;
        String sql = "SELECT distinct LAST_INSERT_ID() from silla";
        int id_silla = 0;
        try {
            Connection conne = BaseDatos.getConecction();
            pstatement = conne.prepareStatement(sql);
            resultSet = pstatement.executeQuery();
            while (resultSet.next()) {
                id_silla = resultSet.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Persona.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("error :(" + ex.getMessage());
        }

        return id_silla;
    }

    public ArrayList<Integer> ids_sillas(String[] array_posiciones_sillas) {
        ArrayList<Integer> ids_sillas = new ArrayList<Integer>();
        int id_silla = 0;
        try {
            for (int i = 0; i < array_posiciones_sillas.length; i++) {
                crear_silla(array_posiciones_sillas[i]);
                id_silla = consultar_id_silla();
                ids_sillas.add(id_silla);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }

        return ids_sillas;
    }

    public boolean crear_tiquete(String fecha, String hora, int id_login, int id_recinto, int id_silla, int id_evento, String tipo_descuento) throws SQLException {
        int res = 0;
        Connection conne = BaseDatos.getConecction();
        PreparedStatement pstatement = null;
        ResultSet resultSet = null;

        String sql = "insert into funcion (fecha,hora,id_login,id_recinto,id_silla,id_evento,valor) values ("
                + "'" + fecha + "'," + "'" + hora + "'," + id_login + "," + id_recinto + "," + id_silla + "," + id_evento + ","
                + "(select evento.precio from evento where evento.id=" + id_evento + ")-(select evento.precio from"
                + " evento where evento.id=" + id_evento + ")*"
                + "(select descuento.porcentaje from descuento where descuento.nombre='" + tipo_descuento + "')"
                + ")";
        pstatement = conne.prepareStatement(sql);
        res = pstatement.executeUpdate();
        System.out.println("res=" + res);
        try {
            if (res == 1) {
                conne.commit();
                return true;
            } else {
                System.out.println("error al insertar...");
                conne.rollback();
                return false;

            }
        } catch (SQLException ex) {
            conne.rollback();
            return false;
        }
    }

    public String consulta_tipo_usuario(int id_usuario) {
        String tipo = "";
        PreparedStatement pstatement = null;
        ResultSet resultSet = null;
        String sql = "select login.tipo from login where login.id=" + id_usuario;
        try {
            Connection conne = BaseDatos.getConecction();
            pstatement = conne.prepareStatement(sql);
            resultSet = pstatement.executeQuery();
            while (resultSet.next()) {
                tipo = resultSet.getString(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Persona.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("error :(" + ex.getMessage());
        }
        return tipo;
    }

    public Tiquete consultar_tiquete(int id_silla, int id_login, Tiquete tiquete) {
        PreparedStatement pstatement = null;
        ResultSet resultSet = null;
        String sql = "select silla.posicion,funcion.valor,login.usuario from funcion join silla on silla.id=funcion.id_silla "
                + "join login on login.id=funcion.id_login where silla.id=" + id_silla + " and login.id=" + id_login;

        Tiquete tiquete_final = new Tiquete();
        try {
            ArrayList<String> sillas = null;
            ArrayList<Double> precios = null;
            String posicion = "";
            double valor;
            String usuario = "";

            if (tiquete == null) {
                ArrayList<String> sillas1 = new ArrayList<String>();
                ArrayList<Double> precios1 = new ArrayList<Double>();
                sillas = sillas1;
                precios = precios1;
            } else {
                ArrayList<String> sillas2 = tiquete.getSillas();
                ArrayList<Double> precios2 = tiquete.getPrecios_sillas();
                sillas = sillas2;
                precios = precios2;
            }

            try {
                Connection conne = BaseDatos.getConecction();
                pstatement = conne.prepareStatement(sql);
                resultSet = pstatement.executeQuery();
                while (resultSet.next()) {
                    posicion = resultSet.getString(1);
                    valor = resultSet.getDouble(2);
                    usuario = resultSet.getString(3);
                    sillas.add(posicion);
                    precios.add(valor);
                
                }
                tiquete_final.setPrecios_sillas(precios);
                tiquete_final.setSillas(sillas);
                tiquete_final.setUsuario(usuario);

            } catch (SQLException ex) {
                Logger.getLogger(Persona.class.getName()).log(Level.SEVERE, null, ex);
                System.out.println("error :(" + ex.getMessage());
            }

        } catch (Exception ex) {
            Logger.getLogger(Persona.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("error :(" + ex.getMessage());
        }

        return tiquete_final;
    }

    //int id_silla, int id_login, Tiquete tiquete
    public Tiquete generar_tiquete(ArrayList<Integer> ids_sillas, int id_login) {
        Tiquete tiquete_total = new Tiquete();
        try {
            Tiquete tiquete_actual = null;
            Tiquete tiquete_anterior = null;
            for (int i = 0; i < ids_sillas.size(); i++) {
                if (i == 0) {
                    tiquete_anterior = consultar_tiquete(ids_sillas.get(i), id_login, tiquete_actual);

                } else {
                    tiquete_actual = consultar_tiquete(ids_sillas.get(i), id_login, tiquete_anterior);
                    tiquete_anterior = tiquete_actual;
                }

            }

            double precio_total = 0;
            ArrayList<Double> precios = new ArrayList<Double>();
            if (tiquete_actual == null) {
                tiquete_actual = tiquete_anterior;
                precios = tiquete_actual.getPrecios_sillas();
            } else {
                precios = tiquete_actual.getPrecios_sillas();
            }

            for (int i = 0; i < precios.size(); i++) {
                precio_total = precio_total + precios.get(i);
            }

            tiquete_actual.setPrecio_total(precio_total);
            tiquete_total = tiquete_actual;
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

        return tiquete_total;
    }

    public boolean generar_compra(String fecha, String hora, int id_login, int id_recinto, ArrayList<Integer> ids_sillas, int id_evento) {
//String fecha, String hora, int id_login,int id_recinto,int id_silla,int id_evento,String tipo_descuento
        boolean bandera = false;

        try {
            String tipo_usuario = consulta_tipo_usuario(id_login);
            if (tipo_usuario.compareTo("vip") == 0) {
                for (int i = 0; i < ids_sillas.size(); i++) {
                    bandera = crear_tiquete(fecha, hora, id_login, id_recinto, ids_sillas.get(i), id_evento, "descuento_vip");

                }

            } else {
                for (int i = 0; i < ids_sillas.size(); i++) {
                    bandera = crear_tiquete(fecha, hora, id_login, id_recinto, ids_sillas.get(i), id_evento, "sin_descuento");

                }

            }
        } catch (Exception ex) {
            System.out.println(ex.getMessage());

        }

        return bandera;
    }
    
    public int consultaIdUsuario(String user){
        int id=0;
        PreparedStatement pstatement = null;
        ResultSet resultSet = null;
        String sql = "SELECT id FROM gestioneventos.login where usuario='"+user+"'";
    
        try {
            Connection conne = BaseDatos.getConecction();
            pstatement = conne.prepareStatement(sql);
            resultSet = pstatement.executeQuery();
            while (resultSet.next()) {
                id = resultSet.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("error :(" + ex.getMessage());
        }
        return id;
    
    }
    
    
    
    
    
    
    
    
    
    
    
    
    public Collection<Recinto> consultaRecinto() {
        PreparedStatement pstatement = null;
        ResultSet resultSet = null;

        String sql = "SELECT * FROM recinto";
        Vector<Recinto> listado = new Vector<Recinto>();
        try {
            Connection conne = BaseDatos.getConecction();
            pstatement = conne.prepareStatement(sql);
            resultSet = pstatement.executeQuery();
            while (resultSet.next()) {

                Recinto recinto = new Recinto(resultSet.getInt(1), resultSet.getString(2), resultSet.getString(3));
                listado.add(recinto);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Recinto.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listado;

    }
    
    public Collection<Usuario> consultaUsuario() {
        PreparedStatement pstatement = null;
        ResultSet resultSet = null;

        String sql = "SELECT * FROM persona JOIN login ON persona.numero_documento = login.id_persona;";
        Vector<Usuario> listado = new Vector<Usuario>();
        try {
            Connection conne = BaseDatos.getConecction();
            pstatement = conne.prepareStatement(sql);
            resultSet = pstatement.executeQuery();
            while (resultSet.next()) {

                Usuario usuario = new Usuario(resultSet.getString(1), resultSet.getString(2), resultSet.getString(3), resultSet.getString(4), resultSet.getString(5), resultSet.getString(7), resultSet.getString(8), resultSet.getString(9));
                usuario.setId(Integer.parseInt(resultSet.getString(6)));
                listado.add(usuario);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Usuario.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listado;

    }
    
    
    
    
    
    
    
    
    
    public int consulta_recinto(String nombre){
        PreparedStatement pstatement = null;
        ResultSet resultSet = null;
        String sql = "SELECT id from recinto where nombre='"+nombre+"'";
        int id_recinto = 0;
        try {
            Connection conne = BaseDatos.getConecction();
            pstatement = conne.prepareStatement(sql);
            resultSet = pstatement.executeQuery();
            while (resultSet.next()) {
                id_recinto = resultSet.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Persona.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("error :(" + ex.getMessage());
        }

        return id_recinto;
    }
    
    public boolean insertar_evento(String nombre, String tematica,double precio, int duracion,String reparto,String director, String descripcion,String poster) throws SQLException{
        boolean insercion=false;
        int res = 0;
        Connection conne = BaseDatos.getConecction();
        PreparedStatement pstatement = null;
        ResultSet resultSet = null;
        String sql="insert into evento(nombre,tematica,precio,duracion,reparto,director,descripcion,poster) values("
                + "'"+nombre+"','"+tematica+"',"+precio+","+duracion+",'"+reparto+"','"+director+"','"+descripcion+"','"
                +poster+"')";
        pstatement = conne.prepareStatement(sql);
        res = pstatement.executeUpdate();
        System.out.println("res=" + res);
        try {
            if (res == 1) {
                conne.commit();
                insercion= true;
            } else {
                System.out.println("error al insertar...");
                conne.rollback();
                return insercion;

            }
        } catch (SQLException ex) {
            conne.rollback();
            
        }
    
        return insercion;
    }
    
    public int consulta_id_evento(){
        PreparedStatement pstatement = null;
        ResultSet resultSet = null;
        String sql = "SELECT distinct LAST_INSERT_ID() from evento";
        int id_evento = 0;
        try {
            Connection conne = BaseDatos.getConecction();
            pstatement = conne.prepareStatement(sql);
            resultSet = pstatement.executeQuery();
            while (resultSet.next()) {
                id_evento = resultSet.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Persona.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("error :(" + ex.getMessage());
        }

        return id_evento;
    
    }
    
    
    
    public boolean insertar_funcion(String fecha, String hora,int id_login,int id_recinto,int id_silla,int id_evento,int valor) throws SQLException{
    boolean insercion=false;
        int res = 0;
        Connection conne = BaseDatos.getConecction();
        PreparedStatement pstatement = null;
        ResultSet resultSet = null;
        String sql="insert into funcion(fecha,hora,id_login,id_recinto,id_silla,id_evento,valor) values("
                + "'"+fecha+"','"+hora+"',"+id_login+","+id_recinto+","+id_silla+","+id_evento+","
                +valor+")";
        pstatement = conne.prepareStatement(sql);
        res = pstatement.executeUpdate();
        System.out.println("res=" + res);
        try {
            if (res == 1) {
                conne.commit();
                insercion= true;
            } else {
                System.out.println("error al insertar...");
                conne.rollback();
                insercion=false;

            }
        } catch (SQLException ex) {
            conne.rollback();
            insercion=false;
        }
    
        return insercion;
    }
    
    
    public ArrayList<String> listas_recintos(){
        ArrayList<String> recintos =new ArrayList<String>();
        PreparedStatement pstatement = null;
        ResultSet resultSet = null;
        String sql = "select nombre,tipo from recinto";
        
        try {
            Connection conne = BaseDatos.getConecction();
            pstatement = conne.prepareStatement(sql);
            resultSet = pstatement.executeQuery();
            while (resultSet.next()) {
                recintos.add(resultSet.getString(1)+"-"+resultSet.getString(2));
            }
        } catch (SQLException ex) {
            Logger.getLogger(Persona.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("error :(" + ex.getMessage());
        }

        
        
    
         return recintos;
    }
    
    public Collection<Evento> consultaEvento() {
        PreparedStatement pstatement = null;
        ResultSet resultSet = null;

        String sql = "select * from evento";
        Vector<Evento> listado = new Vector<Evento>();
        try {
            Connection conne = BaseDatos.getConecction();
            pstatement = conne.prepareStatement(sql);
            resultSet = pstatement.executeQuery();
            while (resultSet.next()) {

                Evento evento = new Evento(resultSet.getInt(1), resultSet.getString(2), resultSet.getString(3),
                       String.valueOf(resultSet.getDouble(4)),resultSet.getInt(5),resultSet.getString(6),resultSet.getString(7),
                        resultSet.getString(8),resultSet.getString(9));
                listado.add(evento);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Evento.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listado;

    }
    
    public boolean actualizar_evento(int id_anterior,int id_evento_actualizar,String nombre,String tematica,double precio, int duracion,
            String reparto,String director, String descripcion) throws SQLException{
         boolean actualizacion=false;
         int res=0;
        Connection conne=BaseDatos.getConecction();
        PreparedStatement pstatement=null;
        ResultSet resultSet = null;
         String sql="UPDATE evento set id="+id_evento_actualizar+", nombre='"+nombre+"', tematica='"+tematica+"',"+
                 "precio="+precio+", duracion="+duracion+", reparto='"+reparto+"', director='"+director+"',"+
                 "descripcion='"+descripcion+"' where id="+id_anterior;
         
         
         pstatement=conne.prepareStatement(sql);
         res=pstatement.executeUpdate();
         
         
         try {
                        if(res==1){
                            //confirmar la transacciòn
                            conne.commit();
                            actualizacion=true;
                        }else{
                            System.out.println("Error al eliminar...");
                            conne.rollback();
                            actualizacion=false;
                        }
                    } catch (SQLException ex) {
                        conne.rollback();
                        Logger.getLogger(Recinto.class.getName()).log(Level.SEVERE,null, ex);
                    }
    
        return actualizacion;
    }
    
    public boolean EliminarEvento(int id_evento) throws SQLException{
    boolean insercion=false;
    int res=0;
                   
                    
                    Connection conne=BaseDatos.getConecction();
                    PreparedStatement pstatement=null;
                    ResultSet resultSet = null;
                    String sql="";
                    
                    sql="DELETE FROM evento WHERE id="+id_evento;
                    pstatement=conne.prepareStatement(sql);
                     res=pstatement.executeUpdate();

                     try {
                        if(res==1){
                            //confirmar la transacciòn
                            conne.commit();
                            insercion=true;
                        }else{
                            System.out.println("Error al eliminar...");
                            conne.rollback();
                            insercion=false;
                        }
                    } catch (SQLException ex) {
                        conne.rollback();
                        Logger.getLogger(Recinto.class.getName()).log(Level.SEVERE,null, ex);
                    }
    
    
    return insercion;
    }
    
    

}


