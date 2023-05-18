package manage_printing_job;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class GetAllPrintVendors {
	GetAllPrintVendorsIni[] data = null;

	public GetAllPrintVendorsIni[] getAllPrintVendor() {

		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fyp", "root", "");
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select ID,name FROM `printingvendor`");

			rs.last();


			
			data = new GetAllPrintVendorsIni[rs.getRow()];
			rs.beforeFirst();
			int i = 0;
			while (rs.next()) {
				
				data[i] = new GetAllPrintVendorsIni();
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
