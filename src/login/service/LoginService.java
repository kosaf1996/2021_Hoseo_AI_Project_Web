package login.service;

import java.util.List;
import login.model.LoginDao;
import login.model.LoginRec;

public class LoginService {

	
	private static LoginService instance;
	
	public static LoginService getInstance() throws Exception {
		if(instance==null) {
			instance = new LoginService();
		}
		return instance;
	}
	
	public  List<LoginRec> confirmMember(String id, String password) throws Exception {
		 List<LoginRec> list = LoginDao.getInstance().confirmMember(id, password);
		
		return list;
	}

	
}
