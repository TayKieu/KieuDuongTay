package com.example.repo;

import com.example.model.DailyPic;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import java.time.LocalDate;
import java.util.Optional;

public class PicRepo {
    @Autowired
    private SessionFactory sessionFactory;
    public Optional<DailyPic> find(LocalDate date){
        EntityManager entityManager = sessionFactory.createEntityManager();
        String str = "Select p from DailyPic as p where p.date =: dateNow";
        TypedQuery<DailyPic> query = entityManager.createQuery(str,DailyPic.class);
        query.setParameter("dateNow",date);
        return query.getResultList().stream().findFirst();
    }
}
