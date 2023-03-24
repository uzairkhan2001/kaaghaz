package mainpkg;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class GetSummaryOfRawMaterial {
	Summary[] data = null;

	public Summary[] getSummaryOfRawMaterial(String raw) {

		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fyp", "root", "");
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT rawmaterialtype.RawMaterialName,size.Size, weight.Weight, SUM(recieveorder.`Receive Intact`) AS `Received Intact`,SUM(recieveorder.`Receive Damage`) AS `Received Damaged`,sendforprinting.quantity FROM size, vendor, weight, rawmaterialtype, purchaseorder LEFT JOIN recieveorder ON purchaseorder.ID= recieveorder.`Purchase ID` LEFT JOIN sendforprinting ON recieveorder.`Purchase ID` = sendforprinting.PID WHERE size.id = purchaseorder.SizeID AND weight.id = purchaseorder.WeightID AND vendor.ID = purchaseorder.VendorID AND rawmaterialtype.RawMaterialId = purchaseorder.rawmaterial_ID AND rawmaterialtype.RawMaterialName = '"+raw+"' GROUP BY size.Size, weight.Weight;");

			rs.last();
			
			data = new Summary[rs.getRow()];
			rs.beforeFirst();
			int i = 0;
			while (rs.next()) {
				data[i] = new Summary();
				data[i].raw = rs.getString(1);
				data[i].size = rs.getString(2);
				data[i].weight = rs.getString(3);
				data[i].receive_Quan = rs.getInt(4);
				data[i].damage_Quan = rs.getInt(5);	
				data[i].print_Quan = rs.getInt(6);
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
