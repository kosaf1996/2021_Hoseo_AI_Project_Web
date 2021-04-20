package Anomaly.service;

import java.util.List;

import Anomaly.model.AnomalyDao;
import Anomaly.model.AnomalyRec;

public class AnomalyService {

private static AnomalyService instance;
	
	public static AnomalyService getInstance() throws Exception {
		if(instance==null) {
			instance = new AnomalyService();
		}
		return instance;
	}
	
	// Anomaly SELECT
	public List<AnomalyRec> data_list(int uscd) throws Exception{
		List<AnomalyRec> list = AnomalyDao.getInstance().list(uscd);
		return list;
	}

}
