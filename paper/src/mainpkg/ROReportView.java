package mainpkg;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class ROReportView {

	ROReport[] data = null;

	public ROReport[] report2() {

		try {
			
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fyp", "root", "");
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT recieveorder.ID,purchaseorder.ID,size.Size,weight.Weight,vendor.Name,purchaseorder.quantity,recieveorder.`Receive Intact`,recieveorder.`Receive Damage`,recieveorder.Time FROM recieveorder,size,vendor,weight,purchaseorder WHERE size.id = purchaseorder.SizeID AND weight.id = purchaseorder.WeightID AND vendor.ID = purchaseorder.VendorID AND recieveorder.`Purchase ID` = purchaseorder.ID ORDER BY `recieveorder`.`ID` ASC");

			rs.last();


			
			data = new ROReport[rs.getRow()];
			rs.beforeFirst();
			int i = 0;
			while (rs.next()) {
				
				data[i] = new ROReport();
				data[i].recOrdId = rs.getInt(1);
				data[i].purchaseId = rs.getInt(2);
				data[i].size = rs.getString(3);
				data[i].weight = rs.getString(4);
				data[i].vendor = rs.getString(5);
				data[i].quantity = rs.getInt(6);
				data[i].receiveIntact = rs.getInt(7);
				data[i].receiveDamage = rs.getInt(8);
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
