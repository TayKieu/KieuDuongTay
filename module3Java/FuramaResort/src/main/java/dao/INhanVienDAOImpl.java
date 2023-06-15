package dao;

import model.nhanvien.NhanVien;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class INhanVienDAOImpl implements INhanVienDAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/casestudy";
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

    private static final String HIEN_THI_TAT_CA_NHAN_VIEN = "select * from nhan_vien nv join vi_tri vt using (ma_vi_tri)  join trinh_do td using(ma_trinh_do) join bo_phan bp using(ma_bo_phan);";
    @Override
    public List<NhanVien> hienThiDSNhanVien() {
        List<NhanVien> nhanViens = new ArrayList<>();
        Connection connection = getConnection();
        try(PreparedStatement statement = connection.prepareStatement(HIEN_THI_TAT_CA_NHAN_VIEN);) {
            ResultSet rs = statement.executeQuery();
            NhanVien nhanVien = null;
            while (rs.next()){
                int ma = rs.getInt("ma_nhan_vien");
                String hoTen = rs.getString("ho_ten");
                String ngaySinh = rs.getString("ngay_sinh");
                String cmnd = rs.getString("so_cmnd");
                Double luong = rs.getDouble("luong");
                String sdt = rs.getString("so_dien_thoai");
                String email = rs.getString("email");
                String diaChi = rs.getString("dia_chi");
                String viTri = rs.getString(12);
                String trinhDo = rs.getString(13);
                String boPhan = rs.getString(14);
                 nhanVien = new NhanVien(ma,hoTen,ngaySinh,cmnd,luong,sdt,email,diaChi,viTri,trinhDo,boPhan);
                nhanViens.add(nhanVien);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return nhanViens;
    }

    private static final String THEM_MOI_NHAN_VIEN = "insert into nhan_vien(ma_nhan_vien,ho_ten,ngay_sinh,so_cmnd,luong,so_dien_thoai,email,dia_chi,ma_vi_tri,ma_trinh_do,ma_bo_phan)\n" +
                                                        " values (?,?,?,?,?,?,?,?,?,?,?) ";
    @Override
    public NhanVien taoMoiNhanVien(NhanVien nhanVien) {
        try(Connection connection = getConnection(); PreparedStatement statement = connection.prepareStatement(THEM_MOI_NHAN_VIEN)
        ){
            statement.setInt(1,nhanVien.getMaNV());
            statement.setString(2, nhanVien.getHoTen());
            statement.setString(3,nhanVien.getDate());
            statement.setString(4,nhanVien.getCMND());
            statement.setDouble(5,nhanVien.getLuong());
            statement.setString(6,nhanVien.getSdt());
            statement.setString(7,nhanVien.getEmail());
            statement.setString(8,nhanVien.getDiaChi());
            statement.setInt(9,nhanVien.getMaViTri());
            statement.setInt(10,nhanVien.getMaTrinhDo());
            statement.setInt(11,nhanVien.getMaBoPhan());
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return null;
    }
}
