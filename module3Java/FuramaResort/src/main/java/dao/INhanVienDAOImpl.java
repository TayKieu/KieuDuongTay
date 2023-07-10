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
    public void taoMoiNhanVien(NhanVien nhanVien) {
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
            statement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    private static final String LAY_NHAN_VIEN_THEO_MA = "select * from nhan_vien where maNV = ?";
    @Override
    public NhanVien layNVTheoMaNV(int maNV) {
        NhanVien nhanVien = null;
        try(Connection connection = getConnection(); PreparedStatement statement = connection.prepareStatement(LAY_NHAN_VIEN_THEO_MA)){
            statement.setInt(1,maNV);
            ResultSet rs = statement.executeQuery();
            while(rs.next()) {
                String ten = rs.getString(2);
                String ngaySinh = rs.getString(3);
                String cmnd = rs.getString(4);
                double luong = rs.getDouble(5);
                String sdt = rs.getString(6);
                String email = rs.getString(7);
                String dc = rs.getString(8);
                int maVT = rs.getInt(9);
                int maTD = rs.getInt(10);
                int maBP = rs.getInt(11);
                nhanVien = new NhanVien(maNV,ten,ngaySinh,cmnd,luong,sdt,email,dc,maVT,maTD,maBP);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return nhanVien;
    }

    private static final String SUA_THONG_TIN_NV = "update nhan_vien set ma_nhan_vien = ?, ho_ten = ?, ngay_sinh = ?, so_cmnd = ?, luong = ?, so_dien_thoai = ?, email = ?, dia_chi = ?, ma_vi_tri = ?, ma_trinh_do = ?, ma_bo_phan = ? where id = ?";
    @Override
    public boolean suaNhanVien(NhanVien nhanVien) {
        boolean rowUpdate;
        try(Connection connection = getConnection();
            PreparedStatement statement = connection.prepareStatement(SUA_THONG_TIN_NV);){
            statement.setInt(1,nhanVien.getMaNV());
            statement.setString(2,nhanVien.getHoTen());
            statement.setString(3,nhanVien.getDate());
            statement.setString(4,nhanVien.getCMND());
            statement.setDouble(5,nhanVien.getLuong());
            statement.setString(6,nhanVien.getSdt());
            statement.setString(7,nhanVien.getEmail());
            statement.setString(8,nhanVien.getDiaChi());
            statement.setInt(9,nhanVien.getMaViTri());
            statement.setInt(10,nhanVien.getMaTrinhDo());
            statement.setInt(11,nhanVien.getMaBoPhan());

            rowUpdate = statement.executeUpdate()>0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return  rowUpdate;
    }
}
