package com.example.model.dao;

import com.example.model.bean.RentDetail;
import com.example.model.utils.ConnectDBUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class RentDAO {
    private static final String FIND_ALL_RENT_LIST = "select * from rent_detail as rd join user as u on rd.user_id = u.id join rent_type as rt on rd.rent_type_id = rt.rent_type_id";
    public static List<RentDetail> findAll(){
        List<RentDetail> rentList = new ArrayList<>();
        try{
            Connection connection = ConnectDBUtils.getConnection();
            PreparedStatement statement = connection.prepareStatement(FIND_ALL_RENT_LIST);
            ResultSet rs = statement.executeQuery();
            while (rs.next()){
                int rentDetailId = rs.getInt("rent_detail_id");
                String area = rs.getString("area");
                String address = rs.getString("address");
                int acreage = rs.getInt("acreage");
                String info = rs.getString("info");
                int prices = rs.getInt("prices");
                String title = rs.getString("title");
                String img = rs.getString("img");
                int userId = rs.getInt("user_id");
                int rentTypeId = rs.getInt("rent_type_id");
                rentList.add(new RentDetail(rentDetailId,area,address,acreage,info,prices,title,img,userId,rentTypeId));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return rentList;
    }

    private static final String CREATE_NEW_POST = "insert into rent_detail(area,address,acreage,info,prices,title,img,user_id,rent_type_id) values(?,?,?,?,?,?,?,?,?)";
    public static void createNewPost(RentDetail newRent){
        try{Connection connection = ConnectDBUtils.getConnection();
            PreparedStatement statement = connection.prepareStatement(CREATE_NEW_POST);
            statement.setString(1, newRent.getArea());
            statement.setString(2, newRent.getAddress());
            statement.setInt(3, newRent.getAcreage());
            statement.setString(4, newRent.getInfo());
            statement.setInt(5,newRent.getPrices());
            statement.setString(6,newRent.getTitle());
            statement.setString(7, newRent.getImg());
            statement.setInt(8,newRent.getRentTypeId());
            statement.setInt(9,newRent.getOwnerId());
            statement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
