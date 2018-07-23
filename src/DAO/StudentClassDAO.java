package DAO;

import Entity.StudentClass;

import java.sql.PreparedStatement;
import java.sql.SQLException;

public class StudentClassDAO extends DBConnection {

    public void insertStudentInClass(String clasid,String rollNo,String year)
    {
        String q = "INSERT INTO studentclass( classid,stdrollno , year) VALUES (?,?,?)";
        try {
            PreparedStatement ps = con.prepareStatement(q);
            ps.setString(1,clasid);
            ps.setString(2,rollNo);
            ps.setString(3, year);
            ps.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public void updateStudentInClass(StudentClass sc){
        String q="UPDATE studentclass set boardrollno=?, classstatus=? where stdrollno=?";
        try {
            PreparedStatement ps=con.prepareStatement(q);
        ps.setString(1,sc.getBoardRollno());
        ps.setString(2,sc.getClassStatus());
        ps.setString(3,sc.getStdRollNo());
        ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
