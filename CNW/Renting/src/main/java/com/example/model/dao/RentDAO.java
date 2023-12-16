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
    private static final String EDIT_OWNER_CONTACT_INFORMATION = "update user set account_name = ?, email = ?, phone = ? where id = ? ";
    public static boolean editOwnerContactInfo (String accountName, String email, String phone, int userId){
        boolean rowUpdate;
        try{Connection connection = ConnectDBUtils.getConnection();
            PreparedStatement statement = connection.prepareStatement(EDIT_OWNER_CONTACT_INFORMATION);
            statement.setString(1,accountName);
            statement.setString(2,email);
            statement.setString(3,phone);
            statement.setInt(4,userId);
            rowUpdate = statement.executeUpdate()>0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return rowUpdate;
    }
    private static final String FIND_RENT_DETAIL_BY_ID = "select * from rent_detail join user on rent_detail.user_id = user.id where rent_detail.rent_detail_id = ?";
    public static RentDetail findRentDetailById(int rentDetailId){
        try{
            Connection connection = ConnectDBUtils.getConnection();
            PreparedStatement statement = connection.prepareStatement(FIND_RENT_DETAIL_BY_ID);
            statement.setInt(1,rentDetailId);
            ResultSet rs = statement.executeQuery();
            if(rs.next()){
                RentDetail rentDetail = new RentDetail();
                rentDetail.setRentDetailId(rentDetailId);
                rentDetail.setArea(rs.getString("area"));
                rentDetail.setAddress(rs.getString("address"));
                rentDetail.setAcreage(rs.getInt("acreage"));
                rentDetail.setInfo(rs.getString("info"));
                rentDetail.setPrices(rs.getInt("prices"));
                rentDetail.setTitle(rs.getString("title"));
                rentDetail.setImg(rs.getString("img"));
                rentDetail.setRentTypeId(rs.getInt("rent_type_id"));
                rentDetail.setOwnerId(rs.getInt("user_id"));
                rentDetail.setOwnerAccountName(rs.getString("account_name"));
                rentDetail.setOwnerEmail(rs.getString("email"));
                rentDetail.setOwnerPhone(rs.getString("phone"));
                return rentDetail;
            }
            return null;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    private static final String DELETE_BY_ID = "delete from rent_detail where rent_detail_id = ?";
    public static boolean deleteByID(int rentDetailId){
        Boolean rowDelete;
        try{
            Connection connection = ConnectDBUtils.getConnection();
            PreparedStatement statement = connection.prepareStatement(DELETE_BY_ID);
            statement.setInt(1,rentDetailId);
            rowDelete = statement.executeUpdate()>0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return rowDelete;
    }

    private static final String UPDATE_RENT_INFO = "update rent_detail set area = ?, address = ?, acreage = ?, info =?, prices = ?, title = ?, img = ?, rent_type_id = ?, user_id = ? where rent_detail_id = ?";
    public static boolean updateRentInfo(RentDetail rentDetail){
        Boolean rowUpdate;
        try{
            Connection connection = ConnectDBUtils.getConnection();
            PreparedStatement statement = connection.prepareStatement(UPDATE_RENT_INFO);
            statement.setString(1,rentDetail.getArea());
            statement.setString(2,rentDetail.getAddress());
            statement.setInt(3,rentDetail.getAcreage());
            statement.setString(4,rentDetail.getInfo());
            statement.setInt(5,rentDetail.getPrices());
            statement.setString(6,rentDetail.getTitle());
            statement.setString(7,rentDetail.getImg());
            statement.setInt(8,rentDetail.getRentTypeId());
            statement.setInt(9,rentDetail.getOwnerId());
            statement.setInt(10,rentDetail.getRentDetailId());
            rowUpdate = statement.executeUpdate()>0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return rowUpdate;
    }
}
