package com.example.service;

import com.example.model.Song;
import com.example.repo.IMusicAppRepo;
import com.example.repo.IMusicAppRepoImpl;
import org.hibernate.HibernateException;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class IMusicAppServiceImpl implements IMusicAppService{
    @Autowired
    private IMusicAppRepo musicAppRepo;
    @Override
    public List<Song> findAll() {
        return musicAppRepo.findAll();
    }

    @Override
    public Song findOneById(int id) {
        return musicAppRepo.findOneById(id);
    }

    @Override
    public boolean save(Song song) {
        return musicAppRepo.save(song);
    }

    @Override
    public void delete(int id) {
        musicAppRepo.delete(id);
    }
    static {
        try {
            SessionFactory sessionFactory = new Configuration()
                    .configure("hibernate.conf.xml")
                    .buildSessionFactory();
            sessionFactory.close();
        } catch (HibernateException e) {
            e.printStackTrace();
        }
    }
}
