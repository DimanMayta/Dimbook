package com.emergentes.dao;

import com.emergentes.modelo.Curso;
import com.emergentes.utiles.ConexionDB;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Diman
 */
public class CursoDAOimpl extends ConexionDB implements CursoDAO {

    @Override
    public void insert(Curso curso) throws Exception {
        String sql = "INSERT INTO cursos (titulo, descripcion, codigo_curso, ID_profesor) VALUES (?, ?, ?, ?)";
        try {
            this.conectar();
            PreparedStatement ps = this.conn.prepareStatement(sql);
            ps.setString(1, curso.getTitulo());
            ps.setString(2, curso.getDescripcion());
            ps.setString(3, curso.getCodigo_curso());
            ps.setInt(4, curso.getID_profesor());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            throw new Exception("Error al insertar el curso en la base de datos", e);
        } finally {
            this.desconectar();
        }
    }

    @Override
    public void update(Curso curso) throws Exception {
        try {
            this.conectar();
            PreparedStatement ps = this.conn.prepareStatement("UPDATE cursos SET titulo = ?, descripcion = ?, codigo_curso = ?, ID_profesor = ? WHERE ID_curso = ?");
            ps.setString(1, curso.getTitulo());
            ps.setString(2, curso.getDescripcion());
            ps.setString(3, curso.getCodigo_curso());
            ps.setInt(4, curso.getID_profesor());
            ps.setInt(5, curso.getID_curso());
            ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
    }

    @Override
    public void delete(int id) throws Exception {
        try {
            this.conectar();
            PreparedStatement ps = this.conn.prepareStatement("DELETE FROM cursos WHERE ID_curso = ?");
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
    }

    @Override
    public Curso getById(int id) throws Exception {
        Curso curso = null;
        try {
            this.conectar();
            PreparedStatement ps = this.conn.prepareStatement("SELECT * FROM cursos WHERE ID_curso = ?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                curso = new Curso();
                curso.setID_curso(rs.getInt("ID_curso"));
                curso.setTitulo(rs.getString("titulo"));
                curso.setDescripcion(rs.getString("descripcion"));
                curso.setCodigo_curso(rs.getString("codigo_curso"));
                curso.setID_profesor(rs.getInt("ID_profesor"));
            }
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
        return curso;
    }

    @Override
    public List<Curso> getAll() throws Exception {
        List<Curso> lista = new ArrayList<>();
        try {
            this.conectar();
            PreparedStatement ps = this.conn.prepareStatement("SELECT * FROM cursos");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Curso curso = new Curso();
                curso.setID_curso(rs.getInt("ID_curso"));
                curso.setTitulo(rs.getString("titulo"));
                curso.setDescripcion(rs.getString("descripcion"));
                curso.setCodigo_curso(rs.getString("codigo_curso"));
                curso.setID_profesor(rs.getInt("ID_profesor"));
                lista.add(curso);
            }
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
        return lista;
    }

}
