package classic.web.app;

import java.sql.*;
import java.util.*;

public class DepartmentBean implements java.io.Serializable {

        private int did;

	public final int getdeptdid() { return did; }
	public final void setdid(int value) { did = value; }

	public List<DetailEntry> getDetails() throws SQLException {
		var details = new ArrayList<DetailEntry>();
		try(var con = DB.connect()){
			var pstmt = con.prepareStatement("select * from employee where did=?");
			pstmt.setInt(1,did);
			var rs = pstmt.executeQuery();
			while(rs.next())
				details.add(new DetailEntry(rs));
			rs.close();
			pstmt.close();
		}
		return details;
	}


	public static class DetailEntry {
		
		private int did;
		private int eid;
		private int age;
		private double sal;
		private String ename;

		DetailEntry(ResultSet rs) throws SQLException {
			did = rs.getInt("did");
			ename = rs.getString("ename");
			sal = rs.getDouble("sal");
			age = rs.getInt("age");
			eid = rs.getInt("eid");
		}

		public final int getdid() { return did; }

		public final String getename() { return ename; }

		public final int geteid() { return eid; }

		public final int getage() { return age; }

		public final double getsal () { return sal; }


	}
}

