package Model;

public class Customer {
    private String name;
    private int birth;
    private String address;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getBirth() {
        return birth;
    }

    public void setBirth(int birth) {
        this.birth = birth;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public Customer(String name, int birth, String address, String image) {
        this.name = name;
        this.birth = birth;
        this.address = address;
        this.image = image;
    }

    public Customer() {
    }

    private String image;
}
