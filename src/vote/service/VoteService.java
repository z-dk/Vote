package vote.service;

import java.util.ArrayList;
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
	
	
}
