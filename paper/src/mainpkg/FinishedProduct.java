package mainpkg;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;


public class FinishedProduct {
	FinsihedProductIni[] data = null;

	public FinsihedProductIni[] finishedProduct() {

try {
			
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fyp", "root", "");
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT sfc.ID,sfb.ID,s.Size, w.Weight, rb.`paperQuantity`, rb.`titlecardQuantity`, rb.`separatorcardQuantity` FROM `sendforcompiling` sfc JOIN Size s ON s.ID = sfc.Size JOIN Weight w ON w.ID = sfc.Weight JOIN compilingVendor cv ON cv.ID = sfc.compilingVendor JOIN receivecompiling rc ON rc.compileID = sfc.ID JOIN sendforbinding sfb ON sfb.compileId = rc.compileID JOIN bindingvendor bv ON bv.ID = sfb.bindingVendor JOIN receivebinding rb ON rb.bindId = sfb.ID;");

			rs.last();
			
			data = new FinsihedProductIni[rs.getRow()];
			rs.beforeFirst();
			int i = 0;
			while (rs.next()) {
				data[i] = new FinsihedProductIni();
				data[i].cid = rs.getInt(1);
				data[i].bid = rs.getInt(2);
				data[i].size = rs.getString(3);
				data[i].weight = rs.getString(4);
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
