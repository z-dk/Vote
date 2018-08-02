package vote.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import vote.bean.Admin;
import vote.bean.Vote;
import vote.dao.AdminMapper;

@Service
public class AdminService {

	@Autowired
	AdminMapper adminMapper;
	
	public Admin logCheck(String name) {
		Admin admin = new Admin();
		admin = adminMapper.selectByName(name);
		return admin;
	}

}
