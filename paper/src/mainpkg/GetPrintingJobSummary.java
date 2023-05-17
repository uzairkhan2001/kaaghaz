package mainpkg;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class GetPrintingJobSummary {
	
	GetPrintingJobSummaryIni[] data = null;
	
	public GetPrintingJobSummaryIni[] getPrintingJobSummary(int pjid) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fyp", "root", "");
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT sfp.ID, sfp.PID, rm.RawMaterialName, s.Size, w.Weight, v.Name AS Purchase_Vendor, pv.Name AS Printing_Vendor, sfp.quantity, SUM(rp.receivequan),sfp.time FROM purchaseorder po JOIN size s ON s.id = po.SizeID JOIN weight w ON w.id = po.WeightID JOIN vendor v ON v.ID = po.VendorID JOIN rawmaterialtype rm ON rm.RawMaterialId = po.rawmaterial_ID JOIN sendforprinting sfp ON sfp.PID = po.ID JOIN printingvendor pv ON pv.ID = sfp.printVendor JOIN receiveprinting rp ON sfp.ID = rp.printID WHERE sfp.ID = "+pjid+";");

			rs.last();
			
			data = new GetPrintingJobSummaryIni[rs.getRow()];
			rs.beforeFirst();
			int i = 0;
			while (rs.next()) {
				data[i] = new GetPrintingJobSummaryIni();
				data[i].printId = rs.getInt(1);
				data[i].purchaseId = rs.getInt(2);
				data[i].raw = rs.getString(3);
				data[i].size = rs.getString(4);
				data[i].weight = rs.getString(5);
				data[i].povendor = rs.getString(6);
				data[i].pjvendor = rs.getString(7);
				data[i].total_Quan = rs.getInt(8);
				data[i].receive_Quan = rs.getInt(9);
				data[i].time = rs.getString(10);			
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
