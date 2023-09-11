package model;

public class INotes {
    private int id;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    private int typeId;
    private String title;
    private String content;

    public int getTypeId() {
        return typeId;
    }

    public void setTypeId(int typeId) {
        this.typeId = typeId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public INotes(String title) {
        this.title = title;
    }

    public INotes(int id, String title, String content, int typeId) {
        this.id = id;
        this.typeId = typeId;
        this.title = title;
        this.content = content;
    }
}
