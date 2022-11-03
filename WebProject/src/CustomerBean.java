package classic.web.app;

import java.sql.*;
import java.util.*;

public class CustomerBean implements java.io.Serializable {

	private String id;
	private String password;
        private int did;

	public final String getId() { return id; }
	public final void setId(String value) { id = value; }

	public final String getPassword() { return password; }
	public final void setPassword(String value) { password = value; }

	public final int getdid() { return did; }
	public final void setdid(int value) { did = value; }

	public boolean authenticate() throws SQLException {
		try(var con = DB.connect()){
			var pstmt = con.prepareStatement("select count(id) from admin where id=? and pwd=?");
			pstmt.setString(1, id);
			pstmt.setString(2, password);
			var rs = pstmt.executeQuery();
			rs.next();
			int count = rs.getInt(1);
			rs.close();
			pstmt.close();
			if(count == 1)
				return true;
			id = password = null;
			return false;
		}
	}

	public List<OrderEntry> getOrders() throws SQLException {
		var orders = new ArrayList<OrderEntry>();
		try(var con = DB.connect()){
			var pstmt = con.prepareStatement("select did, deptname, loc from department ");
		//	pstmt.setString(1,id);
			var rs = pstmt.executeQuery();
			while(rs.next())
				orders.add(new OrderEntry(rs));
			rs.close();
			pstmt.close();
		}
		return orders;
	}


	public static class OrderEntry {
		
		private int did;
		private String deptname;
		private String deptloc;

		OrderEntry(ResultSet rs) throws SQLException {
			did = rs.getInt("did");
			deptname = rs.getString("deptname");
			deptloc = rs.getString("loc");
		}

		public final int getdid() { return did; }

		public final String getdname() { return deptname; }

		public final String getdloc() { return deptloc; }
	}
}

