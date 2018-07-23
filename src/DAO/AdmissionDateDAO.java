package DAO;

import Entity.AdmissionDates;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

public class AdmissionDateDAO extends DBConnection {
    public void InsertDate(AdmissionDates dates) {
        String query = "INSERT INTO admissiondates (rollno, admitdate) VALUES (?,?);";

        try {
            System.out.println(dates.getStdId()+"  "+dates.getAdmitDate());
            System.out.println(dates.getLeavingDate());
            PreparedStatement preparedStatement = con.prepareStatement(query);
            preparedStatement.setString(1, dates.getStdId());
            preparedStatement.setDate(2, dateParse(dates.getAdmitDate()));
//            preparedStatement.setDate(3, dateParse(dates.getLeavingDate()));
            preparedStatement.execute();
            String rollNum=dates.getStdId();
            new StudentDAO().statusUpdate(rollNum, "Studying");
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    public void updateLeavingDate(AdmissionDates dates) {
        try {
            String query = "UPDATE admissiondates SET  leavingdate=? WHERE rollNo=?";
            PreparedStatement preparedStatement = null;

            preparedStatement = con.prepareStatement(query);
            preparedStatement.setDate(1, dateParse(dates.getLeavingDate()));
            preparedStatement.setString(2, dates.getStdId());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    public void deleateDate(String rollNo) {
        String query = "DELETE FROM admissiondates WHERE rollNo=?";
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = con.prepareStatement(query);

            preparedStatement.setString(1, rollNo);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    public ArrayList<AdmissionDates> getAdmissionDates(String rollNum) {
        ArrayList<AdmissionDates> datesArrayList = new ArrayList<>();
        String query = "SELECT * FROM admissiondates WHERE rollno=?;";
        try {
            PreparedStatement preparedStatement = con.prepareStatement(query);
            preparedStatement.setString(1,rollNum);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                AdmissionDates dates = new AdmissionDates(resultSet.getString(1), resultSet.getString(2), resultSet.getString(3));
                datesArrayList.add(dates);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return datesArrayList;
    }
}