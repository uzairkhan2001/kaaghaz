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
			ResultSet rs = stmt.executeQuery("SELECT ID,`Receive Intact`,`Receive Damage`,Time FROM `recieveorder` WHERE `Purchase ID` = "+ pid);

			rs.last();


			
			data = new ROReportByPid[rs.getRow()];
			rs.beforeFirst();
			int i = 0;
			while (rs.next()) {
				
				data[i] = new ROReportByPid();
				data[i].recOrdId = rs.getInt(1);
				data[i].receiveIntact = rs.getInt(2);
				data[i].receiveDamage = rs.getInt(3);
				data[i].time = rs.getString(4);

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
