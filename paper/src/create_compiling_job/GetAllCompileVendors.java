package create_compiling_job;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;


public class GetAllCompileVendors {
	GetAllCompileVendorsIni[] data = null;

	public GetAllCompileVendorsIni[] getAllCompileVendor() {

		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fyp", "root", "");
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select ID,name FROM `compilingvendor`");

			rs.last();


			
			data = new GetAllCompileVendorsIni[rs.getRow()];
			rs.beforeFirst();
			int i = 0;
			while (rs.next()) {
				
				data[i] = new GetAllCompileVendorsIni();
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
