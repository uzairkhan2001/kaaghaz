package manage_purchase_order;


import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class GetQuantity {
	int[] data = null;
	public int[] getQuantity(int ID) {
		int quan = 0 ,rec=0;
    	try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fyp","root","");
			Statement stmt=con.createStatement();
			ResultSet rs= stmt.executeQuery("select purchaseorder.Quantity,SUM(recieveorder.`receive intact`) AS `Received Intact` from purchaseorder,recieveorder where purchaseorder.id = recieveorder.`purchase id` AND purchaseorder.id = "+ ID+" AND recieveorder.`purchase id` = "+ ID);
			
			
			while(rs.next()) {
				quan = rs.getInt(1);
				rec = rs.getInt(2);
			}
			int data[] = {quan,rec};
			con.close();
			return data;
			
		} 
    	catch (Exception e) {
			e.printStackTrace();
		}
    	return data;
}
}

