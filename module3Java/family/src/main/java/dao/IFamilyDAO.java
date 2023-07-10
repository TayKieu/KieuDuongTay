package dao;

import model.HoKhau;
import model.ThanhVien;

import java.awt.*;
import java.util.List;

public interface IFamilyDAO {
List<HoKhau> hienThiTatCaHoKhau();
HoKhau layHoKhauTheoId(int id);
Boolean suaHoKhau(HoKhau hoKhau);

}
