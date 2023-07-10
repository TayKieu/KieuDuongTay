package dao;

import model.nhanvien.NhanVien;

import java.util.List;

public interface INhanVienDAO {
    List<NhanVien> hienThiDSNhanVien();
    void taoMoiNhanVien(NhanVien nhanVien);
    NhanVien layNVTheoMaNV(int maNV);
    boolean suaNhanVien(NhanVien nhanVien);
}
