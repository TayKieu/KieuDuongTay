package com.example.repo;

import com.example.model.Song;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import java.util.ArrayList;
import java.util.List;

@Repository
public class IMusicAppRepoImpl implements IMusicAppRepo{
    @Autowired
    private SessionFactory sessionFactory;

    private EntityManager entityManager;
    @Override
    public List<Song> findAll() {
        List<Song> songList = new ArrayList<>();
        Session session = ConnectionUtil.sessionFactory.openSession();
        TypedQuery<Song> query = session.createQuery("from Song", Song.class);
        songList = query.getResultList();
        session.close();
        return songList;
    }

    @Override
    public Song findOneById(int id) {
        Song song = new Song();
        Session session = ConnectionUtil.sessionFactory.openSession();
        TypedQuery<Song> query = session.createQuery("from Song where id =: id",Song.class);
        song = query.getSingleResult();
        session.close();
        return song;
    }

    @Override
    public boolean save(Song song) {
        Session session = ConnectionUtil.sessionFactory.openSession();
        Transaction transaction = session.getTransaction();
        try{
            transaction.begin();
            session.save(song);
            transaction.commit();
            session.close();
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }
        return true;
    }

    @Override
    public void delete(int id) {
        try{
            Session session = sessionFactory.openSession();
            Transaction transaction = session.beginTransaction();
            Song song = session.get(Song.class,id);
            session.delete(song);
            transaction.commit();
        } catch (HibernateException e) {
            throw new RuntimeException(e);
        }

    }
}
