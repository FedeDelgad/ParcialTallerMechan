
package modelo;

import cado.cado;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class modelodisco {
   
   cado cd = new cado();
    Connection cn;
    PreparedStatement pst;
    ResultSet rs;
    
    public String insertar( disco di){
        String mensaje;
        try{
            String sql ="insert into disco(volumen,idgrupo,idartista,idgenero) value(?,?,?,?)";
            pst = cd.getCn().prepareStatement(sql);
            pst.setString(1,di.getVolumen());
            pst.setInt(2,di.getIdgrupo().getIdgrupo() );
            pst.setInt(3,di.getIdartista().getIdartista() );
            pst.setInt(4,di.getIdgenero().getIdgenero() );
            pst.executeUpdate();
            mensaje = "Registro correcto";
        }catch(SQLException e){
            mensaje = "Error";
        }
        return mensaje;
    }
    /*listar por disco*/
    public List listar(){
        String sql = "select disco.iddisco, disco.volumen, artista.nombreartista,grupo.nombregrupo, "
                + "genero.genero from disco inner join artista on disco.idartista= artista.idartista"
                + " inner join grupo on disco.idgrupo= grupo.idgrupo inner join genero on disco.idgenero=genero.idgenero";
        ArrayList<disco> lista = new ArrayList();
        try{
            pst = cd.getCn().prepareStatement(sql);
            rs = cd.recuperar(sql);
            while(rs.next()){
                disco dis=new disco();
                artista ar=new artista();
                grupo gru=new grupo();
                genero ge = new genero();
               dis.setIddisco(rs.getInt("iddisco"));
               dis.setVolumen(rs.getString("volumen"));
               ar.setNombreartista(rs.getString("nombreartista"));
               dis.setIdartista(ar);
               gru.setNombregrupo(rs.getString("nombregrupo"));
               dis.setIdgrupo(gru);
               ge.setGenero(rs.getString("genero"));
               dis.setIdgenero(ge);               
                lista.add(dis);
            }
            return lista;
        }catch(SQLException e){
            return null;
        }
    } 
   /*Listar por grupos */
    
      public List listargrupos(int idgrupo){
        String sql = "select disco.iddisco, disco.volumen, artista.nombreartista,grupo.nombregrupo, genero.genero "
                + "from disco inner join artista on disco.idartista= artista.idartista inner join grupo on "
                + "disco.idgrupo= grupo.idgrupo inner join genero on disco.idgenero=genero.idgenero"
                + " where grupo.idgrupo="+idgrupo;
        ArrayList<disco> lista = new ArrayList();
        try{
            pst = cd.getCn().prepareStatement(sql);
            rs = cd.recuperar(sql);
            while(rs.next()){
                disco dis=new disco();
                artista ar=new artista();
                grupo gru=new grupo();
                genero ge = new genero();
               dis.setIddisco(rs.getInt("iddisco"));
               dis.setVolumen(rs.getString("volumen"));
               ar.setNombreartista(rs.getString("nombreartista"));
               dis.setIdartista(ar);
               gru.setNombregrupo(rs.getString("nombregrupo"));
               dis.setIdgrupo(gru);
               ge.setGenero(rs.getString("genero"));
               dis.setIdgenero(ge);               
                lista.add(dis);
            }
            return lista;
        }catch(SQLException e){
            return null;
        }
    } 
    
   /*listar por genero*/
      
        public List listargenero(int idgenero){
        String sql = "select disco.iddisco, disco.volumen, artista.nombreartista,grupo.nombregrupo, genero.genero "
                + "from disco inner join artista on disco.idartista= artista.idartista inner join grupo "
                + "on disco.idgrupo= grupo.idgrupo inner join genero on disco.idgenero=genero.idgenero "
                + "where genero.idgenero="+idgenero;
        ArrayList<disco> lista = new ArrayList();
        try{
            pst = cd.getCn().prepareStatement(sql);
            rs = cd.recuperar(sql);
            while(rs.next()){
                disco dis=new disco();
                artista ar=new artista();
                grupo gru=new grupo();
                genero ge = new genero();
               dis.setIddisco(rs.getInt("iddisco"));
               dis.setVolumen(rs.getString("volumen"));
               ar.setNombreartista(rs.getString("nombreartista"));
               dis.setIdartista(ar);
               gru.setNombregrupo(rs.getString("nombregrupo"));
               dis.setIdgrupo(gru);
               ge.setGenero(rs.getString("genero"));
               dis.setIdgenero(ge);               
                lista.add(dis);
            }
            return lista;
        }catch(SQLException e){
            return null;
        }
    }
    
    /*listar por artista*/
    
      public List listarartista(int idartista){
        String sql = "select disco.iddisco, disco.volumen, artista.nombreartista,grupo.nombregrupo, genero.genero "
                + "from disco inner join artista on disco.idartista= artista.idartista inner join grupo on "
                + "disco.idgrupo= grupo.idgrupo inner join genero on disco.idgenero=genero.idgenero "
                + "where artista.idartista="+idartista;
        ArrayList<disco> lista = new ArrayList();
        try{
            pst = cd.getCn().prepareStatement(sql);
            rs = cd.recuperar(sql);
            while(rs.next()){
                disco dis=new disco();
                artista ar=new artista();
                grupo gru=new grupo();
                genero ge = new genero();
               dis.setIddisco(rs.getInt("iddisco"));
               dis.setVolumen(rs.getString("volumen"));
               ar.setNombreartista(rs.getString("nombreartista"));
               dis.setIdartista(ar);
               gru.setNombregrupo(rs.getString("nombregrupo"));
               dis.setIdgrupo(gru);
               ge.setGenero(rs.getString("genero"));
               dis.setIdgenero(ge);               
                lista.add(dis);
            }
            return lista;
        }catch(SQLException e){
            return null;
        }
    }
    
    
    
    
   /*modificar disco*/ 
    
      public String modificar(disco dis){
        String mensaje;
        try{
            String sql = "update disco set volumen=? where iddisco=?";
            pst = cd.getCn().prepareStatement(sql);
            pst.setString(1, dis.getVolumen());
            pst.setInt(2, dis.getIddisco());
            pst.executeUpdate();
            mensaje = "Modificado correctamente";
        }catch(SQLException e){
            mensaje = "Error";
        }
        return mensaje;
    }  
}
