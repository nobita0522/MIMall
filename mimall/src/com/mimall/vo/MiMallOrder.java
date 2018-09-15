package com.mimall.vo;

public class MiMallOrder {

    private String paySerialNumber;

    private Integer orderState;

    private String payMethod;

    private String createTime;

    private String payOrCancelTime;

    private String phoneNumber;

    public MiMallOrder() {
    }

    public MiMallOrder(String paySerialNumber, Integer orderState, String payMethod, String createTime, String payOrCancelTime, String phoneNumber) {
        this.paySerialNumber = paySerialNumber;
        this.orderState = orderState;
        this.payMethod = payMethod;
        this.createTime = createTime;
        this.payOrCancelTime = payOrCancelTime;
        this.phoneNumber = phoneNumber;
    }

    public String getPaySerialNumber() {
        return paySerialNumber;
    }

    public void setPaySerialNumber(String paySerialNumber) {
        this.paySerialNumber = paySerialNumber;
    }

    public Integer getOrderState() {
        return orderState;
    }

    public void setOrderState(Integer orderState) {
        this.orderState = orderState;
    }

    public String getPayMethod() {
        return payMethod;
    }

    public void setPayMethod(String payMethod) {
        this.payMethod = payMethod;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    public String getPayOrCancelTime() {
        return payOrCancelTime;
    }

    public void setPayOrCancelTime(String payOrCancelTime) {
        this.payOrCancelTime = payOrCancelTime;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }
}
