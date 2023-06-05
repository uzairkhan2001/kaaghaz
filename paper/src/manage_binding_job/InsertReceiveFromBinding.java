package manage_binding_job;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class InsertReceiveFromBinding {
		public String insertReceiveFromBinding(int bindId, int receive) {
	    	try {
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fyp","root","");
				Statement stmt=con.createStatement();
				stmt.executeUpdate("INSERT INTO `receivebinding`(`bindId`, `receivequantity`,`Time`) VALUES ("+bindId+","+receive+",now())");
				con.close();
				return "Insert Successfully!";
			} catch (Exception e) {
				e.printStackTrace();
			}
			return "Not Insert Successfull";
	    }
	}
