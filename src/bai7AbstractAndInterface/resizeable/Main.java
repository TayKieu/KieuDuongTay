package bai7AbstractAndInterface.resizeable;

public class Main {
    public static void main(String[] args) {
        Shape a[]=new Shape[3];
        a[0]=new Rectangle(5,4);
        a[1]=new Circle(6);
        a[2]=new Square(7);
        System.out.println(a[0]);
        System.out.println(a[1]);
        System.out.println(a[2]);
        a[0].resize(20);
        a[1].resize(10);
        a[2].resize(15);
        System.out.println("After increase: "+a[0]);
        System.out.println("After increase: "+a[1]);
        System.out.println("After increase: "+a[2]);
    }
}
