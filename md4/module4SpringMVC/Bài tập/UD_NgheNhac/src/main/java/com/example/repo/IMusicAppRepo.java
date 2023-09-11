package com.example.repo;

import com.example.model.Song;

import java.util.List;

public interface IMusicAppRepo {
    List<Song> findAll();

    Song findOneById(int id);

    boolean save(Song song);
    void delete(int id);
}
