package manage_printing_job;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class ManagePrintingJob {
	ManagePrintingJobInitial[] data = null;

	public ManagePrintingJobInitial[] managePrintingJob(int category) {

try {
			
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fyp", "root", "");
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT sfp.ID, sfp.PID, rm.RawMaterialName, s.Size, w.Weight, v.Name AS Purchase_Vendor, pv.Name AS Printing_Vendor, SUM(sfp.quantity), SUM(rp.receivequan) FROM purchaseorder po JOIN size s ON s.id = po.SizeID JOIN weight w ON w.id = po.WeightID JOIN vendor v ON v.ID = po.VendorID JOIN rawmaterialtype rm ON rm.RawMaterialId = po.rawmaterial_ID JOIN sendforprinting sfp ON sfp.PID = po.ID JOIN printingvendor pv ON pv.ID = sfp.printVendor LEFT JOIN receiveprinting rp ON sfp.ID = rp.printID WHERE po.rawmaterial_ID = "+category+" GROUP BY sfp.PID");

			rs.last();


			
			data = new ManagePrintingJobInitial[rs.getRow()];
			rs.beforeFirst();
			int i = 0;
			while (rs.next()) {
				
				data[i] = new ManagePrintingJobInitial();
				data[i].Id = rs.getInt(1);
				data[i].purchaseId = rs.getInt(2);
				data[i].raw = rs.getString(3);
				data[i].size = rs.getString(4);
				data[i].weight = rs.getString(5);
				data[i].vendor = rs.getString(6);
				data[i].printvendor = rs.getString(7);
				data[i].total_Quan = rs.getInt(8);
				data[i].receive_Quan = rs.getInt(9);

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
