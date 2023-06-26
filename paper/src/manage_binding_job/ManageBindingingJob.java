package manage_binding_job;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import create_bindind_job.CreateBindingJobIni;

public class ManageBindingingJob {
	ManageBindingJobInitial[] data = null;

	public ManageBindingJobInitial[] manageBindingJob() {

try {
			
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fyp", "root", "");
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT sfb.ID, s.Size, w.Weight,bv.Name, sfb.`paperQuantity`, sfb.`titlecardQuantity`, sfb.`separatorcardQuantity` FROM `sendforcompiling` sfc JOIN Size s ON s.ID = sfc.Size JOIN Weight w ON w.ID = sfc.Weight JOIN compilingVendor cv ON cv.ID = sfc.compilingVendor JOIN receivecompiling rc ON rc.compileID = sfc.ID JOIN sendforbinding sfb ON sfb.compileId = rc.compileID JOIN bindingvendor bv ON bv.ID = sfb.bindingVendor;");

			rs.last();
			
			data = new ManageBindingJobInitial[rs.getRow()];
			rs.beforeFirst();
			int i = 0;
			while (rs.next()) {
				data[i] = new ManageBindingJobInitial();
				data[i].Id = rs.getInt(1);
				data[i].size = rs.getString(2);
				data[i].weight = rs.getString(3);
				data[i].bindvendor = rs.getString(4);
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
