package DAO;

import Entity.Student;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class StudentDAO extends DBConnection {
    PreparedStatement preparedStatement = null;
    String SQLquery = "";

    public void inerstStudent(Student student) {

        try {
            SQLquery = "INSERT INTO student(rollno,stdname, cnic, fathername, fathercnic, address, district, tehsil, dob, status, " +
                    "guardianname, guardiancnic, contact1, contact2, qualification, bloodgroup, department) " +
                    "VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            String sql="SELECT max(rollno) FROM student";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            String rollNo;
            int id;
        //    if(rs.next())
         //       id= Integer.parseInt(rs.getString("rollno"))+1;
           //     rollNo=id +"";
            //String rollNo = genrateRollNo(student.getAdmissiondate().toString());
            preparedStatement = con.prepareStatement(SQLquery);
            preparedStatement.setString(1, student.getStdCnic());
            preparedStatement.setString(2, student.getStdName());
            preparedStatement.setString(3, student.getStdCnic());
            preparedStatement.setString(4, student.getFatherName());
            preparedStatement.setString(5, student.getFatherCnic());
            preparedStatement.setString(6, student.getAddress());
            preparedStatement.setString(7, student.getDistrict());
            preparedStatement.setString(8, student.getTehsil());
            preparedStatement.setDate(9, dateParse(student.getDob()));
            preparedStatement.setString(10, "studying");  //status
            preparedStatement.setString(11, student.getGuardianName());
            preparedStatement.setString(12, student.getGuardianCnic());
            preparedStatement.setString(13, student.getContact1());
            preparedStatement.setString(14, student.getContact2());
            preparedStatement.setString(15, student.getQualification());
            preparedStatement.setString(16, student.getBloodGroup());
            preparedStatement.setString(17, student.getDepartment());

            preparedStatement.execute();


            String query = "INSERT INTO admissiondates VALUES (?,?)";
            preparedStatement = con.prepareStatement(query);
            preparedStatement.setString(1, student.getStdCnic());
            preparedStatement.setDate(2, dateParse(student.getAdmissiondate()));
            preparedStatement.execute();
        } catch (SQLException e) {
            e.printStackTrace();

        }
    }

    ////////////////////////////////////////////////////////////////////
    public ArrayList<Student> allStudents() {
        ArrayList<Student> stdArray = new ArrayList<>();
        SQLquery = "SELECT rollno,stdname,fathername,dob,address,district,status," +
                "contact1,bloodgroup,department FROM student;";
        try {
            preparedStatement = con.prepareStatement(SQLquery);
            ResultSet rs = preparedStatement.executeQuery();
            // rs.next();
            while (rs.next()) {
                Student student = new Student();
                student.setRollno(rs.getString(1));
                student.setStdName(rs.getString(2));
                student.setFatherName(rs.getString(3));
                student.setDob(rs.getDate(4).toString());
                student.setAddress(rs.getString(5));
                student.setDistrict(rs.getString(6));
                student.setStatus(rs.getString(7));
                student.setContact1(rs.getString(8));
                student.setBloodGroup(rs.getString(9));
                student.setDepartment(rs.getString(10));
                //   Student student = new Student(stdId, stdName, stdCnic, fatherName, fatherCnic, address, city, tehsil, dob, stdStatus);
                stdArray.add(student);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return stdArray;
    }

    ///////////////////////////////////////////////////////////////////////
    public void updateStudent(String id ,Student std) {
        // System.out.println(user.getPassword());//password=user.getPassword());
        try {
            String studentName=std.getStdName();
            String stdId=std.getRollno();
            String stdCnic=std.getStdCnic();
            String fName=std.getFatherName();
            String fCnic=std.getFatherCnic();
            String adress=std.getAddress();
            String dstrict=std.getDistrict();
            String tehsl=std.getTehsil();
            String DateofBirth=std.getDob();
            String stdStatus=std.getStatus();
            String gName=std.getGuardianName();
            String gCnic=std.getGuardianCnic();
            String ph1=std.getContact1();
            String ph2=std.getContact2();
            String  qualfication=std.getQualification();
            String bldGrp=std.getBloodGroup();
            String dept=std.getDepartment();

            SQLquery = "UPDATE student SET stdname=?  ,cnic=?, fathername=?, fathercnic=?, address=?, district=? ,tehsil=? , dob=?  ,guardianname=? , guardiancnic=? , contact1=?, contact2=?, qualification=?, bloodgroup=?, department=? WHERE RollNo=? ;";
            PreparedStatement ps = null;
            ps=con.prepareStatement(SQLquery);

            ps.setString(1,studentName);
             ps.setString(2,stdCnic);
             ps.setString(3,fName);
             ps.setString(4,fCnic);
            ps.setString(5,adress);
            ps.setString(6,dstrict);
            ps.setString(7,tehsl);
            ps.setDate(8,dateParse(DateofBirth));
            ps.setString(9,gName);
            ps.setString(10,gCnic);
            ps.setString(11,ph1);
            ps.setString(12,ph2);
            ps.setString(13,qualfication);
            ps.setString(14,bldGrp);
            ps.setString(15,dept);
            //ps.setString(16,stdId);
            ps.setString(16,id);
                 ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteStudent(String stdId) {
        String query = "DELETE FROM student WHERE rollno=?";
        try {
            PreparedStatement preparedStatement = con.prepareStatement(query);
            preparedStatement.setString(1, stdId);
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    String genrateRollNo(String d) throws SQLException {
        String sql = "SELECT max(rollno) FROM student";
        String y = "", id = "", roll = "";
        int no = 0;
        PreparedStatement ps = con.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        rs.next();
        System.out.println(roll);
 /*       if (rs.next()) {
            roll = rs.getString(1);

            y = roll.substring(0, 2);
            id = roll.substring(2);
        }

        String year = d.substring(2, 4);

        if (year.equals(y)) {
            id = (Integer.parseInt(id) + 1) + "";

        } else id = "1";
        return year + id;
 */
    return roll;
    }
//////////////////////////////////////////////////
    public Student getStudent(String rollno) {
        Student s = new Student();
        String q = "SELECT * FROM student WHERE rollno=?";
        try {
            preparedStatement = con.prepareStatement(q);
            preparedStatement.setString(1, rollno);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                s.setStdName(rs.getString("stdname"));
                s.setRollno(rs.getString("rollno"));
                s.setStdCnic(rs.getString("cnic"));
                s.setFatherName(rs.getString("fathername"));
                s.setFatherCnic(rs.getString("fathercnic"));
                s.setAddress(rs.getString("address"));
                s.setDistrict(rs.getString("district"));
                s.setTehsil(rs.getString("tehsil"));
                s.setDob(rs.getString("dob"));
                s.setStatus(rs.getString("status"));
                s.setGuardianName(rs.getString("guardianname"));
                s.setGuardianCnic(rs.getString("guardiancnic"));
                s.setContact1(rs.getString("contact1"));
                s.setContact2(rs.getString("contact2"));
                s.setQualification(rs.getString("qualification"));
                s.setBloodGroup(rs.getString("bloodgroup"));
                s.setDepartment(rs.getString("department"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return s;
    }
////////////////////////////////////////////////////
    public void statusUpdate(String id, String status) {
        String q = "UPDATE student SET status=? WHERE rollno=?";
        try {
            PreparedStatement ps = con.prepareStatement(q);
            ps.setString(1, status);
            ps.setString(2, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
    /////////////////////////////////////////////////////////////////////////////
    //  This Method is to return leaving students, called in reAdmission.jsp  //
    ///////////////////////////////////////////////////////////////////////////
    public ArrayList getLeftStudentList()
    {
        ArrayList list=new ArrayList();

        String sql="SELECT * FROM student WHERE status='Left'";
        try {
            PreparedStatement ps=con.prepareStatement(sql);

            ResultSet rs=ps.executeQuery();
            while(rs.next())
            {
                Student std=new Student();
                std.setStdName(rs.getString("stdname"));
                std.setRollno(rs.getString("rollno"));
                list.add(std);
            }


        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
}
