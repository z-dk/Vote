package vote.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import vote.bean.Admin;
import vote.bean.User;
import vote.dao.UserMapper;

@Service
public class UserService {
	
	@Autowired
	UserMapper userMapper;

	public int create(User user) {
		int count = userMapper.insertSelective(user);
		return count;
	}

	public User logCheck(String userName) {
		User user = userMapper.selectByUserName(userName);
		return user;
	}

	public void updatepwd(User user) {
		userMapper.updateByPrimaryKeySelective(user);
	}

	public void updatephone(User user) {
		userMapper.updateByPrimaryKeySelective(user);
	}

}
