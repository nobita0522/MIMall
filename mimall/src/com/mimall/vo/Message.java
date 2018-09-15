package com.mimall.vo;

public class Message {

    private boolean success;

    private String inf;

    public Message(boolean success, String inf) {
        this.success = success;
        this.inf = inf;
    }

    public boolean isSuccess() {
        return success;
    }

    public void setSuccess(boolean success) {
        this.success = success;
    }

    public String getInf() {
        return inf;
    }

    public void setInf(String inf) {
        this.inf = inf;
    }
}
