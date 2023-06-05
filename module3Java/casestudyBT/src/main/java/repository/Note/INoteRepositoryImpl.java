package repository.Note;

import model.INotes;
import repository.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class INoteRepositoryImpl implements INoteRepository {
    private static final String SELECT_ALL_NOTES = "select * from note";

    @Override
    public boolean save() {
        return false;
    }

    @Override
    public boolean delete() {
        return false;
    }

    @Override
    public void insertNote(INotes note) throws SQLException {

    }

    @Override
    public INotes selectNote(int id) {
        return null;
    }

    @Override
    public List<INotes> selectAllNote() {
        List<INotes> note = new ArrayList<>();
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_NOTES);) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String title = rs.getString("title");
                String content = rs.getString("content");
                int typeid = rs.getInt("typeId");
                note.add(new INotes(id, title, content, typeid));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return null;
    }

    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }

    @Override
    public boolean deleteNoteById(int id) throws SQLException {
        return false;
    }

    @Override
    public boolean updateNote(INotes note) throws SQLException {
        return false;
    }
}
