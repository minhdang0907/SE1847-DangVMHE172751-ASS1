/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author minhdang
 */
public class Product {
    private int Id;
    private String Name;
    private double Price;
    private String Color;
    private String Images;
    private String Description;
    public int cateid;
    

    public Product() {
    }

    public Product(int Id, String Name, double Price, String Color, String Images, String Description, int cateid) {
        this.Id = Id;
        this.Name = Name;
        this.Price = Price;
        this.Color = Color;
        this.Images = Images;
        this.Description = Description;
        this.cateid = cateid;
    }

    public int getId() {
        return Id;
    }

    public void setId(int Id) {
        this.Id = Id;
    }

    public String getName() {
        return Name;
    }

    public void setName(String Name) {
        this.Name = Name;
    }

    public double getPrice() {
        return Price;
    }

    public void setPrice(double Price) {
        this.Price = Price;
    }

    public String getColor() {
        return Color;
    }

    public void setColor(String Color) {
        this.Color = Color;
    }

    public String getImages() {
        return Images;
    }

    public void setImages(String Images) {
        this.Images = Images;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String Description) {
        this.Description = Description;
    }

    public int getCateid() {
        return cateid;
    }

    public void setCateid(int cateid) {
        this.cateid = cateid;
    }

    @Override
    public String toString() {
        return "Product{" + "Id=" + Id + ", Name=" + Name + ", Price=" + Price + ", Color=" + Color + ", Images=" + Images + ", Description=" + Description + ", cateid=" + cateid + '}';
    }

   
    

    
}
