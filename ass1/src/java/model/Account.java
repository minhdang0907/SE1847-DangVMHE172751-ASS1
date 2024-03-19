/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author minhdang
 */
public class Account {

    private int uID;
    private String user;
    private String pass;
    private String Email, Name, phone, address;
    private int isAdmin;

    public Account() {
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public String getName() {
        return Name;
    }

    public void setName(String Name) {
        this.Name = Name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Account(int uID, String user, String pass, int isAdmin) {
        this.uID = uID;
        this.user = user;
        this.pass = pass;
        this.isAdmin = isAdmin;
    }

    public Account(int uID, String user, String pass, String Email, String Name, String phone, String address, int isAdmin) {
        this.uID = uID;
        this.user = user;
        this.pass = pass;
        this.Email = Email;
        this.Name = Name;
        this.phone = phone;
        this.address = address;
        this.isAdmin = isAdmin;
    }
    
    

    public int getuID() {
        return uID;
    }

    public void setuID(int uID) {
        this.uID = uID;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public int getIsAdmin() {
        return isAdmin;
    }

    public void setIsAdmin(int isAdmin) {
        this.isAdmin = isAdmin;
    }

    @Override
    public String toString() {
        return "Account{" + "uID=" + uID + ", user=" + user + ", pass=" + pass + ", isAdmin=" + isAdmin + '}';
    }

}
