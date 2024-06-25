package com.emergentes.modelo;

import java.time.LocalDateTime;

/**
 *
 * @author Diman
 */
public class Publicacion {
    private int ID_publicacion;
    private int ID_usuario;
    private String contenido;
    private LocalDateTime fecha_publicacion;
    private String archivo; 

    public Publicacion() {
    }

    public int getID_publicacion() {
        return ID_publicacion;
    }

    public void setID_publicacion(int ID_publicacion) {
        this.ID_publicacion = ID_publicacion;
    }

    public int getID_usuario() {
        return ID_usuario;
    }

    public void setID_usuario(int ID_usuario) {
        this.ID_usuario = ID_usuario;
    }

    public String getContenido() {
        return contenido;
    }

    public void setContenido(String contenido) {
        this.contenido = contenido;
    }

    public LocalDateTime getFecha_publicacion() {
        return fecha_publicacion;
    }

    public void setFecha_publicacion(LocalDateTime fecha_publicacion) {
        this.fecha_publicacion = fecha_publicacion;
    }

    public String getArchivo() {
        return archivo;
    }

    public void setArchivo(String archivo) {
        this.archivo = archivo;
    }

    @Override
    public String toString() {
        return "Publicacion{" + "ID_publicacion=" + ID_publicacion + ", ID_usuario=" + ID_usuario + ", contenido=" + contenido + ", fecha_publicacion=" + fecha_publicacion + ", archivo=" + archivo + '}';
    }
    
    
}
