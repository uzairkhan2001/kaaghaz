package manage_purchase_order;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class Recieveorder {
	public String insertRecieveOrder(int purchaseID, int intact, int damage) {
    	try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fyp","root","");
			Statement stmt=con.createStatement();
			stmt.executeUpdate("INSERT INTO `recieveorder`(`Purchase ID`, `Receive Intact`, `Receive Damage`,`Time`) VALUES ("+purchaseID+","+intact+","+damage+",now())");
			con.close();
			return "Insert Successfully!";
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "Not Insert Successfull";
    }
}
