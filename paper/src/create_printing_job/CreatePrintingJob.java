package create_printing_job;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class CreatePrintingJob {
	CreatePrintingJobIni[] data = null;

	public CreatePrintingJobIni[] createPrintingJob(int category) {

try {
			
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fyp", "root", "");
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT po.ID, rm.RawMaterialName, s.Size, w.Weight, v.Name, ((SELECT SUM(`Receive Intact`) FROM recieveorder WHERE recieveorder.`Purchase ID` = po.ID) - COALESCE((SELECT SUM(quantity) FROM sendforprinting WHERE sendforprinting.PID = po.ID), 0)) AS Quantity_Available,COALESCE((SELECT SUM(quantity) FROM sendforprinting WHERE sendforprinting.PID = po.ID), 0) AS Quantity_Sent FROM purchaseorder po JOIN size s ON s.id = po.SizeID JOIN weight w ON w.id = po.WeightID JOIN vendor v ON v.ID = po.VendorID JOIN rawmaterialtype rm ON rm.RawMaterialId = po.rawmaterial_ID LEFT JOIN sendforprinting sfp ON sfp.PID = po.ID LEFT JOIN recieveorder ro ON po.ID = ro.`Purchase ID` WHERE rm.RawMaterialId = '"+category+"' GROUP BY po.`ID`");

			rs.last();


			
			data = new CreatePrintingJobIni[rs.getRow()];
			rs.beforeFirst();
			int i = 0;
			while (rs.next()) {
				
				data[i] = new CreatePrintingJobIni();
				data[i].purchaseId = rs.getInt(1);
				data[i].raw = rs.getString(2);
				data[i].size = rs.getString(3);
				data[i].weight = rs.getString(4);
				data[i].vendor = rs.getString(5);
				data[i].Quan_available = rs.getInt(6);
				data[i].Quan_sent = rs.getInt(7);

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
