package vote.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import vote.bean.Admin;
import vote.bean.User;
import vote.bean.UserExample;
import vote.bean.UserExample.Criteria;
import vote.bean.Vote;
import vote.bean.VoteExample;
import vote.dao.AdminMapper;
import vote.dao.UserMapper;
import vote.dao.VoteMapper;

@Service
public class AdminService {

	@Autowired
	AdminMapper adminMapper;
	
	@Autowired
	UserMapper userMapper;
	
	@Autowired
	VoteMapper voteMapper;
	
	public Admin logCheck(String name) {
		Admin admin = new Admin();
		admin = adminMapper.selectByName(name);
		return admin;
	}

	public void updatePassword(Admin admin) {
		adminMapper.updateByPrimaryKeySelective(admin);
	}

	public PageInfo getUsers(int pn,String theme) {
		List<User> users = new ArrayList<User>();
		
		UserExample example = new UserExample();
		Criteria criteria = example.createCriteria();
		if(theme==null||"".equals(theme)) {
			criteria.andUserNameLike("%%");
		}else {
			criteria.andUserNameLike("%"+theme+"%");
		}
		PageHelper.startPage(pn, 5);
		users = userMapper.selectByExample(example);
		PageInfo page = new PageInfo(users, 5);
		return page;
	}

	public void deluser(int userId) {
		userMapper.deleteByPrimaryKey(userId);
	}

	public long getvotebyuserid(int userId) {
		VoteExample example = new VoteExample();
		vote.bean.VoteExample.Criteria criteria = example.createCriteria();
		criteria.andUIdEqualTo(userId);
		long count = voteMapper.countByExample(example );
		return count;
	}

}
