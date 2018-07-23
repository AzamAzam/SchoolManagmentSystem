package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DBConnection {
    public static Connection con = null;

    public DBConnection() {
        if (con == null) {
            this.config();
        }
    }

    public void config() {

        try {
            Class.forName("org.postgresql.Driver");

            String dbType = "jdbc:postgresql:";
            String dbUrl = "//localhost:";
            String dbPort = "5432/";
            String dbName = "postgres";
            String dbUser = "postgres";
            String dbPass = "zahid123";

            con = DriverManager.getConnection(dbType + dbUrl + dbPort + dbName, dbUser, dbPass);
            System.out.println("Opened database successfully");
            // create();
        } catch (Exception e) {
            e.printStackTrace();
            System.err.println(e.getClass().getName() + ": " + e.getMessage());

        }

    }
     public java.sql.Date dateParse(String jdate)  {

         Date jDateDoB = null;
         try {
             jDateDoB = new SimpleDateFormat("yyyy-MM-dd").parse(jdate);
         } catch (ParseException e) {
             e.printStackTrace();
         }
         java.sql.Date sqlDateDoB = new java.sql.Date(jDateDoB.getTime());
         return  sqlDateDoB;
     }

}
