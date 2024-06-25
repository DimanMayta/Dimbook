package com.emergentes.modelo;

/**
 *
 * @author Diman
 */
public class Padre {
    private int ID_padre;
    private int ID_usuario;
    private String nombre;
    private String apellido;
    private String correo_electronico;
    private String usuario;
    private String contraseña;
    private String codigo_curso;
    private String nombre_de_estudiante;
    private String foto_perfil;

    public Padre() {
    }

    public int getID_padre() {
        return ID_padre;
    }

    public void setID_padre(int ID_padre) {
        this.ID_padre = ID_padre;
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

    public String getCodigo_curso() {
        return codigo_curso;
    }

    public void setCodigo_curso(String codigo_curso) {
        this.codigo_curso = codigo_curso;
    }

    public String getNombre_de_estudiante() {
        return nombre_de_estudiante;
    }

    public void setNombre_de_estudiante(String nombre_de_estudiante) {
        this.nombre_de_estudiante = nombre_de_estudiante;
    }

    public String getFoto_perfil() {
        return foto_perfil;
    }

    public void setFoto_perfil(String foto_perfil) {
        this.foto_perfil = foto_perfil;
    }

    @Override
    public String toString() {
        return "Padre{" + "ID_padre=" + ID_padre + ", ID_usuario=" + ID_usuario + ", nombre=" + nombre + ", apellido=" + apellido + ", correo_electronico=" + correo_electronico + ", usuario=" + usuario + ", contrase\u00f1a=" + contraseña + ", codigo_curso=" + codigo_curso + ", nombre_de_estudiante=" + nombre_de_estudiante + ", foto_perfil=" + foto_perfil + '}';
    }
    
}
