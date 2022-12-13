package mainpkg;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class GetAllVendors {
	Record[] data = null;
	public Record[] getAllVendor(int SizeID,int WeightID) {
    	try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fyp","root","");
			Statement stmt=con.createStatement();
			ResultSet rs= stmt.executeQuery("select distinct papervendorcatalog.vendorid,papervendor.Name FROM `papervendorcatalog` join `papervendor` on papervendor.ID = papervendorcatalog.VendorID where sizeid = " + SizeID + " AND WeightID = "+ WeightID);
			rs.last();
			
			data = new Record[rs.getRow()];
			rs.beforeFirst();
			int i = 0;
			while (rs.next()) {
				
				data[i] = new Record();
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
