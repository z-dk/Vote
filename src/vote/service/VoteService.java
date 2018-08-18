package vote.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import vote.bean.OptionExample;
import vote.bean.Vote;
import vote.bean.VoteExample;
import vote.bean.VoteExample.Criteria;
import vote.dao.OptionMapper;
import vote.dao.VoteMapper;

@Service
public class VoteService {

	@Autowired
	VoteMapper voteMapper;
	
	@Autowired
	OptionMapper optionMapper;

	public List<Vote> getVoteByTheme(String theme) {
		// TODO Auto-generated method stub
		
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
		votes = voteMapper.selectByExample(example);
		return votes;
	}

	public int deleteVote(int id) {
		OptionExample example = new OptionExample();
		vote.bean.OptionExample.Criteria criteria = example.createCriteria();
		List<Integer> ids = new ArrayList<>();
		ids.add(id);
		criteria.andVIdIn(ids );
		optionMapper.deleteByExample(example );
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

	
}
