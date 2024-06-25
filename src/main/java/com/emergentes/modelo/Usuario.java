package com.emergentes.modelo;

/**
 *
 * @author Diman
 */
public class Usuario {

    private int ID_usuario;
    private String usuario;
    private String contraseña;
    private String tipo_usuario;

    public Usuario(int ID_usuario, String usuario, String contraseña, String tipo_usuario) {
        this.ID_usuario = ID_usuario;
        this.usuario = usuario;
        this.contraseña = contraseña;
        this.tipo_usuario = tipo_usuario;
    }

    public Usuario() {
    }

    public int getID_usuario() {
        return ID_usuario;
    }

    public void setID_usuario(int ID_usuario) {
        this.ID_usuario = ID_usuario;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getContraseña() {
        return contraseña;
    }

    public void setContraseña(String contraseña) {
        this.contraseña = contraseña;
    }

    public String getTipo_usuario() {
        return tipo_usuario;
    }

    public void setTipo_usuario(String tipo_usuario) {
        this.tipo_usuario = tipo_usuario;
    }

    @Override
    public String toString() {
        return "Usuario{" + "ID_usuario=" + ID_usuario + ", usuario=" + usuario + ", contrase\u00f1a=" + contraseña + ", tipo_usuario=" + tipo_usuario + '}';
    }

}
