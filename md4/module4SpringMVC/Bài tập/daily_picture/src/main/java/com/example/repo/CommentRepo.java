package com.example.repo;


import com.example.model.Comment;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

public class CommentRepo {
    @Autowired
    private SessionFactory sessionFactory;
    private EntityManager entityManager;

    public void updateLike(int id){
        Session session = null;
        Transaction transaction = null;
        try{
            session = sessionFactory.openSession();
            transaction = session.beginTransaction();
            Comment comment = findOne(id);
            int like = comment.getLike()+1;
            String str = "update Comment set like =: like where id=:id";
            TypedQuery<Comment> query = entityManager.createQuery(str, Comment.class)
                    .setParameter("like",like)
                    .setParameter("id",id);
            query.executeUpdate();
            transaction.commit();
        } catch (HibernateException e) {
            throw new RuntimeException(e);
        } finally {
            if (session != null) {
                session.close();
            }
        }
        }
    public Comment findOne(int id) {
        TypedQuery<Comment> query = entityManager.createQuery("from Comment where id =: id", Comment.class);
        query.setParameter("id", id);
        return query.getSingleResult();
    }
    public void save(Comment comment){
        Session session = null;
        Transaction transaction = null;
        try {
            session =sessionFactory.openSession();
            transaction = session.beginTransaction();

            session.persist(comment);
            transaction.commit();
        } catch (Exception e) {
            e.printStackTrace();
            if (transaction != null) {
                transaction.rollback();
            }
        } finally {
            if (session != null) {
                session.close();
            }
        }
    }
}
