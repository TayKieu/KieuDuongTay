package com.example.model;

import org.hibernate.annotations.Cascade;

import javax.persistence.*;

public class Comment {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private int vote;
    private String author;
    private String feedBack;
    @Column(name="like", nullable = false)
    private int like = 0;
    @ManyToOne
    @JoinColumn(name = "picture_id", referencedColumnName = "id")
    private DailyPic pic;

    public int getLike() {
        return like;
    }

    public void setLike(int like) {
        this.like = like;
    }

    public DailyPic getPic() {
        return pic;
    }

    public void setPic(DailyPic pic) {
        this.pic = pic;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getVote() {
        return vote;
    }

    public void setVote(int vote) {
        this.vote = vote;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getFeedBack() {
        return feedBack;
    }

    public void setFeedBack(String feedBack) {
        this.feedBack = feedBack;
    }
}
