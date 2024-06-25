package com.emergentes.modelo;

/**
 *
 * @author Diman
 */
public class Curso {
    private int ID_curso;
    private String titulo;
    private String descripcion;
    private String codigo_curso;
    private int ID_profesor;

    public Curso() {
    }

    public Curso(String titulo, String descripcion, String codigo_curso, int ID_profesor) {
        this.titulo = titulo;
        this.descripcion = descripcion;
        this.codigo_curso = codigo_curso;
        this.ID_profesor = ID_profesor;
    }
    

    public int getID_curso() {
        return ID_curso;
    }

    public void setID_curso(int ID_curso) {
        this.ID_curso = ID_curso;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getCodigo_curso() {
        return codigo_curso;
    }

    public void setCodigo_curso(String codigo_curso) {
        this.codigo_curso = codigo_curso;
    }

    public int getID_profesor() {
        return ID_profesor;
    }

    public void setID_profesor(int ID_profesor) {
        this.ID_profesor = ID_profesor;
    }

    @Override
    public String toString() {
        return "Curso{" + "ID_curso=" + ID_curso + ", titulo=" + titulo + ", descripcion=" + descripcion + ", codigo_curso=" + codigo_curso + ", ID_profesor=" + ID_profesor + '}';
    }
    
    
}
