package view_compilejob_receive;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class ReceiveCompilingJobDetails {
	
	ReceiveCompilingJobDetailsIni[] data = null;

	public ReceiveCompilingJobDetailsIni[] receiveCompilingJobDetails(int pjid) {

		try {
			
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fyp", "root", "");
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT ID,receivequantity,time FROM `receivecompiling` WHERE compileID="+pjid);

			rs.last();


			
			data = new ReceiveCompilingJobDetailsIni[rs.getRow()];
			rs.beforeFirst();
			int i = 0;
			while (rs.next()) {
				
				data[i] = new ReceiveCompilingJobDetailsIni();
				data[i].recOrdId = rs.getInt(1);
				data[i].receiveQuantity = rs.getInt(2);
				data[i].time = rs.getString(3);

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
