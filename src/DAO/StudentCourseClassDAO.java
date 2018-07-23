package DAO;

import Entity.StudentCourseClass;

import java.sql.PreparedStatement;
import java.sql.SQLException;

public class StudentCourseClassDAO extends DBConnection {
    public void insertData(StudentCourseClass studentCourseClass) {
        String query = "INSERT into  studentCourseClass (marks, year, std_id, course_id, ccid)";
        try {
            PreparedStatement preparedStatement = con.prepareStatement(query);
            preparedStatement.setDouble(1, studentCourseClass.getMarks());
            preparedStatement.setInt(2, studentCourseClass.getYear());
            preparedStatement.setString(3, studentCourseClass.getStd_id());
            preparedStatement.setInt(4, studentCourseClass.getCourse_id());
            preparedStatement.setInt(5, studentCourseClass.getClass_id());
            preparedStatement.execute();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateMarks(String stdId, int courseId, int classId, double marks) {
        String query = "UPDATE studentCourseClass SET marks=? where std_id=? AND ccid=?AND course_id=?";

        try {
            PreparedStatement preparedStatement = con.prepareStatement(query);
            preparedStatement.setDouble(1, marks);
            preparedStatement.setString(2, stdId);
            preparedStatement.setInt(3, classId);
            preparedStatement.setInt(4, courseId);
preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteRecord(StudentCourseClass stdCrsCls) {
        String query = "DELETE From studentCourseClass where course_id=? AND std_id=? AND ccid=?";
        try {
            PreparedStatement preparedStatement = con.prepareStatement(query);
            preparedStatement.setInt(1, stdCrsCls.getCourse_id());
        preparedStatement.setString(2,stdCrsCls.getStd_id());
        preparedStatement.setInt(3,stdCrsCls.getClass_id());
        preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
