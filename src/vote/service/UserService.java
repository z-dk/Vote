package vote.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import vote.bean.User;
import vote.dao.UserMapper;

@Service
public class UserService {
	
	@Autowired
	UserMapper userMapper;

	public int create(User user) {
		// TODO Auto-generated method stub
		int count = userMapper.insertSelective(user);
		return count;
	}

}
