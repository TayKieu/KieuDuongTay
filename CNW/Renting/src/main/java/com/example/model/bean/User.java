package com.example.model.bean;

public class User {
    private int id;
    private String username;
    private String password;

    private String accountName;
    private String email;
    private String phone;
    public User() {
    }

    public User(int id, String username, String password, String accountName, String email, String phone) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.accountName = accountName;
        this.email = email;
        this.phone = phone;
    }

    public User(String username, String password, String accountName, String email, String phone) {
        this.username = username;
        this.password = password;
        this.accountName = accountName;
        this.email = email;
        this.phone = phone;
    }

    public String getAccountName() {
        return accountName;
    }

    public void setAccountName(String accountName) {
        this.accountName = accountName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
