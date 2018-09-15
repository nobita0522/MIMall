package com.mimall.vo;

import java.util.List;

public class ClientMiMallOrder {

    private MiMallOrder miMallOrder;
    private Users user;   // 先不处理，应该是地址售后人，此处默认使用miMallUser;
    private List<Product> products;
    private List<Integer> purchaseNumbers;

    public ClientMiMallOrder() {
    }

    public MiMallOrder getMiMallOrder() {
        return miMallOrder;
    }

    public void setMiMallOrder(MiMallOrder miMallOrder) {
        this.miMallOrder = miMallOrder;
    }

    public Users getUser() {
        return user;
    }

    public void setUser(Users user) {
        this.user = user;
    }

    public List<Product> getProducts() {
        return products;
    }

    public void setProducts(List<Product> products) {
        this.products = products;
    }

    public List<Integer> getPurchaseNumbers() {
        return purchaseNumbers;
    }

    public void setPurchaseNumbers(List<Integer> purchaseNumbers) {
        this.purchaseNumbers = purchaseNumbers;
    }
}
