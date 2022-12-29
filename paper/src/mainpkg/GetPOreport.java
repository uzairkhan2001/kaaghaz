package mainpkg;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class GetPOreport {
	PurchaseOrderRRepo[] data = null;

	public PurchaseOrderRRepo[] getAllPurchaseOrder() {

		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fyp", "root", "");
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select ID,(select size from size where id = purchaseorder.sizeid),(select weight from weight where id = purchaseorder.weightid),(select name from vendor where id = purchaseorder.vendorid),Quantity,time from purchaseorder;");

			rs.last();


			
			data = new PurchaseOrderRRepo[rs.getRow()];
			rs.beforeFirst();
			int i = 0;
			while (rs.next()) {
				
				data[i] = new PurchaseOrderRRepo();
				data[i].purchaseId = rs.getInt(1);
				data[i].size = rs.getString(2);
				data[i].weight = rs.getString(3);
				data[i].vendor = rs.getString(4);
				data[i].total_Quan = rs.getInt(5);
				data[i].time = rs.getString(6);

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
