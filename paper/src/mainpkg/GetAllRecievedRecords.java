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
			ResultSet rs = stmt.executeQuery("SELECT paperpurchaseorder.ID,papersize.Size,paperweight.Weight,papervendor.Name,paperpurchaseorder.Quantity,SUM(recieveorder.`Receive Intact`) AS `Received Intact`,SUM(recieveorder.`Receive Damage`) AS `Received Damaged` FROM papersize,papervendor,paperweight,paperpurchaseorder  LEFT JOIN recieveorder ON paperpurchaseorder.ID= recieveorder.`Purchase ID` WHERE papersize.id = paperpurchaseorder.SizeID AND paperweight.id = paperpurchaseorder.WeightID AND papervendor.ID = paperpurchaseorder.VendorID GROUP BY paperpurchaseorder.ID;");

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
