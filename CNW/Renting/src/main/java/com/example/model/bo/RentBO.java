package com.example.model.bo;

import com.example.model.bean.RentDetail;
import com.example.model.bean.User;
import com.example.model.dao.RentDAO;
import com.example.model.dao.UserDAO;

import java.util.List;

public class RentBO {
    public static List<RentDetail> findAll(){
        return new RentDAO().findAll();
    }
    public static void create(RentDetail newRent){
        new RentDAO().createNewPost(newRent);
    }
    public static boolean editOwnerContactInfo(String accountName, String email, String phone, int userId){
        return new RentDAO().editOwnerContactInfo(accountName,email,phone,userId);
    }
    public static boolean updateRentInfo(RentDetail rentDetail){
        return new RentDAO().updateRentInfo(rentDetail);
    }
    public static RentDetail findRentDetailById(int rentDetailId){
        return new RentDAO().findRentDetailById(rentDetailId);
    }
    public static Boolean deleteById(int rentDetailId){
        return new RentDAO().deleteByID(rentDetailId);
    }
}
