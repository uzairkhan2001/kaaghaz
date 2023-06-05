package view_bindingjob_receive;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class GetBindingJobSummary {
	
	GetBindingJobSummaryIni[] data = null;
	
	public GetBindingJobSummaryIni[] getBindingJobSummary(int pjid) {

		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fyp", "root", "");
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT sfb.ID, sfb.compileId, rm.RawMaterialName, s.Size, w.Weight, v.Name AS Purchase_Vendor, pv.Name AS Printing_Vendor, cv.Name ,bv.Name , sfc.quantity, SUM(rb.receivequantity) ,sfc.time FROM purchaseorder po JOIN size s ON s.id = po.SizeID JOIN weight w ON w.id = po.WeightID JOIN vendor v ON v.ID = po.VendorID JOIN rawmaterialtype rm ON rm.RawMaterialId = po.rawmaterial_ID JOIN sendforprinting sfp ON sfp.PID = po.ID JOIN printingvendor pv ON pv.ID = sfp.printVendor JOIN sendforcompiling sfc ON sfc.printID = sfp.ID JOIN compilingvendor cv ON cv.ID = sfc.compilingVendor JOIN receivecompiling rc ON sfc.ID = rc.compileID LEFT JOIN sendforbinding sfb ON sfb.compileId = sfc.ID LEFT JOIN bindingvendor bv ON bv.ID = sfb.bindingVendor LEFT JOIN receivebinding rb ON rb.bindId = sfb.compileId WHERE sfc.ID ="+pjid+";");

			rs.last();
			
			data = new GetBindingJobSummaryIni[rs.getRow()];
			rs.beforeFirst();
			int i = 0;
			while (rs.next()) {
				data[i] = new GetBindingJobSummaryIni();
				data[i].bindId = rs.getInt(1);
				data[i].compileId = rs.getInt(2);
				data[i].raw = rs.getString(3);
				data[i].size = rs.getString(4);
				data[i].weight = rs.getString(5);
				data[i].povendor = rs.getString(6);
				data[i].pjvendor = rs.getString(7);
				data[i].cjvendor = rs.getString(8);
				data[i].bjvendor = rs.getString(9);
				data[i].total_Quan = rs.getInt(10);
				data[i].receive_Quan = rs.getInt(11);
				data[i].time = rs.getString(12);			
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
