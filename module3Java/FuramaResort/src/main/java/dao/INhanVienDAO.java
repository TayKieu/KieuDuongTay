package dao;

import model.nhanvien.NhanVien;

import java.util.List;

public interface INhanVienDAO {
    List<NhanVien> hienThiDSNhanVien();
    NhanVien taoMoiNhanVien(NhanVien nhanVien);
}
