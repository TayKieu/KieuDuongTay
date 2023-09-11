package service.NoteManagement;

import model.INotes;

import java.util.List;

public interface INoteManagementService {
    List<INotes> searchNotes(String keyword);
    void addNote(String title, String content,Integer typeId);
    void addNote(Integer typeId);
}
