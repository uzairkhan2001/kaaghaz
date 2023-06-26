package create_compiling_job;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class CreateCompilingJob {
	CreateCompilingJobIni[] data = null;

	public CreateCompilingJobIni[] createCompilingJob(int size,int weight) {

try {
			
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fyp", "root", "");
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT rm.RawMaterialName, s.Size, w.Weight, SUM(rp.receivequan) FROM purchaseorder po LEFT JOIN size s ON s.id = po.SizeID LEFT JOIN weight w ON w.id = po.WeightID LEFT JOIN rawmaterialtype rm ON rm.RawMaterialId = po.rawmaterial_ID JOIN sendforprinting sfp ON sfp.PID = po.ID JOIN receiveprinting rp ON rp.printID = sfp.ID WHERE s.ID = "+size+" AND w.ID = "+weight+" GROUP BY rm.RawMaterialName;");

			rs.last();


			
			data = new CreateCompilingJobIni[rs.getRow()];
			rs.beforeFirst();
			int i = 0;
			while (rs.next()) {
				
				data[i] = new CreateCompilingJobIni();
				data[i].raw = rs.getString(1);
				data[i].size = rs.getString(2);
				data[i].weight = rs.getString(3);
				data[i].Quan_available = rs.getInt(4);

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


