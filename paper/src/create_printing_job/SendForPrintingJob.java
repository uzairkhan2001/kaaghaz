package create_printing_job;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class SendForPrintingJob {
	public String sendPrintingJob(int purchaseID,String vendor, int qty) {
    	try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fyp","root","");
			Statement stmt=con.createStatement();
			stmt.executeUpdate("INSERT INTO `sendforprinting`(`PID`,`printVendor`, `quantity`,`Time`) VALUES ("+purchaseID+","+vendor+","+qty+",now())");
			con.close();
			return "Sent Successfully!";
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "Sending UnSuccessfull";
    }			
}
