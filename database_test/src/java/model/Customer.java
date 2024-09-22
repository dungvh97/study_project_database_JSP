/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Date;

/**
 *
 * @author dung.nguyen
 */
public class Customer {
    private int id_cus = 0;
    private int id_mem = 0;
    private String district = null;
    private String day = null;
    private int pay = 0;

    public int getId_cus() {
        return id_cus;
    }

    public void setId_cus(int id_cus) {
        this.id_cus = id_cus;
    }

    public int getId_mem() {
        return id_mem;
    }

    public void setId_mem(int id_mem) {
        this.id_mem = id_mem;
    }

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    public String getDay() {
        return day;
    }

    public void setDay(String day) {
        this.day = day;
    }

    public int getPay() {
        return pay;
    }

    public void setPay(int pay) {
        this.pay = pay;
    }
    
    
}
