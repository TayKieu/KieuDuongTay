package arr.minelement;

import java.util.Scanner;

public class MinElement {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.println("Nhập số lượng phần tử cho mảng");
        int n = sc.nextInt();
        int arr[] = new int[n];
        System.out.println("Nhập phần tử");
        for(int i =0;i<n;i++){
            System.out.print("arr["+i+"]=");
            arr[i]= sc.nextInt();
        }
        int min = arr[0];
        for(int i = 1; i<n;i++){
            if(arr[i]<min){
                min = arr[i];
            }
        }
        System.out.println("Phần tử nhỏ nhất là:"+min);
    }
}
