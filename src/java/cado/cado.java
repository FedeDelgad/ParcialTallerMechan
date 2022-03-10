/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cado;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author hp
 */


public class cado 
{
    private Connection cn;
    
    public Connection getCn()
    {
        try{
            Class.forName("com.mysql.jdbc.Driver");
            cn = DriverManager.getConnection("jdbc:mysql://159.223.24.50:3306/disqueria", 
                    "sistemas", "talleR21a");
            return cn;
        }catch(Exception e){
            return null;
        }
    }
      
   
    //CUD
    public String ejecutar(String sql)
    {
        Statement st;
        try{
            st = this.getCn().createStatement();
            st.executeUpdate(sql);
            return "ok";
        }catch(Exception e){
            return "Error---> " + e.getMessage();
        }
    }
    //R
    public ResultSet recuperar(String sql)
    {
        Statement st;
        try{
            st = this.getCn().createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
                    ResultSet.CONCUR_READ_ONLY);            
            return st.executeQuery(sql);
        }catch(Exception e){
            return null;
        }
    }
}

