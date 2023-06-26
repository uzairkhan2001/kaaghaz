package manage_compiling_job;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class InsertReceiveFromCompiling {
		public String insertReceiveFromCompiling(int compileID, int paperQuantity,int titlecardQuantity,int separatorcardQuantity) {
	    	try {
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fyp","root","");
				Statement stmt=con.createStatement();
				stmt.executeUpdate("INSERT INTO `receivecompiling`(`compileID`, `paperQuantity`, `titlecardQuantity`, `separatorcardQuantity`, `time`) VALUES ("+compileID+","+paperQuantity+","+titlecardQuantity+","+separatorcardQuantity+",now())");
				con.close();
				return "Insert Successfully!";
			} catch (Exception e) {
				e.printStackTrace();
			}
			return "Not Insert Successfull";
	    }
	}
