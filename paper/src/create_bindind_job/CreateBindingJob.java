package create_bindind_job;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class CreateBindingJob {
	CreateBindingJobIni[] data = null;

	public CreateBindingJobIni[] createBindingJob(int category) {

try {
			
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fyp", "root", "");
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT sfc.ID, rm.RawMaterialName, s.Size, w.Weight, v.Name, pv.Name,cv.Name, ((SELECT SUM(`receivequantity`) FROM receivecompiling WHERE receivecompiling.compileID = sfc.ID) - COALESCE((SELECT SUM(quantity) FROM sendforbinding WHERE sendforbinding.compileId = sfc.ID), 0)) AS Quantity_Available,COALESCE((SELECT SUM(quantity) FROM sendforbinding WHERE sendforbinding.compileId = sfc.ID), 0) AS Quantity_Sent FROM purchaseorder po JOIN size s ON s.id = po.SizeID JOIN weight w ON w.id = po.WeightID JOIN vendor v ON v.ID = po.VendorID JOIN rawmaterialtype rm ON rm.RawMaterialId = po.rawmaterial_ID JOIN sendforprinting sfp ON sfp.PID = po.ID JOIN sendforcompiling sfc ON sfp.ID = sfc.printID JOIN printingvendor pv ON pv.ID = sfp.printVendor JOIN compilingvendor cv ON cv.ID = sfc.compilingVendor WHERE rm.RawMaterialId ='"+category+"' GROUP BY sfc.`ID`");

			rs.last();


			
			data = new CreateBindingJobIni[rs.getRow()];
			rs.beforeFirst();
			int i = 0;
			while (rs.next()) {
				
				data[i] = new CreateBindingJobIni();
				data[i].compileId = rs.getInt(1);
				data[i].raw = rs.getString(2);
				data[i].size = rs.getString(3);
				data[i].weight = rs.getString(4);
				data[i].vendor = rs.getString(5);
				data[i].printvendor = rs.getString(6);
				data[i].compilevendor = rs.getString(7);
				data[i].Quan_available = rs.getInt(8);
				data[i].Quan_sent = rs.getInt(9);

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
