package com.example.model.bean;

public class RentDetail {
    private int rentDetailId;
    private String area;
    private String address;
    private int acreage;
    private String info;
    private int prices;
    private String title;
    private String img;
    private int rentTypeId;
    private int ownerId;
    private String ownerAccountName;
    private String ownerEmail;
    private String ownerPhone;

    public RentDetail() {
    }

    public RentDetail(int rentDetailId, String area, String address, int acreage, String info, int prices, String title, String img, int rentTypeId, int ownerId, String ownerAccountName, String ownerEmail, String ownerPhone) {
        this.rentDetailId = rentDetailId;
        this.area = area;
        this.address = address;
        this.acreage = acreage;
        this.info = info;
        this.prices = prices;
        this.title = title;
        this.img = img;
        this.rentTypeId = rentTypeId;
        this.ownerId = ownerId;
        this.ownerAccountName = ownerAccountName;
        this.ownerEmail = ownerEmail;
        this.ownerPhone = ownerPhone;
    }

    public RentDetail(int rentDetailId, String area, String address, int acreage, String info, int prices, String title, String img, int rentTypeId, int ownerId) {
        this.rentDetailId = rentDetailId;
        this.area = area;
        this.address = address;
        this.acreage = acreage;
        this.info = info;
        this.prices = prices;
        this.title = title;
        this.img = img;
        this.rentTypeId = rentTypeId;
        this.ownerId = ownerId;
    }

    public RentDetail(String area, String address, int acreage, String info, int prices, String title, String img, int rentTypeId, int ownerId) {
        this.area = area;
        this.address = address;
        this.acreage = acreage;
        this.info = info;
        this.prices = prices;
        this.title = title;
        this.img = img;
        this.rentTypeId = rentTypeId;
        this.ownerId = ownerId;
    }

    public String getOwnerAccountName() {
        return ownerAccountName;
    }

    public void setOwnerAccountName(String ownerAccountName) {
        this.ownerAccountName = ownerAccountName;
    }

    public String getOwnerEmail() {
        return ownerEmail;
    }

    public void setOwnerEmail(String ownerEmail) {
        this.ownerEmail = ownerEmail;
    }

    public String getOwnerPhone() {
        return ownerPhone;
    }

    public void setOwnerPhone(String ownerPhone) {
        this.ownerPhone = ownerPhone;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public int getRentDetailId() {
        return rentDetailId;
    }

    public void setRentDetailId(int rentDetailId) {
        this.rentDetailId = rentDetailId;
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Integer getAcreage() {
        return acreage;
    }

    public void setAcreage(Integer acreage) {
        this.acreage = acreage;
    }

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    public Integer getPrices() {
        return prices;
    }

    public void setPrices(Integer prices) {
        this.prices = prices;
    }

    public int getRentTypeId() {
        return rentTypeId;
    }

    public void setRentTypeId(int rentTypeId) {
        this.rentTypeId = rentTypeId;
    }

    public int getOwnerId() {
        return ownerId;
    }

    public void setOwnerId(int ownerId) {
        this.ownerId = ownerId;
    }
}
