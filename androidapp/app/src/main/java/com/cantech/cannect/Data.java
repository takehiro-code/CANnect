package com.cantech.cannect;

public class Data {
    private String pid;
    private String value;

    public Data(String pid){
        this.pid = pid;
    }
    public Data(String pid, String value) {
        this.pid = pid;
        this.value = value;
    }

    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }
}
