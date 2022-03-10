/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import cado.cado;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author hp
 */
public class modelogenero {
    cado cd = new cado();
  Connection cn;
    PreparedStatement pst;
    ResultSet rs;
    
    /*Listar Genero*/
       public List listar(){
        String sql = "select *from genero";
        ArrayList<genero> lista = new ArrayList();
        try{
            pst = cd.getCn().prepareStatement(sql);
            rs = cd.recuperar(sql);
            while(rs.next()){
                genero ge = new genero();
                ge.setIdgenero(rs.getInt("idgenero"));
                ge.setGenero(rs.getString("genero"));
                
                lista.add(ge);
            }
            return lista;
        }catch(SQLException e){
            return null;
        }
    }   
    /*Ingresar Genero */
       
         public String insertar(genero ge){
        String mensaje;
        try{
            String sql ="insert into genero (genero) value(?);";
            pst = cd.getCn().prepareStatement(sql);
            pst.setString(1, ge.getGenero());
            pst.executeUpdate();
            mensaje = "Registro correcto";
        }catch(SQLException e){
            mensaje = "Error";
        }
        return mensaje;
    }
       
     /*Modificar Genero */
       public String modificar(genero ge){
        String mensaje;
        try{
            String sql = "update genero set genero=? where idgenero=?";
            pst = cd.getCn().prepareStatement(sql);
            pst.setString(1, ge.getGenero());
            pst.setInt(2, ge.getIdgenero());
            pst.executeUpdate();
            mensaje = "Modificado correctamente";
        }catch(SQLException e){
            mensaje = "Error";
        }
        return mensaje;
    }  
     
   /* Metodo Eliminar*/
       
    
       
}
