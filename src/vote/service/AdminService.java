package vote.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import vote.bean.Admin;
import vote.bean.Limit;
import vote.bean.LimitExample;
import vote.bean.User;
import vote.bean.UserExample;
import vote.bean.UserExample.Criteria;
import vote.bean.UserOptionExample;
import vote.bean.Vote;
import vote.bean.VoteExample;
import vote.dao.AdminMapper;
import vote.dao.LimitMapper;
import vote.dao.UserMapper;
import vote.dao.UserOptionMapper;
import vote.dao.VoteMapper;

@Service
public class AdminService {

	@Autowired
	AdminMapper adminMapper;
	
	@Autowired
	UserMapper userMapper;
	
	@Autowired
	VoteMapper voteMapper;
	
	@Autowired
	LimitMapper limitMapper;
	
	@Autowired
	UserOptionMapper userOptionMapper;
	
	//根据用户名获取管理员信息返回验证密码
	public Admin logCheck(String name) {
		Admin admin = new Admin();
		admin = adminMapper.selectByName(name);
		return admin;
	}
	//更新管理员密码
	public void updatePassword(Admin admin) {
		adminMapper.updateByPrimaryKeySelective(admin);
	}
	//查询用户并分页显示
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
	//删除用户
	public void deluser(int userId) {
		
		List<Integer> limitids = new ArrayList<Integer>();
		List<Limit> limits = new ArrayList<Limit>();
		LimitExample example = new LimitExample();
		vote.bean.LimitExample.Criteria criteria = example.createCriteria();
		criteria.andUserIdEqualTo(userId);
		limits = limitMapper.selectByExample(example);
		for (Limit limit : limits) {
			limitids.add(limit.getId());
		}
		UserOptionExample userexample = new UserOptionExample();
		vote.bean.UserOptionExample.Criteria criteria2 = userexample.createCriteria();
		criteria2.andLimitIdIn(limitids);
		if(limitids.size()!=0) {
			userOptionMapper.deleteByExample(userexample );			
		}
		for (Limit limit : limits) {
			limitMapper.deleteByPrimaryKey(limit.getId());			
		}
		userMapper.deleteByPrimaryKey(userId);
	}
	//根据用户id获取该用户已发起的投票数
	public long getvotebyuserid(int userId) {
		VoteExample example = new VoteExample();
		vote.bean.VoteExample.Criteria criteria = example.createCriteria();
		criteria.andUIdEqualTo(userId);
		long count = voteMapper.countByExample(example );
		return count;
	}

}
