package repository.NoteManagement;

import model.INotes;

import java.util.List;

public interface INoteManagementRepository {
    List<INotes> searchNotes(String keyword);
    void addNote(String title, String content,Integer typeId);
    void addNote(Integer typeId);
}
