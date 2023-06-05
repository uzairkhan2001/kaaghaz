package view_compilejob_receive;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class GetCompilingJobSummary {
	
	GetCompilingJobSummaryIni[] data = null;
	
	public GetCompilingJobSummaryIni[] getCompilingJobSummary(int pjid) {

		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fyp", "root", "");
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT sfc.ID, sfc.printID, rm.RawMaterialName, s.Size, w.Weight, v.Name AS Purchase_Vendor, pv.Name AS Printing_Vendor, cv.Name, sfp.quantity, SUM(rc.receivequantity) ,sfp.time FROM purchaseorder po JOIN size s ON s.id = po.SizeID JOIN weight w ON w.id = po.WeightID JOIN vendor v ON v.ID = po.VendorID JOIN rawmaterialtype rm ON rm.RawMaterialId = po.rawmaterial_ID JOIN sendforprinting sfp ON sfp.PID = po.ID JOIN printingvendor pv ON pv.ID = sfp.printVendor JOIN sendforcompiling sfc ON sfc.printID = sfp.ID JOIN compilingvendor cv ON cv.ID = sfc.compilingVendor JOIN receivecompiling rc ON sfc.ID = rc.compileID WHERE sfc.ID = "+pjid+";");

			rs.last();
			
			data = new GetCompilingJobSummaryIni[rs.getRow()];
			rs.beforeFirst();
			int i = 0;
			while (rs.next()) {
				data[i] = new GetCompilingJobSummaryIni();
				data[i].compileId = rs.getInt(1);
				data[i].printId = rs.getInt(2);
				data[i].raw = rs.getString(3);
				data[i].size = rs.getString(4);
				data[i].weight = rs.getString(5);
				data[i].povendor = rs.getString(6);
				data[i].pjvendor = rs.getString(7);
				data[i].cjvendor = rs.getString(8);
				data[i].total_Quan = rs.getInt(9);
				data[i].receive_Quan = rs.getInt(10);
				data[i].time = rs.getString(11);			
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
