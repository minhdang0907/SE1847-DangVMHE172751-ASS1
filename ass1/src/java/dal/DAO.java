 /*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Account;
import model.Category;
import model.Ordered;
import model.Product;
import model.Transactions;

/**
 *
 * @author minhdang
 */
public class DAO extends DBContext {

    public Product getProductById(String Id) {

        String sql = "select * from Product where Id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, Id);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("Id"));
                p.setName(rs.getString("Name"));
                p.setPrice(rs.getDouble("Price"));
                p.setColor(rs.getString("Color"));
                p.setImages(rs.getString("Images"));
                p.setDescription(rs.getString("Description"));
                p.setCateid(rs.getInt(7));
                return p;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Product> getProbyCate(int cateid) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product where CateId = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, cateid);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("Id"));
                p.setName(rs.getString("Name"));
                p.setPrice(rs.getDouble("Price"));
                p.setColor(rs.getString("Color"));
                p.setImages(rs.getString("Images"));
                p.setDescription(rs.getString("Description"));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> getRelatedProduct() {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT TOP 3 * FROM product\n"
                + "ORDER BY NEWID();";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("Id"));
                p.setName(rs.getString("Name"));
                p.setPrice(rs.getDouble("Price"));
                p.setColor(rs.getString("Color"));
                p.setImages(rs.getString("Images"));
                p.setDescription(rs.getString("Description"));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> searchByName(String txtSearch) {
        List<Product> list1 = new ArrayList<>();
        String sql = "select * from Product where [Name] like ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + txtSearch + "%");
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("Id"));
                p.setName(rs.getString("Name"));
                p.setPrice(rs.getDouble("Price"));
                p.setColor(rs.getString("Color"));
                p.setImages(rs.getString("Images"));
                p.setDescription(rs.getString("Description"));
                list1.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list1;
    }

    public Account login(String user, String pass) {
        String sql = "select * from Account where [user]=? and pass=?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, user);
            ps.setString(2, pass);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Account a = new Account();
                a.setuID(rs.getInt("uID"));
                a.setUser(rs.getString("user"));
                a.setPass(rs.getString("pass"));
                a.setIsAdmin(rs.getInt("isAdmin"));
                a.setEmail(rs.getString("Email"));
                a.setPhone(rs.getString("phone"));
                a.setName(rs.getString("Name"));
                a.setAddress(rs.getString("address"));
                return a;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public Account checkAccountExist(String user) {
        String sql = "select * from Account where [user] = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, user);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Account a = new Account();
                a.setuID(rs.getInt("uID"));
                a.setUser(rs.getString("user"));
                a.setPass(rs.getString("pass"));
                a.setIsAdmin(rs.getInt("isAdmin"));
                a.setEmail(rs.getString("Email"));
                a.setPhone(rs.getString("phone"));
                a.setName(rs.getString("Name"));
                a.setAddress(rs.getString("address"));
                return a;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void Register(String user, String pass,String email, String phone, String name, String address) {
        String sql = "insert into Account values(?,?,0,?,?,?,?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, user);
            ps.setString(2, pass);
            ps.setString(3, email);
            ps.setString(4, name);
            ps.setString(5, phone);
            ps.setString(6, address);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }

    }

    public List<Product> getAllProduct() {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product join Category on Product.CateId = Category.CateId ";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("Id"));
                p.setName(rs.getString("Name"));
                p.setPrice(rs.getDouble("Price"));
                p.setColor(rs.getString("Color"));
                p.setImages(rs.getString("Images"));
                p.setDescription(rs.getString("Description"));
                p.setCateid(rs.getInt("cateid"));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Category> getAllCategory() {
        List<Category> list = new ArrayList<>();
        String sql = "select * from Category";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Category c = new Category();
                c.setCateId(rs.getInt("CateId"));
                c.setCateName(rs.getString("CateName"));
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public void deleteProduct(String id) {
        String sql = "delete from Product where Id=?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void addProduct(String name, int catId, String price, String color, String images, String description) {
        String sql = "INSERT INTO Product (Name, Price, Color, Images, Description, CateId) VALUES\n"
                + "    (?,?,?,?,?,?);";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, price);
            ps.setString(3, color);
            ps.setString(4, images);
            ps.setString(5, description);
            ps.setInt(6, catId);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void editProduct(int id, String name, int catId, String price, String color, String images, String description) {
        String sql = "update Product set Name=?,Price=?,Color=?, Images=?, Description=?, CateId=? where Id=?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, price);
            ps.setString(3, color);
            ps.setString(4, images);
            ps.setString(5, description);
            ps.setInt(6, catId);
            ps.setInt(7, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public Account getAccountById(String uID) {

        String sql = "select * from Account where uID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, uID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Account a = new Account();
                a.setuID(rs.getInt("uID"));
                a.setUser(rs.getString("user"));
                a.setPass(rs.getString("pass"));
                a.setIsAdmin(rs.getInt("isAdmin"));
                a.setEmail(rs.getString("Email"));
                a.setPhone(rs.getString("phone"));
                a.setName(rs.getString("Name"));
                a.setAddress(rs.getString("address"));
                return a;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void editAccount(String user, String pass, int uID, String email, String phone, String name, String address) {
        String sql = "update Account set [user] = ?,pass=? , Email=?,Name = ?, phone = ? , address = ? where [uID]=?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, user);
            ps.setString(2, pass);
            ps.setString(3, email);
            ps.setString(4, name);
            ps.setString(5, phone);
            ps.setString(6, address);
            ps.setInt(7, uID);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public Category getCategory(int id) {
        String sql = "select * from Category where CateId=?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Category c = new Category(rs.getInt(1), rs.getString(2));
                return c;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Product> getIphone() {
        List<Product> list = new ArrayList<>();
        String sql = "select top 4 * from Product where CateId = 1";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("Id"));
                p.setName(rs.getString("Name"));
                p.setPrice(rs.getDouble("Price"));
                p.setColor(rs.getString("Color"));
                p.setImages(rs.getString("Images"));
                p.setDescription(rs.getString("Description"));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> getIpad() {
        List<Product> list = new ArrayList<>();
        String sql = "select top 4 * from Product where CateId = 2";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("Id"));
                p.setName(rs.getString("Name"));
                p.setPrice(rs.getDouble("Price"));
                p.setColor(rs.getString("Color"));
                p.setImages(rs.getString("Images"));
                p.setDescription(rs.getString("Description"));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> getMac() {
        List<Product> list = new ArrayList<>();
        String sql = "select top 4 * from Product where CateId = 3";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("Id"));
                p.setName(rs.getString("Name"));
                p.setPrice(rs.getDouble("Price"));
                p.setColor(rs.getString("Color"));
                p.setImages(rs.getString("Images"));
                p.setDescription(rs.getString("Description"));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> getWatch() {
        List<Product> list = new ArrayList<>();
        String sql = "select top 4 * from Product where CateId = 4";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("Id"));
                p.setName(rs.getString("Name"));
                p.setPrice(rs.getDouble("Price"));
                p.setColor(rs.getString("Color"));
                p.setImages(rs.getString("Images"));
                p.setDescription(rs.getString("Description"));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;

    }

    public List<Product> getPk() {
        List<Product> list5 = new ArrayList<>();
        String sql = "select top 4 * from Product where CateId = 5";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("Id"));
                p.setName(rs.getString("Name"));
                p.setPrice(rs.getDouble("Price"));
                p.setColor(rs.getString("Color"));
                p.setImages(rs.getString("Images"));
                p.setDescription(rs.getString("Description"));
                list5.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list5;
    }

    public void insertTran(Transactions transaction) {
        String sql = "INSERT INTO transactions(user_session,user_name,user_mail,user_phone,address,message,amount,payment,status,created) VALUES (?,?,?,?,?,?,?,?,?,?)";

        try {
            String status = null;
            if (transaction.getPayment().equals("1")) {
                status = "1";
            } else {
                status = "0";
            }
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, transaction.getUser_session());
            ps.setString(2, transaction.getUser_name());
            ps.setString(3, transaction.getUser_mail());
            ps.setString(4, transaction.getUser_phone());
            ps.setString(5, transaction.getAddress());
            ps.setString(6, transaction.getMessage());
            ps.setString(7, transaction.getAmount());
            ps.setString(8, transaction.getPayment());
            ps.setString(9, status);
            ps.setString(10, transaction.getCreated());
            ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Transactions> getAllTran() {
        List<Transactions> transactions = new ArrayList<Transactions>();
        String sql = "SELECT * FROM transactions";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Transactions transaction = new Transactions();
                transaction.setId(rs.getInt("id"));
                transaction.setUser_session(rs.getString("user_session"));
                transaction.setUser_name(rs.getString("user_name"));
                transaction.setUser_mail(rs.getString("user_mail"));
                transaction.setUser_phone(rs.getString("user_phone"));
                transaction.setAddress(rs.getString("address"));
                transaction.setMessage(rs.getString("message"));
                transaction.setAmount(rs.getString("amount"));
                transaction.setPayment(rs.getString("payment"));
                transaction.setStatus(rs.getString("status"));
                transaction.setCreated(rs.getString("created"));
                transactions.add(transaction);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return transactions;
    }

    public void insertOrd(Ordered ordered) {
        String sql = "INSERT INTO ordered(product_id, transaction_id,qty) VALUES (?, ?, ?)";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, ordered.getProduct_id());
            ps.setInt(2, Integer.parseInt(ordered.getTransaction_id()));
            ps.setInt(3, ordered.getQty());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {

    }
}
