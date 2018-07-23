package DAO;

import Entity.Users;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class UsersDAO extends DBConnection {
    PreparedStatement preparedStatement = null;
    String query = "";

    public void inerstUser(Users users) {
        query = "INSERT INTO Users (username, password,role) VALUES (?,?,?)";
        try {
            preparedStatement = con.prepareStatement(query);
            preparedStatement.setString(1, users.getUserName());
            preparedStatement.setString(2, users.getPassword());
            preparedStatement.setString(3, users.getRole());
            System.out.println(preparedStatement.execute());
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    /////////////////////////////////////////////////////????
    public ArrayList displayUsers() {
        //  Users users=new Users();
        ArrayList<Users> array = new ArrayList<>();
        query = "SELECT * FROM users";
        try {
            preparedStatement = con.prepareStatement(query);
            ResultSet rs = preparedStatement.executeQuery();
            // rs.next();
            while (rs.next()) {
                Users users = new Users();
                String userName = rs.getString(1);
                String passwd = rs.getString(2);
                String role = rs.getString(3);

                users.setUserName(userName);
                users.setPassword(passwd);
                array.add(users);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return array;
    }

    /////////////////////////////////////////////////////////////?????
    public void updateUsers(String oldUserName, Users user) {
        // System.out.println(user.getPassword());//password=user.getPassword());
        try {
            query = "UPDATE users SET password=? WHERE username= ?";
            preparedStatement.setString(1, user.getPassword());
            preparedStatement.setString(2, oldUserName);

            preparedStatement = con.prepareStatement(query);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    /////////////////////////////////////////////////////////////*
    public void deleteUser(String userName) {
        query = "DELETE FROM users WHERE user_name=?";
        try {
            preparedStatement = con.prepareStatement(query);
            preparedStatement.setString(1, userName);
            System.out.println(preparedStatement.execute());
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    public Users searchUsers(String uname) {
        query = "SELECT username,password,role FROM  users WHERE  username=?";
        Users user = new Users();
        try {
            preparedStatement = con.prepareStatement(query);
            preparedStatement.setString(1, uname);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                user.setUserName(rs.getString(1));
                user.setPassword(rs.getString(2));
                user.setRole(rs.getString(3));
            } else {
                user.setPassword("");
                user.setUserName("");
                user.setRole("");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;

    }

}
