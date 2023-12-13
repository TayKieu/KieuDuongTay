package com.example.model.bean;

public class RentType {
    private int rentTypeId;
    private String name;

    public RentType() {
    }

    public RentType(int rentTypeId, String name) {
        this.rentTypeId = rentTypeId;
        this.name = name;
    }

    public int getRentTypeId() {
        return rentTypeId;
    }

    public void setRentTypeId(int rentTypeId) {
        this.rentTypeId = rentTypeId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
