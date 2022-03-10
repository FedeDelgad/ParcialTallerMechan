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
public class modelocancion {
    cado cd = new cado();
    Connection cn;
    PreparedStatement pst;
    ResultSet rs;
    
       public String insertar(cancion can){
        String mensaje;
        try{
            String sql ="insert into canciones(nombrecancion,duracion,iddisco) value(?,?,?)";
            pst = cd.getCn().prepareStatement(sql);
            pst.setString(1, can.getNombrecancion());
            pst.setString(2, can.getDuracion());
            pst.setInt(3, can.getIddisco().getIddisco());
            pst.executeUpdate();
            mensaje = "Registro correcto";
        }catch(SQLException e){
            mensaje = "Error";
        }
        return mensaje;
    }
    
       public List listar( int iddisco){
        String sql = "select canciones.idcanciones,canciones.nombrecancion, canciones.duracion from canciones inner join disco on canciones.iddisco=disco.iddisco where disco.iddisco="+iddisco;
        ArrayList<cancion> lista = new ArrayList();
        try{
            pst = cd.getCn().prepareStatement(sql);
            rs = cd.recuperar(sql);
            while(rs.next()){
                cancion can = new cancion();
                can.setIdcanciones(rs.getInt("idcanciones"));
                can.setNombrecancion(rs.getString("nombrecancion"));
                can.setDuracion(rs.getString("duracion"));
                
                lista.add(can);
            }
            return lista;
        }catch(SQLException e){
            return null;
        }    
    }
       
       
       public String modificar(cancion can){
        String mensaje;
        try{
            String sql = "update canciones set nombrecancion=? , duracion=? where idcanciones=?";
            pst = cd.getCn().prepareStatement(sql);
            pst.setString(1, can.getNombrecancion());
                pst.setString(2, can.getDuracion());
            pst.setInt(3,can.getIdcanciones());
            pst.executeUpdate();
            mensaje = "Modificado correctamente";
        }catch(SQLException e){
            mensaje = "Error";
        }
        return mensaje;
    }  
    
     public List listarcanciones(){
        String sql = "select canciones.idcanciones, canciones.nombrecancion, canciones.duracion ,artista.nombreartista "
                + "from canciones inner join disco on canciones.iddisco=disco.iddisco "
                + "inner join artista on disco.idartista=artista.idartista";
        ArrayList<cancion> lista = new ArrayList();
        try{
            pst = cd.getCn().prepareStatement(sql);
            rs = cd.recuperar(sql);
            while(rs.next()){
                artista ar=new artista();
                disco dis=new disco();
                cancion can = new cancion();
                can.setIdcanciones(rs.getInt("idcanciones"));
                can.setNombrecancion(rs.getString("nombrecancion"));
                can.setDuracion(rs.getString("duracion"));
                ar.setNombreartista(rs.getString("nombreartista"));
                dis.setIdartista(ar);
                can.setIddisco(dis);
                lista.add(can);
            }
            return lista;
        }catch(SQLException e){
            return null;
        }    
    }  
       
       
       public List listarcancioness(int iddisco){
        String sql = "select canciones.idcanciones, canciones.nombrecancion, canciones.duracion ,artista.nombreartista "
                + "from canciones inner join disco on canciones.iddisco=disco.iddisco inner join artista "
                + "on disco.idartista=artista.idartista where disco.iddisco="+iddisco;
        ArrayList<cancion> lista = new ArrayList();
        try{
            pst = cd.getCn().prepareStatement(sql);
            rs = cd.recuperar(sql);
            while(rs.next()){
                artista ar=new artista();
                disco dis=new disco();
                cancion can = new cancion();
                can.setIdcanciones(rs.getInt("idcanciones"));
                can.setNombrecancion(rs.getString("nombrecancion"));
                can.setDuracion(rs.getString("duracion"));
                ar.setNombreartista(rs.getString("nombreartista"));
                dis.setIdartista(ar);
                can.setIddisco(dis);
                lista.add(can);
            }
            return lista;
        }catch(SQLException e){
            return null;
        }    
    }    
       
}
