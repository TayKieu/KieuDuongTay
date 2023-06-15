package dao;

import model.HoKhau;
import model.ThanhVien;

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
    private static final String HIEN_THI_TAT_CA_HO_KHAU = "select * from hokhau ";
    @Override
    public List<HoKhau> hienThiTatCaHoKhau() {
        List<HoKhau> hoKhaus = new ArrayList<>();
        try(Connection connection = getConnection(); PreparedStatement statement = connection.prepareStatement(HIEN_THI_TAT_CA_HO_KHAU)){
            ResultSet rs = statement.executeQuery();
            while (rs.next()){
                Integer ma = rs.getInt("Ma");
                String tenChuHo = rs.getString("tenchuho");
                Integer soLuongThanhVien = rs.getInt("soluongthanhvien");
                Date ngayLap = rs.getDate("ngaylaphokhau");
                String diaChi = rs.getString("diachi");
                HoKhau hoKhau = new HoKhau(ma,tenChuHo,soLuongThanhVien,ngayLap,diaChi);

                PreparedStatement statement1 = connection.prepareStatement("select * from thanhvien where mahokhau = "+ ma);
                ResultSet rs1 = statement1.executeQuery();
                List<ThanhVien> listThanhVien = new ArrayList<>();

                while (rs1.next()){
                    String fullName = rs1.getString("hoten");
                    listThanhVien.add(new ThanhVien(fullName));

                }
                hoKhau.setThanhVienList(listThanhVien);
                hoKhaus.add(hoKhau);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return hoKhaus;
    }

    private static final String LAY_HO_KHAU_THEO_ID = "select * from hokhau where Ma = ?";
    @Override
    public HoKhau layHoKhauTheoId(int id) {
        HoKhau hoKhau = null;
        try(Connection connection = getConnection();
        PreparedStatement statement = connection.prepareStatement(LAY_HO_KHAU_THEO_ID);){
            statement.setInt(1,id);
            ResultSet rs = statement.executeQuery();
            while (rs.next()){
                String tenChuHo = rs.getString(2);
                Integer soLuongTV = rs.getInt(3);
                Date ngaylapHoKhau = rs.getDate(4);
                String diaChi = rs.getString(5);
                hoKhau = new HoKhau(id,tenChuHo,soLuongTV,ngaylapHoKhau,diaChi);
            }
        }
        catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return hoKhau;
    }

    private static final String SUA_HO_KHAU_THEO_MA = "update hokhau set tenchuho = ?, ngaylaphokhau = ?, diachi = ? where Ma = ? ";
    @Override
    public Boolean suaHoKhau(HoKhau hoKhau) {
        boolean rowUpdate;
        try(Connection connection = getConnection();
            PreparedStatement statement = connection.prepareStatement(SUA_HO_KHAU_THEO_MA);){
            statement.setString(1,hoKhau.getTenChuHo());
            statement.setDate(2, (java.sql.Date) hoKhau.getNgayLapHoKhau());
            statement.setString(3,hoKhau.getDiaChi());
            statement.setInt(4,hoKhau.getMa());
            rowUpdate = statement.executeUpdate()>0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return  rowUpdate;
    }


}
