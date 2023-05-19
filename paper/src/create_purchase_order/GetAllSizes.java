package create_purchase_order;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class GetAllSizes {
	GetAllRecords[] data = null;

	public GetAllRecords[] getAllSizeID(int rawid) {

		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fyp", "root", "");
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select distinct catalog.sizeid,size.size FROM `catalog` join `size` on size.ID = catalog.sizeID where rawmaterial_id = "+ rawid);

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

		} catch (Exception e) {
			e.printStackTrace();
		}

		return data;
}
}