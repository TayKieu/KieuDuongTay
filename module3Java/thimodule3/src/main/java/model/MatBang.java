package model;

import java.util.Date;

public class MatBang {
    private String ma;
    private int dienTich;
    private String trangThai;
    private int tang;
    private int loaiVanPhong;
    private String tenLoaiVanPhong;
    private int giaThue;
    private Date ngayBatDau;
    private Date ngayKetThuc;

    public MatBang(String ma, int dienTich, String trangThai, int tang, int loaiVanPhong, String tenLoaiVanPhong, int giaThue, Date ngayBatDau, Date ngayKetThuc) {
        this.ma = ma;
        this.dienTich = dienTich;
        this.trangThai = trangThai;
        this.tang = tang;
        this.loaiVanPhong = loaiVanPhong;
        this.tenLoaiVanPhong = tenLoaiVanPhong;
        this.giaThue = giaThue;
        this.ngayBatDau = ngayBatDau;
        this.ngayKetThuc = ngayKetThuc;
    }

    public MatBang(String ma, int dienTich, String trangThai, int tang, int loaiVanPhong, int giaThue, Date ngayBatDau, Date ngayKetThuc) {
        this.ma = ma;
        this.dienTich = dienTich;
        this.trangThai = trangThai;
        this.tang = tang;
        this.loaiVanPhong = loaiVanPhong;
        this.giaThue = giaThue;
        this.ngayBatDau = ngayBatDau;
        this.ngayKetThuc = ngayKetThuc;
    }

    public String getMa() {
        return ma;
    }

    public void setMa(String ma) {
        ma = ma;
    }

    public int getDienTich() {
        return dienTich;
    }

    public void setDienTich(int dienTich) {
        this.dienTich = dienTich;
    }

    public String getTrangThai() {
        return trangThai;
    }

    public void setTrangThai(String trangThai) {
        this.trangThai = trangThai;
    }

    public int getTang() {
        return tang;
    }

    public void setTang(int tang) {
        this.tang = tang;
    }

    public int getLoaiVanPhong() {
        return loaiVanPhong;
    }

    public void setLoaiVanPhong(int loaiVanPhong) {
        this.loaiVanPhong = loaiVanPhong;
    }

    public String getTenLoaiVanPhong() {
        return tenLoaiVanPhong;
    }

    public void setTenLoaiVanPhong(String tenLoaiVanPhong) {
        this.tenLoaiVanPhong = tenLoaiVanPhong;
    }

    public int getGiaThue() {
        return giaThue;
    }

    public void setGiaThue(int giaThue) {
        this.giaThue = giaThue;
    }

    public Date getNgayBatDau() {
        return ngayBatDau;
    }

    public void setNgayBatDau(Date ngayBatDau) {
        this.ngayBatDau = ngayBatDau;
    }

    public Date getNgayKetThuc() {
        return ngayKetThuc;
    }

    public void setNgayKetThuc(Date ngayKetThuc) {
        this.ngayKetThuc = ngayKetThuc;
    }
}
