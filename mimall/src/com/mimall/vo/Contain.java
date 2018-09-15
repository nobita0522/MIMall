package com.mimall.vo;

public class Contain {

    private String paySerialNumber;

    private Integer pid;

    private Integer purchaseNumber;

    public Contain() {
    }

    public Contain(String paySerialNumber, Integer pid, Integer purchaseNumber) {
        this.paySerialNumber = paySerialNumber;
        this.pid = pid;
        this.purchaseNumber = purchaseNumber;
    }

    public String getPaySerialNumber() {
        return paySerialNumber;
    }

    public void setPaySerialNumber(String paySerialNumber) {
        this.paySerialNumber = paySerialNumber;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public Integer getPurchaseNumber() {
        return purchaseNumber;
    }

    public void setPurchaseNumber(Integer purchaseNumber) {
        this.purchaseNumber = purchaseNumber;
    }
}
