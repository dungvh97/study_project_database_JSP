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
public class Member {
    private int id_mem = 0;
    private String name_mem = "";
    private int save_mark = 0;

    public int getId_mem() {
        return id_mem;
    }

    public void setId_mem(int id_mem) {
        this.id_mem = id_mem;
    }

    public int getSave_mark() {
        return save_mark;
    }

    public void setSave_mark(int save_mark) {
        this.save_mark = save_mark;
    }

    public String getName_mem() {
        return name_mem;
    }

    public void setName_mem(String name_mem) {
        this.name_mem = name_mem;
    }
    
    
}
