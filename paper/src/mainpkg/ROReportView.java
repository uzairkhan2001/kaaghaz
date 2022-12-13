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
			ResultSet rs = stmt.executeQuery("SELECT recieveorder.ID,paperpurchaseorder.ID,papersize.Size,paperweight.Weight,papervendor.Name,paperpurchaseorder.quantity,recieveorder.`Receive Intact`,recieveorder.`Receive Damage`,recieveorder.Time FROM recieveorder,papersize,papervendor,paperweight,paperpurchaseorder WHERE papersize.id = paperpurchaseorder.SizeID AND paperweight.id = paperpurchaseorder.WeightID AND papervendor.ID = paperpurchaseorder.VendorID AND recieveorder.`Purchase ID` = paperpurchaseorder.ID ORDER BY `recieveorder`.`ID` ASC");

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
