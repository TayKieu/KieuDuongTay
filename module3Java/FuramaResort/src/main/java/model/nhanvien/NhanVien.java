package model.nhanvien;

public class NhanVien {
    private int maNV;
    private String hoTen;
    private String date;
    private String CMND;
    private double luong;
    private String sdt;
    private String email;
    private String diaChi;
    private int maViTri;
    private int maTrinhDo;
    private int maBoPhan;
    private String viTri;
    private String trinhDo;
    private String boPhan;

    public NhanVien(int maNV, String hoTen, String date, String CMND, double luong, String sdt, String email, String diaChi, int maViTri, int maTrinhDo, int maBoPhan) {
        this.maNV = maNV;
        this.hoTen = hoTen;
        this.date = date;
        this.CMND = CMND;
        this.luong = luong;
        this.sdt = sdt;
        this.email = email;
        this.diaChi = diaChi;
        this.maViTri = maViTri;
        this.maTrinhDo = maTrinhDo;
        this.maBoPhan = maBoPhan;
    }

    public NhanVien(int maNV, String hoTen, String date, String CMND,
                    double luong, String sdt, String email, String diaChi, String viTri, String trinhDo, String boPhan) {
        this.maNV = maNV;
        this.hoTen = hoTen;
        this.date = date;
        this.CMND = CMND;
        this.luong = luong;
        this.sdt = sdt;
        this.email = email;
        this.diaChi = diaChi;
        this.viTri = viTri;
        this.trinhDo = trinhDo;
        this.boPhan = boPhan;
    }

    public int getMaViTri() {
        return maViTri;
    }

    public void setMaViTri(int maViTri) {
        this.maViTri = maViTri;
    }

    public int getMaTrinhDo() {
        return maTrinhDo;
    }

    public void setMaTrinhDo(int maTrinhDo) {
        this.maTrinhDo = maTrinhDo;
    }

    public int getMaBoPhan() {
        return maBoPhan;
    }

    public void setMaBoPhan(int maBoPhan) {
        this.maBoPhan = maBoPhan;
    }

    public String getViTri() {
        return viTri;
    }

    public void setViTri(String viTri) {
        this.viTri = viTri;
    }

    public String getTrinhDo() {
        return trinhDo;
    }

    public void setTrinhDo(String trinhDo) {
        this.trinhDo = trinhDo;
    }

    public String getBoPhan() {
        return boPhan;
    }

    public void setBoPhan(String boPhan) {
        this.boPhan = boPhan;
    }


    public int getMaNV() {
        return maNV;
    }

    public void setMaNV(int maNV) {
        this.maNV = maNV;
    }

    public String getHoTen() {
        return hoTen;
    }

    public void setHoTen(String hoTen) {
        this.hoTen = hoTen;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getCMND() {
        return CMND;
    }

    public void setCMND(String CMND) {
        this.CMND = CMND;
    }

    public double getLuong() {
        return luong;
    }

    public void setLuong(double luong) {
        this.luong = luong;
    }

    public String getSdt() {
        return sdt;
    }

    public void setSdt(String sdt) {
        this.sdt = sdt;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getDiaChi() {
        return diaChi;
    }

    public void setDiaChi(String diaChi) {
        this.diaChi = diaChi;
    }
}
