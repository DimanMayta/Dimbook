package com.emergentes.dao;

import com.emergentes.modelo.Profesor;
import java.util.List;

/**
 *
 * @author Diman
 */
public interface ProfesorDAO {
    public void insert(Profesor profesor) throws Exception;
    public void update(Profesor profesor) throws Exception;
    public void delete(int id) throws Exception;
    public Profesor getById(int id) throws Exception;
    public List<Profesor> getAll() throws Exception;
    public Profesor getByUserId(int userId) throws Exception;
}
