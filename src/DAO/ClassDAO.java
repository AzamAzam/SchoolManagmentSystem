package DAO;

import Entity.Class;
import Entity.Student;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ClassDAO extends DBConnection {
    public void insertClass(Class cls) throws SQLException {
        String query = "INSERT INTO class (name) VALUES (?)";
        PreparedStatement preparedStatement = con.prepareStatement(query);
        preparedStatement.setString(1, cls.getClassName());
        //      preparedStatement.setString(2,cls.getClassId());
        preparedStatement.executeUpdate();

    }

    public void updateClass(Class cls) {
        String query = "UPDATE class SET name=?  WHERE  class_id=?";
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = con.prepareStatement(query);

            preparedStatement.setString(1, cls.getClassName());
            preparedStatement.setString(2, cls.getClassId());
            System.out.println(preparedStatement.executeUpdate());
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    public void deleteClass(Class cls) {
        String query = "DELETE FROM  class WHERE class_id=?";
        try {
            PreparedStatement preparedStatement = con.prepareStatement(query);
            preparedStatement.setString(1, cls.getClassId());
            System.out.println(preparedStatement.execute());

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public ArrayList<Class> allClasses() {
        PreparedStatement preparedStatement = null;
        ArrayList<Class> arrayList = new ArrayList<Class>();
        String query = "SELECT * FROM class";
        try {
            preparedStatement = con.prepareStatement(query);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                Class cls = new Class();
                cls.setClassName(rs.getString("name"));
                cls.setClassId(rs.getString("id"));
                arrayList.add(cls);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return arrayList;
    }

    public void insertCourseInClass(String clsId, String crsId, String year) {
        String q = "INSERT INTO courseclass( courseid, classid, year) VALUES (?,?,?)";
        try {
            PreparedStatement ps = con.prepareStatement(q);
            ps.setString(1, crsId);
            ps.setString(2, clsId);
            ps.setString(3, year);
            ps.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public ArrayList<Student> getStudents(String classid){
        ArrayList<Student> students=new ArrayList<>();
        String q="SELECT stdrollno,stdname from studentclass sc ,student s WHERE sc.stdrollno=s.rollno AND classid=? ;";
        try {
            PreparedStatement ps=con.prepareStatement(q);
            ps.setString(1,classid);
            ResultSet rs=ps.executeQuery();
            while (rs.next()){
                Student s=new Student();
                s.setRollno(rs.getString("stdrollno"));
                s.setStdName(rs.getString("stdname"));
                students.add(s);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return students;
    }
}


