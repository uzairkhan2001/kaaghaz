package mainpkg;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class receiveFromPrinting {
		public String insertRecieveOrder(int printID, int receive) {
	    	try {
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fyp","root","");
				Statement stmt=con.createStatement();
				stmt.executeUpdate("INSERT INTO `receiveprinting`(`printID`, `receivequan`,`Time`) VALUES ("+printID+",0,now())");
				con.close();
				return "Insert Successfully!";
			} catch (Exception e) {
				e.printStackTrace();
			}

			return "Not Insert Successfull";
	    }
	}
