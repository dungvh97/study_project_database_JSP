/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.Date;

/**
 *
 * @author dung.nguyen
 */
public class Cus_pro {
    private int id_cus = 0;
    private int id_pro = 0;
    private int quantity_detail = 0;

    public int getId_cus() {
        return id_cus;
    }

    public void setId_cus(int id_cus) {
        this.id_cus = id_cus;
    }

    public int getId_pro() {
        return id_pro;
    }

    public void setId_pro(int id_pro) {
        this.id_pro = id_pro;
    }

    public int getQuantity_detail() {
        return quantity_detail;
    }

    public void setQuantity_detail(int quantity_detail) {
        this.quantity_detail = quantity_detail;
    }
    
    Date day = new Date();
    

}
