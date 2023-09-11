package model;

public class INotesManagement extends INotes {
    private INotes note;

    public INotes getNote() {
        return note;
    }

    public void setNote(INotes note) {
        this.note = note;
    }


    public INotesManagement(String title, INotes note) {
        super(title);
        this.note = note;
    }
}
