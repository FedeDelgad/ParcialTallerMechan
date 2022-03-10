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
public class modelogrupo {
   cado cd = new cado();
    Connection cn;
    PreparedStatement pst;
    ResultSet rs;
    
    /*listar por grupo*/
       public List listar(){
        String sql = "select *from grupo";
        ArrayList<grupo> lista = new ArrayList();
        try{
            pst = cd.getCn().prepareStatement(sql);
            rs = cd.recuperar(sql);
            while(rs.next()){
                grupo gru = new grupo();
                gru.setIdgrupo(rs.getInt("idgrupo"));
                gru.setNombregrupo(rs.getString("nombregrupo"));
                
                lista.add(gru);
            }
            return lista;
        }catch(SQLException e){
            return null;
        }    
    }

   /* Agregar un grupo*/
       
        public String insertar(grupo gru){
        String mensaje;
        try{
            String sql ="insert into grupo(nombregrupo) value(?)";
            pst = cd.getCn().prepareStatement(sql);
            pst.setString(1, gru.getNombregrupo());
          
            pst.executeUpdate();
            mensaje = "Registro correcto";
        }catch(SQLException e){
            mensaje = "Error";
        }
        return mensaje;
    }
       
   /* maximo de  grupos*/
   
     public String maxgrupo()
     {
         String maxgrupo="";
         String sql="select max(idgrupo) from grupo";
         
         try{
            pst = cd.getCn().prepareStatement(sql);
            rs = cd.recuperar(sql);
            while(rs.next()){
              maxgrupo=rs.getString(1);
            }
             
         }catch(SQLException e){
            maxgrupo="Error";  
         }
         
         return maxgrupo;
     }
        
     /*modificar grupo*/   
        
           public String modificar(grupo gru){
        String mensaje;
        try{
            String sql = "update grupo set nombregrupo=? where idgrupo=?";
            pst = cd.getCn().prepareStatement(sql);
            pst.setString(1, gru.getNombregrupo());
            pst.setInt(2, gru.getIdgrupo());
            pst.executeUpdate();
            mensaje = "Modificado correctamente";
        }catch(SQLException e){
            mensaje = "Error";
        }
        return mensaje;
    }  
        
        
}
