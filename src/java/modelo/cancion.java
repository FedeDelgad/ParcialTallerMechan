/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;



/**
 *
 * @author hp
 */
public class cancion {
   private int idcanciones;
   private String nombrecancion;
   private String duracion;
   private disco iddisco;

    public int getIdcanciones() {
        return idcanciones;
    }

    public void setIdcanciones(int idcanciones) {
        this.idcanciones = idcanciones;
    }

    public String getNombrecancion() {
        return nombrecancion;
    }

    public void setNombrecancion(String nombrecancion) {
        this.nombrecancion = nombrecancion;
    }

    public String getDuracion() {
        return duracion;
    }

    public void setDuracion(String duracion) {
        this.duracion = duracion;
    }

    public disco getIddisco() {
        return iddisco;
    }

    public void setIddisco(disco iddisco) {
        this.iddisco = iddisco;
    }
   
   
}
