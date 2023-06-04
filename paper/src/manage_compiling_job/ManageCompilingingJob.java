package manage_compiling_job;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class ManageCompilingingJob {
	ManageCompilingJobInitial[] data = null;

	public ManageCompilingJobInitial[] manageCompilingJob(int category) {

try {
			
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fyp", "root", "");
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT sfc.ID, sfc.printID, s.Size, w.Weight, v.Name AS Purchase_Vendor, pv.Name AS Printing_Vendor, cv.Name AS Compiling_Vendor, sfc.quantity, SUM(rc.receivequantity) AS Total_Receive_Quantity FROM purchaseorder po JOIN size s ON s.id = po.SizeID JOIN weight w ON w.id = po.WeightID JOIN vendor v ON v.ID = po.VendorID JOIN rawmaterialtype rm ON rm.RawMaterialId = po.rawmaterial_ID JOIN sendforprinting sfp ON sfp.PID = po.ID JOIN printingvendor pv ON pv.ID = sfp.printVendor LEFT JOIN sendforcompiling sfc ON sfc.printID = sfp.ID LEFT JOIN receivecompiling rc ON sfc.ID = rc.compileID JOIN compilingvendor cv ON cv.ID = sfc.compilingVendor WHERE po.rawmaterial_ID = "+category+" GROUP BY sfc.ID;");

			rs.last();


			
			data = new ManageCompilingJobInitial[rs.getRow()];
			rs.beforeFirst();
			int i = 0;
			while (rs.next()) {
				
				data[i] = new ManageCompilingJobInitial();
				data[i].Id = rs.getInt(1);
				data[i].printId = rs.getInt(2);
				data[i].size = rs.getString(3);
				data[i].weight = rs.getString(4);
				data[i].vendor = rs.getString(5);
				data[i].printvendor = rs.getString(6);
				data[i].compilevendor = rs.getString(7);
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
