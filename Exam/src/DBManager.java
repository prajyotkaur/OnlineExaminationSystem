//import java.sql.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Collections;

public class DBManager {
    
    
    private final static String DBDRIVER = "com.mysql.jdbc.Driver";
    private final static String DBURL = "jdbc:mysql://localhost:3306/exam";
    private final static String DBUSER = "root";
    private final static String DBPASSWORD = "123";

    static
    {
        try
        {
            Class.forName(DBDRIVER);
        }
        catch(Exception e){}
    } 
        private static Connection getConnection() throws Exception {
        Connection con = DriverManager.getConnection(DBURL,DBUSER,DBPASSWORD);
        return con;
    }
    
    public static boolean authenticateUser(String userId, String password)
    {
        boolean flag=false;
        try
        {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("Select * from users where UserId=? and Password=?");
            ps.setString(1,userId);
            ps.setString(2,password);
            ResultSet rs = ps.executeQuery();
            if(rs.next())
            {
                flag=true;
            }
            rs.close();
            ps.close();
            con.close();
        }
        catch(Exception e){}
        return flag;
    }    
    public static String getUserName(String userId)
    {
        String name="";
        try
        {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("Select FirstName, LastName from users where userId=?");
            ps.setString(1,userId);
            ResultSet rs = ps.executeQuery();
            rs.next();
            name = rs.getString(1)+" "+rs.getString(2);
            rs.close();
            ps.close();
        }
        catch(Exception e){}
        return name;
    }     
    
    public static int registerUser(String userId, String password, String firstName, String lastName)
    {
        int x = 0;
        try
        {
            Connection con = getConnection();
            PreparedStatement ps1 = con.prepareStatement("Select * from users where UserId=?");
            ps1.setString(1,userId);
            ResultSet rs = ps1.executeQuery();
            if(rs.next())
            {
                x = 1;
            }
            else
            {
                PreparedStatement ps2 = con.prepareStatement("Insert into Users(UserId,Password, FirstName,LastName) values(?,?,?,?)");
                ps2.setString(1,userId);
                ps2.setString(2,password);
                ps2.setString(3,firstName);
                ps2.setString(4,lastName);
                ps2.executeUpdate();
                ps2.close();
                x = 2;
            }
            rs.close();
            ps1.close();
            con.close();
        }
        catch(Exception e){e.printStackTrace();}
        return x;
    }  
    public static String[] getSubjects(){
        ArrayList<String> list = new ArrayList<String>();
         try
        {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("Select * from Subjects");
            ResultSet rs = ps.executeQuery();
            while(rs.next())
            {
                list.add(rs.getString(1));
            }
            rs.close();
            ps.close();
        }
        catch(Exception e){}  
        Collections.sort(list);
        String[] subjects = new String[list.size()];
        for(int i=0;i<list.size();i++){
            subjects[i] = list.get(i);
        }            
        return subjects;
    }   
        public static void saveReport(ExamReport r){
        try
        {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("Insert into reports(UserId,UserName,ExamDate,Subject,Level,TotalQuestions,CorrectQuestions,Score) values (?,?,?,?,?,?,?,?)");
            ps.setString(1,System.getProperty("userId"));
            ps.setString(2,r.getStudentName());
            ps.setString(3,r.getExamDate());
            ps.setString(4,r.getSubject());
            ps.setString(5,r.getLevel());
            ps.setString(6,""+r.getNumberOfQuestions());
            ps.setString(7,""+r.getCorrect());
            ps.setString(8,r.getScore()+"%");
            ps.executeUpdate();
            ps.close();
        }
        catch(Exception e){}  
    }
    public static ArrayList<Question> getQuestions(String subject, String level){
        ArrayList<Question> list = new ArrayList<Question>();
         try
        {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("Select * from Questions where Subject=? and DifficultyLevel=?");
            ps.setString(1, subject);
            ps.setString(2, level);
            ResultSet rs = ps.executeQuery();
            while(rs.next())
            {
                Question q = new Question();
                q.setQuestionId(rs.getInt(1));
                q.setQuestionText(rs.getString(2));
                q.setOptionA(rs.getString(3));
                q.setOptionB(rs.getString(4));
                q.setOptionC(rs.getString(5));
                q.setOptionD(rs.getString(6));
                q.setCorrectAnswer(rs.getString(7));
                q.setSubject(rs.getString(8));
                q.setDifficultyLevel(rs.getString(9));
                list.add(q);
            }
            rs.close();
            ps.close();
        }
        catch(Exception e){}       
        return list;
    }        
}
