package mainpkg;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class POReportView {

	ReportPO[] data = null;

	public ReportPO[] report() {

		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fyp", "root", "");
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT purchaseorder.ID,size.Size,weight.Weight,vendor.Name,purchaseorder.Quantity,purchaseorder.Time FROM size,vendor,weight,purchaseorder WHERE size.id = purchaseorder.SizeID AND weight.id = purchaseorder.WeightID AND vendor.ID = purchaseorder.VendorID GROUP BY purchaseorder.ID;");

			rs.last();


			
			data = new ReportPO[rs.getRow()];
			rs.beforeFirst();
			int i = 0;
			while (rs.next()) {
				
				data[i] = new ReportPO();
				data[i].purchaseId = rs.getInt(1);
				data[i].size = rs.getString(2);
				data[i].weight = rs.getString(3);
				data[i].vendor = rs.getString(4);
				data[i].quantity = rs.getInt(5);
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
