/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Windows 10
 */
public class ProductProcess {

    private final Connection conn;

    public ProductProcess() {
        this.conn = DBConnection.getConnection();
    }
    
    public ArrayList<String> getListNameCategory (){
        ArrayList<String> listCate = new ArrayList<String> ();
        String sql = "SELECT * FROM tblCategory";
        try {
            ResultSet rs = conn.createStatement().executeQuery(sql);
            while (rs.next()){
                listCate.add(rs.getString("CatName"));
            }
            rs.close();
        } catch (SQLException ex) {
            Logger.getLogger(ProductProcess.class.getName()).log(Level.SEVERE, null, ex);
        }        
        return listCate;
    }
    
    public static void main(String[] args) {
        ProductProcess pp = new ProductProcess();
        for (String str: pp.getListNameCategory()){
            System.out.println("+ "+str);
        }
    }

}
