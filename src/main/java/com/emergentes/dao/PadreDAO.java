package com.emergentes.dao;

import com.emergentes.modelo.Padre;
import java.util.List;

/**
 *
 * @author Diman
 */
public interface PadreDAO {
    public void insert(Padre padre) throws Exception;
    public void update(Padre padre) throws Exception;
    public void delete(int id) throws Exception;
    public Padre getById(int id) throws Exception;
    public List<Padre> getAll() throws Exception;
    public Padre getByUserId(int userId) throws Exception;
}
