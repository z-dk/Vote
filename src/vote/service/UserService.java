package vote.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import vote.bean.Admin;
import vote.bean.User;
import vote.bean.UserExample;
import vote.bean.UserExample.Criteria;
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

	public boolean checkUser(String userName) {
		UserExample example = new UserExample();
		Criteria criteria = example.createCriteria();
		criteria.andUserNameEqualTo(userName);
		long count = userMapper.countByExample(example);
		return count==0;
	}

	public User getUser(String userName) {
		User user = new User();
		user = userMapper.selectByUserName(userName);
		return user;
	}

}
