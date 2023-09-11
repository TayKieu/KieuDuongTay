package model;

import java.util.Date;

public class ThanhVien {
    private String CCCD;
    private String hoTen;
    private Date ngaySinh;
    private int maHoKhau;

    public ThanhVien(String hoTen) {
        this.hoTen = hoTen;
    }


    public ThanhVien(String CCCD, String hoTen, Date ngaySinh, int maHoKhau) {
        this.CCCD = CCCD;
        this.hoTen = hoTen;
        this.ngaySinh = ngaySinh;
        this.maHoKhau = maHoKhau;
    }

    public ThanhVien(String CCCD, String hoTen, Date ngaySinh) {
        this.CCCD = CCCD;
        this.hoTen = hoTen;
        this.ngaySinh = ngaySinh;
    }

    public int getMaHoKhau() {
        return maHoKhau;
    }

    public void setMaHoKhau(int maHoKhau) {
        this.maHoKhau = maHoKhau;
    }

    public String getCCCD() {
        return CCCD;
    }

    public void setCCCD(String CCCD) {
        this.CCCD = CCCD;
    }

    public String getHoTen() {
        return hoTen;
    }

    public void setHoTen(String hoTen) {
        this.hoTen = hoTen;
    }

    public Date getNgaySinh() {
        return ngaySinh;
    }

    public void setNgaySinh(Date ngaySinh) {
        this.ngaySinh = ngaySinh;
    }

}
