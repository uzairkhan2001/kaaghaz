package create_bindind_job;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class SendForBindingJob {
	public String sendForBindingJob(int compileID, int bindingVendor,int paperQuantity,int titlecardQuantity,int separatorcardQuantity) {
    	try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fyp","root","");
			Statement stmt=con.createStatement();
			stmt.executeUpdate("INSERT INTO `sendforbinding`(`compileID`, `bindingVendor`, `paperQuantity`, `titlecardQuantity`, `separatorcardQuantity`, `time`) VALUES ("+compileID+","+bindingVendor+","+paperQuantity+","+titlecardQuantity+","+separatorcardQuantity+",now())");
			con.close();
			return "Sent Successfully!";
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "Sending UnSuccessfull";
    }			
}
