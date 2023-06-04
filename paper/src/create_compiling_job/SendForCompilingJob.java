package create_compiling_job;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class SendForCompilingJob {
	public String sendForCompilingJob(int printID,String vendor, int qty) {
    	try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fyp","root","");
			Statement stmt=con.createStatement();
			stmt.executeUpdate("INSERT INTO `sendforcompiling`(`printID`,`compilingVendor`, `quantity`,`Time`) VALUES ("+printID+","+vendor+","+qty+",now())");
			con.close();
			return "Sent Successfully!";
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "Sending UnSuccessfull";
    }			
}
