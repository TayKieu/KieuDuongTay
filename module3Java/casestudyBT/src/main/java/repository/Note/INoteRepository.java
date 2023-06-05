package repository.Note;

import model.INotes;

import java.sql.SQLException;
import java.util.List;

public interface INoteRepository {
    boolean save();

    boolean delete();

    public void insertNote(INotes note) throws SQLException;

    public INotes selectNote(int id);

    public List<INotes> selectAllNote();
    public boolean deleteNoteById(int id) throws SQLException;
    public boolean updateNote(INotes note) throws SQLException;
}
