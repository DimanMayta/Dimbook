package com.emergentes.modelo;

/**
 *
 * @author Diman
 */
public class Profesor {

    private int ID_profesor;
    private int ID_usuario;
    private String nombre;
    private String apellido;
    private String correo_electronico;
    private String usuario;
    private String contraseña;
    private String foto_perfil;
    private String materias;
    private String ubicacion;

    public Profesor() {
    }

    public int getID_profesor() {
        return ID_profesor;
    }

    public void setID_profesor(int ID_profesor) {
        this.ID_profesor = ID_profesor;
    }

    public int getID_usuario() {
        return ID_usuario;
    }

    public void setID_usuario(int ID_usuario) {
        this.ID_usuario = ID_usuario;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getCorreo_electronico() {
        return correo_electronico;
    }

    public void setCorreo_electronico(String correo_electronico) {
        this.correo_electronico = correo_electronico;
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

    public String getFoto_perfil() {
        return foto_perfil;
    }

    public void setFoto_perfil(String foto_perfil) {
        this.foto_perfil = foto_perfil;
    }

    public String getMaterias() {
        return materias;
    }

    public void setMaterias(String materias) {
        this.materias = materias;
    }

    public String getUbicacion() {
        return ubicacion;
    }

    public void setUbicacion(String ubicacion) {
        this.ubicacion = ubicacion;
    }

    @Override
    public String toString() {
        return "Profesor{" + "ID_profesor=" + ID_profesor + ", ID_usuario=" + ID_usuario + ", nombre=" + nombre + ", apellido=" + apellido + ", correo_electronico=" + correo_electronico + ", usuario=" + usuario + ", contrase\u00f1a=" + contraseña + ", foto_perfil=" + foto_perfil + ", materias=" + materias + ", ubicacion=" + ubicacion + '}';
    }

    

}
