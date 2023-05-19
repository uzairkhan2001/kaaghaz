package manage_purchase_order;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class GetAllRecievedRecords {
	GetReceivedRecordDetails[] data = null;

	public GetReceivedRecordDetails[] getAllRecievedRecords() {

		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fyp", "root", "");
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT purchaseorder.ID, rawmaterialtype.RawMaterialName, size.Size, weight.Weight, vendor.Name, purchaseorder.Quantity, SUM(recieveorder.`Receive Intact`) AS `Received Intact`,SUM(recieveorder.`Receive Damage`) AS `Received Damaged`, purchaseorder.Time , purchaseorder.Time FROM size, vendor, weight, rawmaterialtype, purchaseorder LEFT JOIN recieveorder ON purchaseorder.ID= recieveorder.`Purchase ID` WHERE size.id = purchaseorder.SizeID AND weight.id = purchaseorder.WeightID AND vendor.ID = purchaseorder.VendorID AND rawmaterialtype.RawMaterialId = purchaseorder.rawmaterial_ID GROUP BY purchaseorder.ID;");

			rs.last();
			
			data = new GetReceivedRecordDetails[rs.getRow()];
			rs.beforeFirst();
			int i = 0;
			while (rs.next()) {
				
				data[i] = new GetReceivedRecordDetails();
				data[i].purchaseId = rs.getInt(1);
				data[i].raw = rs.getString(2);
				data[i].size = rs.getString(3);
				data[i].weight = rs.getString(4);
				data[i].vendor = rs.getString(5);
				data[i].total_Quan = rs.getInt(6);
				data[i].receive_Quan = rs.getInt(7);
				data[i].damage_Quan = rs.getInt(8);
				data[i].time = rs.getString(9);
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
