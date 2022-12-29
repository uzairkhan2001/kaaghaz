package mainpkg;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class GetAllRecievedRecords {
	Received[] data = null;

	public Received[] getAllRecievedRecords() {

		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fyp", "root", "");
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT purchaseorder.ID,size.Size,weight.Weight,vendor.Name,purchaseorder.Quantity,SUM(recieveorder.`Receive Intact`) AS `Received Intact`,SUM(recieveorder.`Receive Damage`) AS `Received Damaged` FROM size,vendor,weight,purchaseorder  LEFT JOIN recieveorder ON purchaseorder.ID= recieveorder.`Purchase ID` WHERE size.id = purchaseorder.SizeID AND weight.id = purchaseorder.WeightID AND vendor.ID = purchaseorder.VendorID GROUP BY purchaseorder.ID;");

			rs.last();


			
			data = new Received[rs.getRow()];
			rs.beforeFirst();
			int i = 0;
			while (rs.next()) {
				
				data[i] = new Received();
				data[i].purchaseId = rs.getInt(1);
				data[i].size = rs.getString(2);
				data[i].weight = rs.getString(3);
				data[i].vendor = rs.getString(4);
				data[i].total_Quan = rs.getInt(5);
				data[i].receive_Quan = rs.getInt(6);
				data[i].damage_Quan = rs.getInt(7);

				i++;
			}
			
			
			con.close();
			return data;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return data;
}
}
