package com.example.model.bo;

import com.example.model.bean.RentDetail;
import com.example.model.dao.RentDAO;

import java.util.List;

public class RentBO {
    public static List<RentDetail> findAll(){
        return new RentDAO().findAll();
    }
    public static void create(RentDetail newRent){
        new RentDAO().createNewPost(newRent);
    }
}
