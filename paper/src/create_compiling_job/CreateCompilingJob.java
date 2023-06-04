package create_compiling_job;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class CreateCompilingJob {
	CreateCompilingJobIni[] data = null;

	public CreateCompilingJobIni[] createCompilingJob(int category) {

try {
			
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fyp", "root", "");
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT sfp.ID, rm.RawMaterialName, s.Size, w.Weight, v.Name, pv.Name, ((SELECT SUM(`receivequan`) FROM receiveprinting WHERE receiveprinting.`printID` = sfp.ID) - COALESCE((SELECT SUM(quantity) FROM sendforcompiling WHERE sendforcompiling.printID = sfp.ID), 0)) AS Quantity_Available,COALESCE((SELECT SUM(quantity) FROM sendforcompiling WHERE sendforcompiling.printID = sfp.ID), 0) AS Quantity_Sent FROM purchaseorder po JOIN size s ON s.id = po.SizeID JOIN weight w ON w.id = po.WeightID JOIN vendor v ON v.ID = po.VendorID JOIN rawmaterialtype rm ON rm.RawMaterialId = po.rawmaterial_ID LEFT JOIN sendforprinting sfp ON sfp.PID = po.ID LEFT JOIN sendforcompiling sfc ON sfp.ID = sfc.printID JOIN printingvendor pv ON pv.ID = sfp.printVendor WHERE rm.RawMaterialId = '"+category+"' GROUP BY sfp.`ID`");

			rs.last();


			
			data = new CreateCompilingJobIni[rs.getRow()];
			rs.beforeFirst();
			int i = 0;
			while (rs.next()) {
				
				data[i] = new CreateCompilingJobIni();
				data[i].printId = rs.getInt(1);
				data[i].raw = rs.getString(2);
				data[i].size = rs.getString(3);
				data[i].weight = rs.getString(4);
				data[i].vendor = rs.getString(5);
				data[i].printvendor = rs.getString(6);
				data[i].Quan_available = rs.getInt(7);
				data[i].Quan_sent = rs.getInt(8);

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
