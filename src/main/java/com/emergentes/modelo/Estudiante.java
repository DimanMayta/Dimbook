package com.emergentes.modelo;

/**
 *
 * @author Diman
 */
public class Estudiante {
    private int ID_estudiante;
    private int ID_usuario;
    private String nombre;
    private String apellido;
    private String codigo_curso;
    private String correo_electronico;
    private String usuario;
    private String contraseña;
    private String foto_perfil;

    public Estudiante() {
    }

    public int getID_estudiante() {
        return ID_estudiante;
    }

    public void setID_estudiante(int ID_estudiante) {
        this.ID_estudiante = ID_estudiante;
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

    public String getCodigo_curso() {
        return codigo_curso;
    }

    public void setCodigo_curso(String codigo_curso) {
        this.codigo_curso = codigo_curso;
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

    @Override
    public String toString() {
        return "Estudiante{" + "ID_estudiante=" + ID_estudiante + ", ID_usuario=" + ID_usuario + ", nombre=" + nombre + ", apellido=" + apellido + ", codigo_curso=" + codigo_curso + ", correo_electronico=" + correo_electronico + ", usuario=" + usuario + ", contrase\u00f1a=" + contraseña + ", foto_perfil=" + foto_perfil + '}';
    }
    
}
