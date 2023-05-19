package create_purchase_order;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class GetAllVendors {
	GetAllRecords[] data = null;
	public GetAllRecords[] getAllVendor(int SizeID,int WeightID) {
    	try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fyp","root","");
			Statement stmt=con.createStatement();
			ResultSet rs= stmt.executeQuery("select distinct catalog.vendorid,vendor.Name FROM `catalog` join `vendor` on vendor.ID = catalog.VendorID where sizeid = " + SizeID + " AND WeightID = "+ WeightID);
			rs.last();
			
			data = new GetAllRecords[rs.getRow()];
			rs.beforeFirst();
			int i = 0;
			while (rs.next()) {
				
				data[i] = new GetAllRecords();
				data[i].id = rs.getInt(1);
				data[i].name = rs.getString(2);

				i++;
			}
			con.close();
			return data;
			
		} 
    	catch (Exception e) {
			e.printStackTrace();
		}
    	return data;
}
}
