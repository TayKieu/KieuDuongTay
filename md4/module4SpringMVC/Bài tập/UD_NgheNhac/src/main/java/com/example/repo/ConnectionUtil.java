package com.example.repo;

import org.hibernate.HibernateException;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import javax.persistence.EntityManager;
import java.io.File;

public class ConnectionUtil {
    public static SessionFactory sessionFactory;
    public static EntityManager entityManager;
    static {
        try {
            sessionFactory = new Configuration().configure("hibernate.conf.xml").buildSessionFactory();
            entityManager = sessionFactory.createEntityManager();
        } catch (HibernateException e) {
            e.printStackTrace();
        }
    }
    public static String getAbsolutePath(String folder) {
        String rootPath = System.getProperty("catalina.home");
        File dir = new File(rootPath + File.separator + folder);
        if (!dir.exists()) {
            dir.mkdirs();
        }

        return dir.getAbsolutePath();
    }
}
