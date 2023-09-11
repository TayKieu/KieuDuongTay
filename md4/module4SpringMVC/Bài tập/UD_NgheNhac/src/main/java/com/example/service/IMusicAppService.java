package com.example.service;

import com.example.model.Song;
import org.springframework.stereotype.Service;

import java.util.List;

public interface IMusicAppService {
    List<Song> findAll();

    Song findOneById(int id);

    boolean save(Song song);
    void delete(int id);
}
