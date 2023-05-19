package create_purchase_order;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class GetAllWeight {
	GetAllRecords[] data = null;
	public GetAllRecords[] getAllweight(int SizeID) {
    	try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fyp","root","");
			Statement stmt=con.createStatement();
			ResultSet rs= stmt.executeQuery("select distinct catalog.weightid,weight.Weight FROM `catalog` join `weight` on weight.ID = catalog.WeightID where sizeid = "+ SizeID);
			
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
