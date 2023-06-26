package create_compiling_job;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class SendForCompilingJob {
	public String sendForCompilingJob(int size,String weight, int ven,int ppr,int tc,int sc) {
    	try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fyp","root","");
			Statement stmt=con.createStatement();
			stmt.executeUpdate("INSERT INTO `sendforcompiling`(`Size`, `Weight`, `compilingVendor`, `paperQuantity`, `titlecardQuantity`, `separatorcardQuantity`, `time`) VALUES ("+size+","+weight+","+ven+","+ppr+","+tc+","+sc+",now())");
			con.close();
			return "Sent Successfully!";
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "Sending UnSuccessfull";
    }			
}
