package com.example.model.bo;

import com.example.model.bean.User;
import com.example.model.dao.UserDAO;

public class UserBO {
    public static void register(User user){
        new UserDAO().register(user);
    }
    public static User checkLogin(String username,String password){
        if("".equals(username)||"".equals(password)){
            return null;
        }
        return new UserDAO().CheckLogin(username,password);
    }
}
