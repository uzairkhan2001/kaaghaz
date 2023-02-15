package mainpkg;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class GetAllReceivePrinting {
	ReceivedPrinting[] data = null;

	public ReceivedPrinting[] getAllReceivePrinting() {

		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fyp", "root", "");
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT sendforprinting.ID, sendforprinting.PID, rawmaterialtype.RawMaterialName, size.Size,weight.Weight, vendor.Name, sendforprinting.Quantity, receiveprinting.receivequan AS `Received Quantity` FROM size,vendor,weight,rawmaterialtype,purchaseorder,sendforprinting  LEFT JOIN receiveprinting ON sendforprinting.ID= receiveprinting.`printID` WHERE size.id = purchaseorder.SizeID AND weight.id = purchaseorder.WeightID AND vendor.ID = purchaseorder.VendorID AND rawmaterialtype.RawMaterialId = purchaseorder.rawmaterial_ID GROUP BY sendforprinting.ID;");

			rs.last();


			
			data = new ReceivedPrinting[rs.getRow()];
			rs.beforeFirst();
			int i = 0;
			while (rs.next()) {
				
				data[i] = new ReceivedPrinting();
				data[i].printID = rs.getInt(1);
				data[i].purchaseId = rs.getInt(2);
				data[i].raw = rs.getString(3);
				data[i].size = rs.getString(4);
				data[i].weight = rs.getString(5);
				data[i].vendor = rs.getString(6);
				data[i].total_Quan = rs.getInt(7);
				data[i].receive_Quan = rs.getInt(8);

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
