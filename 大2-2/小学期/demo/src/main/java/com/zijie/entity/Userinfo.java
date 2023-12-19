package com.zijie.entity;

import java.io.Serializable;

/**
 * (Userinfo)实体类
 *
 * @author makejava
 * @since 2023-07-19 16:26:39
 */
public class Userinfo implements Serializable {
    private static final long serialVersionUID = 278203495611034235L;
    
    private String uname;
    
    private String upass;
    
    private Integer uid;
    
    private Integer uroot;


    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public String getUpass() {
        return upass;
    }

    public void setUpass(String upass) {
        this.upass = upass;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public Integer getUroot() {
        return uroot;
    }

    public void setUroot(Integer uroot) {
        this.uroot = uroot;
    }

}

