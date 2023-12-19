package com.zijie.entity;

import java.io.Serializable;

/**
 * (Cardinfo)实体类
 *
 * @author makejava
 * @since 2023-07-18 14:45:03
 */
public class Cardinfo implements Serializable {
    private static final long serialVersionUID = 317225319605783703L;
    
    private Integer cardid;
    
    private Integer balance;
    
    private Integer uid;
    
    private String uname;


    public Integer getCardid() {
        return cardid;
    }

    public void setCardid(Integer cardid) {
        this.cardid = cardid;
    }

    public Integer getBalance() {
        return balance;
    }

    public void setBalance(Integer balance) {
        this.balance = balance;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

}

