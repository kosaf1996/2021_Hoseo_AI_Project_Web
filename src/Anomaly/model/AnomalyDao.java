package Anomaly.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import db.connection.DBConnection;


public class AnomalyDao {
	
private static AnomalyDao instance;
	
	//DB����� ���Ǵ� ����
	private Connection con		= null;
	
	
	//��ü���� �޼ҵ�
		public static AnomalyDao getInstance() throws Exception {
		if(instance==null) {
			instance = new AnomalyDao();
		}
		return instance;
	}


		//����Ʈ
				public List<AnomalyRec> list(int uscd) throws Exception {
					PreparedStatement ps =null;
					ResultSet rs = null;
					List<AnomalyRec> list = new ArrayList<AnomalyRec>();
					String sql="";
					
					try {
						con = DBConnection.getConnection();
	
						sql = "SELECT uscd, temp, humidity FROM raspi_db.Anomaly where uscd = ?;";
						
						ps = con.prepareStatement(sql);
						System.out.println(ps);
						ps.setInt(1, uscd);
						

						rs=ps.executeQuery();
						
							rs.last();
							int size = rs.getRow();
							rs.first();
						
						
					
							for(int i=0; i<size; i++){
							AnomalyRec rec = new AnomalyRec();
							rec.setUscd(rs.getInt("uscd"));
							rec.setTemp(rs.getInt("temp"));
							rec.setHumidity(rs.getInt("humidity"));
							list.add(rec);
								rs.next();
							}

					}catch(Exception e) {
						e.printStackTrace();
						System.out.println("AnomalyDao :: ����Ʈ ��ȸ ���� : "+e.getMessage());
					}finally {
						if(rs!=null)rs.close();
						if(ps!=null)ps.close();
						if(con!=null)con.close();
					}
					return list;
				}
				
				
				
				
			
}
