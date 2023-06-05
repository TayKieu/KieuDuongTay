package dao;

import model.HoKhau;

import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class IFamilyDAOImpl implements IFamilyDAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/family";
    private String jdbcUsername = "root";
    private String jdbcPassword = "12345";

    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);

        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return connection;
    }
    private static final String SELECT_ALL_HOKHAU = "select * from hokhau";
    @Override
    public List<HoKhau> hienThiTatCaHoKhau() {
        List<HoKhau> hoKhau = new ArrayList<>();
        try(Connection connection = getConnection(); PreparedStatement statement = connection.prepareStatement(SELECT_ALL_HOKHAU)){
            ResultSet rs = statement.executeQuery();
            while (rs.next()){
                Integer ma = rs.getInt("Ma");
                String tenChuHo = rs.getString("tenchuho");
                Integer soLuongThanhVien = rs.getInt("soluongthanhvien");
                Date ngayLap = rs.getDate("ngaylaphokhau");
                String diaChi = rs.getString("diachi");
                hoKhau.add(new HoKhau(ma,tenChuHo,soLuongThanhVien,ngayLap,diaChi));
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return hoKhau;
    }
}
