package mainpkg;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class PlaceOrder {
	   public void createPurchaseOrder(int SizeID, int WeightID, int VendorID, int Quantity) {
	    	try {
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fyp","root","");
				Statement stmt=con.createStatement();
				 stmt.executeUpdate("insert into paperpurchaseorder (WeightID,SizeID,VendorID,Quantity,Time) VALUES('"+WeightID+"','"+SizeID+"','"+VendorID+"','"+Quantity+"',now())");
				  con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
	    }
}
