/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import entities.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.UUID;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Windows 10
 */
public class UserProcess {

    private final Connection conn;

    public UserProcess() {
        this.conn = DBConnection.getConnection();
    }

    public boolean checkLogin(String user, String pass) {
        String sql = "SELECT * FROM tblUser WHERE Username=? and Password=? and CodeActive = null";
        try {
            PreparedStatement prst = conn.prepareStatement(sql);
            prst.setString(1, user);
            prst.setString(2, pass);
            ResultSet rs = prst.executeQuery();
            return rs.next();
        } catch (SQLException ex) {
        }
        return false;
    }

    public User getUserByUserName(String userName) {
        User u = new User();
        String sql = "SELECT * FROM tblUser AS u, tblProfile AS p WHERE Username = '" + userName + "' AND u.UserId = p.UserId";
        try {
            ResultSet rs = conn.createStatement().executeQuery(sql);
            while (rs.next()) {
                u.setUserId(rs.getString("UserId"));
                u.setUserName(rs.getString("Username"));
                u.setEmail(rs.getString("Email"));
                u.setRole(rs.getInt("Role"));
                u.setProId(rs.getString("ProId"));
                u.setDateCreated(rs.getDate("DateCreated"));
                u.setFullName(rs.getString("FullName"));
                u.setGender(rs.getInt("Gender"));
                u.setAddress(rs.getString("Address"));
                u.setPhone(rs.getString("PhoneNumber"));
                u.setAvatar(rs.getString("AvatarImage"));
                u.setDescription(rs.getString("Description"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserProcess.class.getName()).log(Level.SEVERE, null, ex);
        }
        return u;
    }

    public ArrayList<String> getListId(String column, String table) {
        ArrayList<String> listId = new ArrayList<>();
        String sql = "SELECT " + column + " FROM " + table + "";
        try {
            try (ResultSet rs = conn.createStatement().executeQuery(sql)) {
                while (rs.next()) {
                    String id = rs.getString(column);
                    listId.add(id);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserProcess.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listId;
    }

    public String takeId(String type, String column, String table) {
        ArrayList<String> listId = getListId(column, table);
        boolean loop = true;
        String id = null;
        while (loop) {
            String uuid = type + UUID.randomUUID().toString().substring(0, 8);
            for (String str : listId) {
                if (!listId.contains(uuid)) {
                    id = uuid;
                    loop = false;
                    break;
                }
            }
        }
        return id;
    }

    public boolean registerUser(String id, String userName, String pass, String email, int role, String codeActive) {
        String sql = "INSERT INTO tblUser (UserId, Username, [Password], Email, [Role], CodeActive) VALUES (?,?,?,?,?,?)";
        boolean f = false;
        try {
            PreparedStatement prst = conn.prepareStatement(sql);
            prst.setString(1, id);
            prst.setString(2, userName);
            prst.setString(3, pass);
            prst.setString(4, email);
            prst.setInt(5, role);
            prst.setString(6, codeActive);

            return f = prst.executeUpdate() > 0;
        } catch (SQLException ex) {
            Logger.getLogger(UserProcess.class.getName()).log(Level.SEVERE, null, ex);
        }
        return f;
    }

    public boolean profileUser(String id, String fullName, String fullNameEng,
            int gender, String address, String numberPhone, String bio, String idUser) {

        return false;
    }

    public static void main(String[] args) {
        UserProcess up = new UserProcess();

    }

}
