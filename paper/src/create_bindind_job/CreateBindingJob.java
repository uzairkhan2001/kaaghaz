package create_bindind_job;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class CreateBindingJob {
	CreateBindingJobIni[] data = null;

	public CreateBindingJobIni[] createBindingJob() {

try {
			
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fyp", "root", "");
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT rc.compileID, s.Size, w.Weight,cv.Name, rc.`paperQuantity`, rc.`titlecardQuantity`, rc.`separatorcardQuantity` FROM `sendforcompiling` sfc JOIN Size s ON s.ID = sfc.Size JOIN Weight w ON w.ID = sfc.Weight JOIN compilingVendor cv ON cv.ID = sfc.compilingVendor JOIN receivecompiling rc ON rc.compileID = sfc.ID;");

			rs.last();


			
			data = new CreateBindingJobIni[rs.getRow()];
			rs.beforeFirst();
			int i = 0;
			while (rs.next()) {
				
				data[i] = new CreateBindingJobIni();
				data[i].Id = rs.getInt(1);
				data[i].size = rs.getString(2);
				data[i].weight = rs.getString(3);
				data[i].compilevendor = rs.getString(4);
				data[i].ppr_Quan = rs.getInt(5);
				data[i].tc_Quan = rs.getInt(6);
				data[i].sc_Quan = rs.getInt(7);

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
