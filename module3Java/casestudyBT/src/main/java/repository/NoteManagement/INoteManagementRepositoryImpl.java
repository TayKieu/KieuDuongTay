package repository.NoteManagement;

import model.INotes;

import java.util.List;

public class INoteManagementRepositoryImpl implements INoteManagementRepository{
    @Override
    public List<INotes> searchNotes(String keyword) {
        return null;
    }

    @Override
    public void addNote(String title, String content, Integer typeId) {

    }

    @Override
    public void addNote(Integer typeId) {

    }
}
