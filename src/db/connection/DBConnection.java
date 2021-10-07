package db.connection;
import java.sql.Connection;
import java.sql.DriverManager;



public class DBConnection {
	

	public static Connection getConnection(){
		Connection con = null;
		
		/*final String driverName	= "org.mariadb.jdbc.Driver";*/
		final String driverName	= "org.mariadb.jdbc.Driver";
		final String dbURL		= "jdbc:mariadb:/";
		final String dbUser = "";
		final String dbPass = "";
		
		
		try {
			if(con == null){
			//드라이버로딩
			Class.forName(driverName);
			con = DriverManager.getConnection(dbURL, 
					dbUser,
					dbPass);
			
			if( con != null ){ //System.out.println("데이터 베이스 접속 성공"); 
				}
			
			}
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("DBConnection :: DB연결시 오류 "+e.getMessage());
		}
		
		return con;
	}


	
}
