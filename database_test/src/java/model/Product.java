/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author dung.nguyen
 */
public class Product {
    private int id_pro = 0;
    private String name_pro = "";
    private int quantity_pro = 0;

    public int getId_pro() {
        return id_pro;
    }

    public void setId_pro(int id_pro) {
        this.id_pro = id_pro;
    }

    public String getName_pro() {
        return name_pro;
    }

    public void setName_pro(String name_pro) {
        this.name_pro = name_pro;
    }

    public int getQuantity_pro() {
        return quantity_pro;
    }

    public void setQuantity_pro(int quantity_pro) {
        this.quantity_pro = quantity_pro;
    }
    
    
}
