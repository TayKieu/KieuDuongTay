package model;

import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

public class HoKhau {
    private int ma;
    private String tenChuHo;
    private int soLuongTV;
    private Date ngayLapHoKhau;
    private String diaChi;
    private String hoTenThanhVien;
    private List<ThanhVien> thanhVienList;

    public HoKhau(String hoTenThanhVien) {
        this.hoTenThanhVien = hoTenThanhVien;
    }

    public String getHoTenThanhVien() {
        return hoTenThanhVien;
    }


    public void setHoTenThanhVien(String hoTenThanhVien) {
        this.hoTenThanhVien = hoTenThanhVien;
    }

    public HoKhau(int ma, String tenChuHo, Date ngayLapHoKhau, String diaChi) {
        this.ma = ma;
        this.tenChuHo = tenChuHo;
        this.ngayLapHoKhau = ngayLapHoKhau;
        this.diaChi = diaChi;
    }

    public HoKhau(int ma, String tenChuHo, int soLuongTV, Date ngayLapHoKhau, String diaChi) {
        this.ma = ma;
        this.tenChuHo = tenChuHo;
        this.soLuongTV = soLuongTV;
        this.ngayLapHoKhau = ngayLapHoKhau;
        this.diaChi = diaChi;
    }

    public int getMa() {
        return ma;
    }

    public void setMa(int ma) {
        this.ma = ma;
    }

    public String getTenChuHo() {
        return tenChuHo;
    }

    public void setTenChuHo(String tenChuHo) {
        this.tenChuHo = tenChuHo;
    }

    public int getSoLuongTV() {
        return soLuongTV;
    }

    public void setSoLuongTV(int soLuongTV) {
        this.soLuongTV = soLuongTV;
    }

    public Date getNgayLapHoKhau() {
        return ngayLapHoKhau;
    }

    public void setNgayLapHoKhau(Date ngayLapHoKhau) {
        this.ngayLapHoKhau = ngayLapHoKhau;
    }

    public String getDiaChi() {
        return diaChi;
    }

    public void setDiaChi(String diaChi) {
        this.diaChi = diaChi;
    }

    public List<ThanhVien> getThanhVienList() {
        return thanhVienList;
    }

    public void setThanhVienList(List<ThanhVien> thanhVienList) {
        this.thanhVienList = thanhVienList;
    }

    @Override
    public String toString() {
        return thanhVienList.stream().map(e -> e.getHoTen()).collect(Collectors.joining(","));
    }
}
