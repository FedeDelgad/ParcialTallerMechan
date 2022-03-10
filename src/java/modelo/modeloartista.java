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
public class modeloartista {
    cado cd = new cado();
    Connection cn;
    PreparedStatement pst;
    ResultSet rs;
    
    /*listar artistas */
      public List listar(){
        String sql = "select * from artista";
        ArrayList<artista> lista = new ArrayList();
        try{
            pst = cd.getCn().prepareStatement(sql);
            rs = cd.recuperar(sql);
            while(rs.next()){
                artista ar = new artista();
                ar.setIdartista(rs.getInt("idartista"));
                ar.setNombreartista(rs.getString("nombreartista"));
                
                lista.add(ar);
            }
            return lista;
        }catch(SQLException e){
            return null;
        }
    } 
    
     /*agregar artistas */
      
       public String insertar(artista ar){
        String mensaje;
        try{
            String sql ="insert into artista(nombreartista, idgrupo) value(?,?)";
            pst = cd.getCn().prepareStatement(sql);
            pst.setString(1, ar.getNombreartista());
            pst.setInt(2,ar.getIdgrupo().getIdgrupo() );
            pst.executeUpdate();
            mensaje = "Registro correcto";
        }catch(SQLException e){
            mensaje = "Error";
        }
        return mensaje;
    }
     
       /*listar artista con su grupo*/
       
     public List listargrupos(){
        String sql = "select artista.idartista,grupo.nombregrupo, artista.nombreartista from grupo inner join artista on grupo.idgrupo=artista.idgrupo";
        ArrayList<artista> lista = new ArrayList();
        try{
            pst = cd.getCn().prepareStatement(sql);
            rs = cd.recuperar(sql);
            while(rs.next()){
                artista ar = new artista();
                grupo gru=new grupo();
                ar.setIdartista(rs.getInt("idartista"));
                ar.setNombreartista(rs.getString("nombreartista"));
                gru.setNombregrupo(rs.getString("nombregrupo"));
                ar.setIdgrupo(gru);
                
                lista.add(ar);
            }
            return lista;
        }catch(SQLException e){
            return null;
        }
    } 
     
     
     
     
     
     
     
     
    
     /*modificar artista*/
     
         public String modificar(artista ar){
        String mensaje;
        try{
            String sql = "update artista set nombreartista=? where idartista =?";
            pst = cd.getCn().prepareStatement(sql);
            pst.setString(1,ar.getNombreartista());
            pst.setInt(2, ar.getIdartista());
            pst.executeUpdate();
            mensaje = "Modificado correctamente";
        }catch(SQLException e){
            mensaje = "Error";
        }
        return mensaje;
    } 
    
}
