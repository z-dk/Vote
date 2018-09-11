package vote.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import vote.bean.Limit;
import vote.bean.LimitExample;
import vote.bean.Option;
import vote.bean.OptionExample;
import vote.bean.User;
import vote.bean.UserExample;
import vote.bean.UserOption;
import vote.bean.UserOptionExample;
import vote.bean.Vote;
import vote.bean.VoteExample;
import vote.bean.VoteExample.Criteria;
import vote.dao.LimitMapper;
import vote.dao.OptionMapper;
import vote.dao.UserMapper;
import vote.dao.UserOptionMapper;
import vote.dao.VoteMapper;

@Service
public class VoteService {
	
	@Autowired
	UserMapper userMapper;
	
	@Autowired
	LimitMapper limitMapper;

	@Autowired
	VoteMapper voteMapper;
	
	@Autowired
	OptionMapper optionMapper;
	
	@Autowired
	UserOptionMapper userOptionMapper;

	public PageInfo getVoteByTheme(int pn,String theme, boolean flag) {
		// TODO Auto-generated method stub
		if(flag) {
			VoteExample example = new VoteExample();
			Criteria criteria = example.createCriteria();
			if(theme==null||"".equals(theme)) {
				criteria.andVoteNameLike("%%");
			}else {
				criteria.andVoteNameLike("%"+theme+"%");
			}
			Date date = new Date();
			criteria.andEndTimeGreaterThan(date);
			List<Vote> votes = new ArrayList<>();
			PageHelper.startPage(pn, 5);
			votes = voteMapper.selectByExample(example);
			PageInfo page = new PageInfo(votes, 5);
			return page;
		}
		else {
			UserExample example = new UserExample();
			vote.bean.UserExample.Criteria criteria = example.createCriteria();
			if(theme==null||"".equals(theme)) {
				criteria.andUserNameLike("%%");
			}else {
				criteria.andUserNameLike("%"+theme+"%");
			}
			List<User> users = new ArrayList<>();
			users = userMapper.selectByExample(example);
			List<Integer> uids = new ArrayList<>();
			for (User user : users) {
				uids.add(user.getUserId());
			}
			VoteExample voteExample = new VoteExample();
			Criteria criteria2 = voteExample.createCriteria();
			criteria2.andUIdIn(uids);
			List<Vote> votes = new ArrayList<>();
			PageHelper.startPage(pn, 5);
			votes = voteMapper.selectByExample(voteExample);
			PageInfo page = new PageInfo(votes, 5);
			return page;
		}
	}
	/**
	 * 根据vote的id删除vote
	 * 先删除外键（已投选项，投票限制，投票选项），再删除投票主题
	 * @param id
	 * @return
	 */
	public int deleteVote(int id) {
		OptionExample example = new OptionExample();
		vote.bean.OptionExample.Criteria criteria = example.createCriteria();
		List<Integer> ids = new ArrayList<>();
		ids.add(id);
		criteria.andVIdIn(ids );
		
		LimitExample examplelimitid = new LimitExample();
		vote.bean.LimitExample.Criteria criteria4 = examplelimitid.createCriteria();
		criteria4.andVoteIdEqualTo(id);
		List<Limit> limits = limitMapper.selectByExample(examplelimitid );
		
		UserOptionExample userexample = new UserOptionExample();
		vote.bean.UserOptionExample.Criteria criteria3 = userexample.createCriteria();
		List<Integer> limitids = new ArrayList<>();
		for (Limit limit : limits) {
			limitids.add(limit.getId());
		}
		if(limitids.size()>0) {
			criteria3.andLimitIdIn(limitids );
		}
		
		LimitExample example2 = new LimitExample();
		vote.bean.LimitExample.Criteria criteria2 = example2.createCriteria();
		criteria2.andVoteIdEqualTo(id);
		if(criteria3.isValid()) {
			userOptionMapper.deleteByExample(userexample );
		}
		if(criteria4.isValid()) {
			limitMapper.deleteByExample(example2 );
		}
		if(criteria.isValid()) {
			optionMapper.deleteByExample(example);
		}
		int count = voteMapper.deleteByPrimaryKey(id);
		return count;
	}

	public void deleteBatch(List<Integer> sids) {
		int count = 0;
		for (Integer id : sids) {
			deleteVote(id);
			count++;
		}
	}

	public Vote getVoteInfo(int id) {
		Vote vote = new Vote();
		vote = voteMapper.selectByPrimaryKeyWithOption(id);
		return vote;
	}


	public List<Vote> userGetVoteByTheme(String theme, Integer uId) {
		VoteExample example = new VoteExample();
		Criteria criteria = example.createCriteria();
		criteria.andUIdEqualTo(uId);
		if(theme==null||"".equals(theme)) {
			criteria.andVoteNameLike("%%");
		}else {
			criteria.andVoteNameLike("%"+theme+"%");
		}
		List<Vote> votes = new ArrayList<>();
		votes = voteMapper.selectByExample(example);
		return votes;
	}

	public void createTheme(Vote vote) {
		voteMapper.insertSelective(vote);
	}

	/**
	 * 用户获取尚未投票的列表
	 * @param theme
	 * @param userId
	 * @return
	 */
	public PageInfo getVoteByLimit(int pn, String theme, int userId, boolean flag) {
		
		List<Limit> limits = new ArrayList<>();
		LimitExample limitexample = new LimitExample();
		vote.bean.LimitExample.Criteria criteria2 = limitexample.createCriteria();
		criteria2.andUserIdEqualTo(userId);
		limits = limitMapper.selectByExample(limitexample);
		
		VoteExample example = new VoteExample();
		Criteria criteria = example.createCriteria();
		
		List<Integer> voteIds = new ArrayList<>();
		for (Limit limit : limits) {
			voteIds.add(limit.getVoteId());
		}
		Date date = new Date();
		
		if(flag) {
			if(voteIds.size()!=0) {				
				criteria.andVoteIdNotIn(voteIds);
			}
			if(theme==null||"".equals(theme)) {
				criteria.andVoteNameLike("%%");
			}else {
				criteria.andVoteNameLike("%"+theme+"%");
			}
			criteria.andEndTimeGreaterThan(date);
		}else {
			if(voteIds.size()!=0) {				
				criteria.andVoteIdIn(voteIds);
				if(theme==null||"".equals(theme)) {
					criteria.andVoteNameLike("%%");
				}else {
					criteria.andVoteNameLike("%"+theme+"%");
				}
			}else {
				return null;
			}
			
		}
		
		List<Vote> votes = new ArrayList<>();
		PageHelper.startPage(pn, 5);
		votes = voteMapper.selectByExample(example);
		PageInfo page = new PageInfo(votes, 5);
		return page;
	}

	public List<Limit> getmyOptions(int userId, Integer voteId) {
		LimitExample example = new LimitExample();
		vote.bean.LimitExample.Criteria criteria = example.createCriteria();
		criteria.andVoteIdEqualTo(voteId);
		criteria.andUserIdEqualTo(userId);
		List<Limit> myOptions = limitMapper.selectByExampleWithOption(example );
		return myOptions;
	}
	
}
