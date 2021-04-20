package login.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import db.connection.DBConnection;


public class LoginDao {
	
	private static LoginDao instance;
	
	//DB연결시 사용되는 변수
	private Connection con		= null;
	
	//객체생성 메소드
	public static LoginDao getInstance() throws Exception {
	if(instance==null) {
		instance = new LoginDao();
	}
	return instance;
}
	
	//회원 로그인
		public List<LoginRec> confirmMember(String id, String password) throws Exception {
			PreparedStatement ps =null;
			ResultSet rs = null;
			List<LoginRec> list = new ArrayList<LoginRec>();
			
			try {
			con = DBConnection.getConnection();
			
			String sql = "SELECT uscd, name, age, address FROM raspi_db.User where id =? and password=?";
			ps=con.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, password);
			
			rs=ps.executeQuery();
			
			if(rs.next()) {
				
				LoginRec rec = new LoginRec();
				
				rec.setUscd(rs.getInt("uscd"));
				rec.setName(rs.getString("name"));
				rec.setAge(rs.getInt("age"));
				rec.setAddress(rs.getString("address"));
				

				list.add(rec);
			
			}
			 
			}catch(Exception e) {
			e.printStackTrace();
			System.out.println("LoginDao :: 로그인오류 "+e.getMessage());
		}finally {
			if(rs!=null)rs.close();
			if(ps!=null)ps.close();
			if(con!=null)con.close();
		}
		
		return list;
		}


}
