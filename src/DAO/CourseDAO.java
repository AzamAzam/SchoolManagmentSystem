package DAO;

import Entity.Course;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class CourseDAO extends DBConnection {
    public void insertCourse(Course course) {
        String query = "INSERT INTO course (  coursename) VALUES (?)";
        try {
            PreparedStatement preparedStatement = con.prepareStatement(query);
            preparedStatement.setString(1, course.getCourseName());
            preparedStatement.execute();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateCourse(Course course) {
        String query = "UPDATE course SET coursename=? WHERE courseid=?";
        try {
            PreparedStatement preparedStatement = con.prepareStatement(query);
            preparedStatement.setString(1, course.getCourseName());
            preparedStatement.setString(2, course.getCourseId());
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteCourse(Course course) {
        String query = "UPDATE course SET coursename=? WHERE courseid=?";
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = con.prepareStatement(query);

            preparedStatement.setString(1, course.getCourseName());
            preparedStatement.setString(2, course.getCourseId());
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public ArrayList<Course> allCourses() {
        ArrayList<Course> arrayList = new ArrayList<Course>();
        String query = "SELECT * FROM course";
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = con.prepareStatement(query);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                Course course = new Course();
                course.setCourseId(rs.getString("courseid"));
                course.setCourseName(rs.getString("coursename"));
                arrayList.add(course);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return arrayList;
    }

    public ArrayList<Course> getCoursesByRollNo(String rollno) {
        ArrayList<Course> courses = new ArrayList<>();
        String query = "SELECT coursename, stdrollno FROM course c, studentclass sc,courseclass cc\n" +
                "WHERE stdrollno=? AND c.courseid=cc.courseid AND cc.classid=sc.classid ;";
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, rollno);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Course crs = new Course();
                crs.setCourseName(rs.getString("coursename"));
                courses.add(crs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return courses;
    }
}
