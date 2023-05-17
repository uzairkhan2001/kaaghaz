package view_printjob_receive;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class ReceivePrintingJobDetails {
	
	ReceivePrintingJobDetailsIni[] data = null;

	public ReceivePrintingJobDetailsIni[] receivePrintingJobDetails(int pjid) {

		try {
			
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fyp", "root", "");
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT ID,receivequan,time FROM `receiveprinting` WHERE printID="+pjid);

			rs.last();


			
			data = new ReceivePrintingJobDetailsIni[rs.getRow()];
			rs.beforeFirst();
			int i = 0;
			while (rs.next()) {
				
				data[i] = new ReceivePrintingJobDetailsIni();
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
