package model;

import java.util.Date;

public class HoKhau {
    private int ma;
    private String tenChuHo;
    private int soLuongTV;
    private Date ngayLapHoKhau;
    private String diaChi;

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
}
