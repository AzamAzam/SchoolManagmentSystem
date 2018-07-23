package DAO;

import Entity.Result;

import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ResultDAO extends DBConnection {
    public void insertResult(Result result) throws SQLException {
        String query = "INSERT  INTO classResult  (year , totalappeared, passed, failed, percentage,  classid) VALUE (?,?,?,?,?,?)";
        PreparedStatement preparedStatement = con.prepareStatement(query);
        preparedStatement.setInt(1, result.getYear());
        preparedStatement.setInt(2, result.getTotalAppeared());
        preparedStatement.setInt(3, result.getPassed());
        preparedStatement.setInt(4, result.getFailed());
        preparedStatement.setDouble(5, result.getPercentage());
        preparedStatement.setInt(7, result.getClassid());
        preparedStatement.execute();
    }

    public void updateResult(Result result) {
        String query = "UPDATE classResult SET totalappeared=?,passed=?,failed=?,percentage=?where classid=? AND year=?";
        try {
            PreparedStatement preparedStatement = con.prepareStatement(query);
            preparedStatement.setInt(1, result.getTotalAppeared());
            preparedStatement.setInt(2, result.getPassed());
            preparedStatement.setInt(3, result.getFailed());
            preparedStatement.setDouble(4, result.getPercentage());
            preparedStatement.setInt(5, result.getClassid());
            preparedStatement.setInt(6, result.getYear());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    public void deleteResult(Result result) {
        String query = "DELETE from classResult where classid=? and year=?";
        try {
            PreparedStatement preparedStatement = con.prepareStatement(query);
            preparedStatement.setInt(1, result.getClassid());
            preparedStatement.setInt(2, result.getYear());
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
