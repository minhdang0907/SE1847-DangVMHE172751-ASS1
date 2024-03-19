/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author minhdang
 */
public class Ordered {

    private String id;
    private int product_id;
    private String transaction_id;
    private int qty;

    public Ordered() {
        super();
    }

    public Ordered(String id, int product_id, String transaction_id, int qty) {
        super();
        this.id = id;
        this.product_id = product_id;
        this.transaction_id = transaction_id;
        this.qty = qty;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public String getTransaction_id() {
        return transaction_id;
    }

    public void setTransacsion_id(String transaction_id) {
        this.transaction_id = transaction_id;
    }

    public int getQty() {
        return qty;
    }

    public void setQty(int qty) {
        this.qty = qty;
    }

    @Override
    public String toString() {
        return "Ordered [id=" + id + ", product_id=" + product_id + ", transaction_id=" + transaction_id + ", qty="
                + qty + "]";
    }
}
