package vote.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import vote.bean.Limit;
import vote.bean.LimitExample;
import vote.bean.Option;
import vote.bean.OptionExample;
import vote.bean.OptionExample.Criteria;
import vote.bean.UserOption;
import vote.bean.UserOptionExample;
import vote.dao.LimitMapper;
import vote.dao.OptionMapper;
import vote.dao.UserOptionMapper;
@Service
public class OptionService {
	
	@Autowired
	OptionMapper optionMapper;
	
	@Autowired
	LimitMapper limitMapper;
	
	@Autowired
	UserOptionMapper userOptionMapper;

	public void createOption(List<Option> options) {
		for (Option option : options) {
			optionMapper.insertSelective(option);
			
		}
	}

	public List<Option> getOptions(int vId) {
		OptionExample example = new OptionExample();
		Criteria criteria = example.createCriteria();
		criteria.andVIdEqualTo(vId);
		List<Option> options = optionMapper.selectByExample(example );
		return options;
	}

	public void updateTotal(String id,int limitId) {
		Option option = new Option();
		option = optionMapper.selectByPrimaryKey(Integer.parseInt(id));
		int total = option.getOpTotal();
		total += 1;
		option.setOpTotal(total);
		optionMapper.updateByPrimaryKeySelective(option);
		
		UserOption userOption = new UserOption();
		userOption.setOptionId(Integer.parseInt(id));
		userOption.setLimitId(limitId);
		userOptionMapper.insertSelective(userOption);
	}

	public void deleteOption(String opName) {
		
		OptionExample example = new OptionExample();
		Criteria criteria = example.createCriteria();
		criteria.andOpNameEqualTo(opName);
		List<Option> deloptions = optionMapper.selectByExample(example);
		List<Integer> opids = new ArrayList<Integer>();
		for (Option option : deloptions) {
			opids.add(option.getOpId());
		}
		
		deleteLimitAndUserOption(opids);
		
		optionMapper.deleteByExample(example );
	}
	//删除选项对应的外键约束与用户投票限制约束
	public void deleteLimitAndUserOption(List<Integer> opids) {
		UserOptionExample userexample = new UserOptionExample();
		vote.bean.UserOptionExample.Criteria criteria3 = userexample.createCriteria();
		if(opids.size()>0) {
			criteria3.andOptionIdIn(opids);
		}
		if(criteria3.isValid()) {
			
			List<UserOption> userOptions = new ArrayList<UserOption>();
			userOptions = userOptionMapper.selectByExample(userexample);
			List<Integer> limitids = new ArrayList<>();
			for (UserOption userOption : userOptions) {
				limitids.add(userOption.getLimitId());
			}
			
			LimitExample examplelimitid = new LimitExample();
			vote.bean.LimitExample.Criteria criteria4 = examplelimitid.createCriteria();
			criteria4.andIdIn(limitids);
			
			userOptionMapper.deleteByExample(userexample);
			limitMapper.deleteByExample(examplelimitid);
		}
	}

	public void updateOption(List<Option> options) {
		List<Integer> opids = new ArrayList<Integer>();
		for (Option option : options) {
			if(option.getOpId()==null) {
				optionMapper.insertSelective(option);
			}else {
				opids.add(option.getOpId());
				option.setOpTotal(0);
				optionMapper.updateByPrimaryKeySelective(option);
			}
		}
		deleteLimitAndUserOption(opids);
	}
	public void insertLimit(Limit limit) {
		limitMapper.insertSelective(limit);
	}

}
