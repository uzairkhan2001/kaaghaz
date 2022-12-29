package mainpkg;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class ROReportByPidView {
	ROReportByPid[] data = null;

	public ROReportByPid[] reportbypid(int pid) {

		try {
			
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fyp", "root", "");
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT recieveorder.ID,size.Size,weight.Weight,vendor.Name,purchaseorder.quantity,recieveorder.`Receive Intact`,recieveorder.`Receive Damage`,recieveorder.Time FROM recieveorder,size,vendor,weight,purchaseorder WHERE size.id = purchaseorder.SizeID AND weight.id = purchaseorder.WeightID AND vendor.ID = purchaseorder.VendorID AND recieveorder.`Purchase ID` = purchaseorder.ID AND purchaseorder.ID = "+ pid +" ORDER BY `recieveorder`.`ID` ASC");

			rs.last();


			
			data = new ROReportByPid[rs.getRow()];
			rs.beforeFirst();
			int i = 0;
			while (rs.next()) {
				
				data[i] = new ROReportByPid();
				data[i].recOrdId = rs.getInt(1);
				data[i].size = rs.getString(2);
				data[i].weight = rs.getString(3);
				data[i].vendor = rs.getString(4);
				data[i].quantity = rs.getInt(5);
				data[i].receiveIntact = rs.getInt(6);
				data[i].receiveDamage = rs.getInt(7);
				data[i].time = rs.getString(8);

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
