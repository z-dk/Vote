package vote.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import vote.bean.Option;
import vote.bean.OptionExample;
import vote.bean.OptionExample.Criteria;
import vote.dao.OptionMapper;
@Service
public class OptionService {
	
	@Autowired
	OptionMapper optionMapper;

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

	public void updateTotal(String id) {
		Option option = new Option();
		option = optionMapper.selectByPrimaryKey(Integer.parseInt(id));
		int total = option.getOpTotal();
		total += 1;
		option.setOpTotal(total);
		optionMapper.updateByPrimaryKeySelective(option);
	}

	public void deleteOption(String opName) {
		OptionExample example = new OptionExample();
		Criteria criteria = example.createCriteria();
		criteria.andOpNameEqualTo(opName);
		optionMapper.deleteByExample(example );
	}

	public void updateOption(List<Option> options) {
		for (Option option : options) {
			if(option.getOpId()==null) {
				optionMapper.insertSelective(option);
			}else {
				optionMapper.updateByPrimaryKeySelective(option);
			}
		}
	}

}
