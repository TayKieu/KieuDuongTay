package dao;

import model.MatBang;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class IMatBangDAOImpl implements IMatBangDAO{
    private String jdbcURL = "jdbc:mysql://localhost:3306/tcomplex";
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

    private static final String LAY_TAT_CA_MAT_BANG = "select * from matbang mb join loaimatbang lmb on mb.loaivanphong = lmb.MaLoai order by mb.dientich ;";
    @Override
    public List<MatBang> layHetMatBang() {
        List<MatBang> dsMatBang = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(LAY_TAT_CA_MAT_BANG);) {
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                String ma =rs.getString("Ma");
                int dienTich = rs.getInt("dientich");
                String trangThai = rs.getString("trangthai");
                int tang = rs.getInt("tang");
                int loaiVanPhong= rs.getInt("loaivanphong");
                String tenLoaiVanPhong = rs.getString(10);
                int giaThue = rs.getInt("giathue");
                Date ngayBatDau = rs.getDate("ngaybatdau");
                Date ngayKetThuc = rs.getDate("ngayketthuc");
                dsMatBang.add(new MatBang(ma,dienTich,trangThai,tang,loaiVanPhong,tenLoaiVanPhong,giaThue,ngayBatDau,ngayKetThuc));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return dsMatBang;
    }

    private static final String XOA_MAT_BANG = "delete from matbang where Ma = ?";
    @Override
    public boolean xoa(String ma) {
        boolean rowDelete;
        try(Connection connection = getConnection(); PreparedStatement statement = connection.prepareStatement(XOA_MAT_BANG)){
            statement.setString(1,ma);
            rowDelete = statement.executeUpdate()>0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return rowDelete;
    }

    private static final String THEM_MAT_BANG = "insert into matbang value(?,?,?,?,?,?,?,?)";
    @Override
    public MatBang themMatBang(MatBang matBang) {
        try(Connection connection = getConnection();
            PreparedStatement statement = connection.prepareStatement(THEM_MAT_BANG);){
            statement.setString(1,matBang.getMa());
            statement.setInt(2,matBang.getDienTich());
            statement.setString(3,matBang.getTrangThai());
            statement.setInt(4,matBang.getTang());
            statement.setInt(5,matBang.getLoaiVanPhong());
            statement.setInt(6,matBang.getGiaThue());
            statement.setDate(7,(java.sql.Date)matBang.getNgayBatDau());
            statement.setDate(8,(java.sql.Date) matBang.getNgayKetThuc());
            statement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return null;
    }

    private static final String TIM_MAT_BANG_THEO_MA_LOAI = "select * from matbang mb join loaimatbang lmb on mb.loaivanphong = lmb.MaLoai where mb.loaivanphong = ? order by mb.dientich ; ";
    @Override
    public List<MatBang> timMatBang(int maLoaiMatBang) {
        List<MatBang> dsMatBang = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(TIM_MAT_BANG_THEO_MA_LOAI);) {
            statement.setInt(1,maLoaiMatBang);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                String ma =rs.getString("Ma");
                int dienTich = rs.getInt("dientich");
                String trangThai = rs.getString("trangthai");
                int tang = rs.getInt("tang");
                int loaiVanPhong= rs.getInt("loaivanphong");
                String tenLoaiVanPhong = rs.getString(10);
                int giaThue = rs.getInt("giathue");
                Date ngayBatDau = rs.getDate("ngaybatdau");
                Date ngayKetThuc = rs.getDate("ngayketthuc");
                dsMatBang.add(new MatBang(ma,dienTich,trangThai,tang,loaiVanPhong,tenLoaiVanPhong,giaThue,ngayBatDau,ngayKetThuc));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return dsMatBang;
    }
}
