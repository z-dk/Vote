package vote.test;


import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import vote.bean.Admin;
import vote.bean.Option;
import vote.bean.OptionExample;
import vote.bean.OptionExample.Criteria;
import vote.bean.User;
import vote.bean.Vote;
import vote.bean.VoteExample;
import vote.dao.AdminMapper;
import vote.dao.OptionMapper;
import vote.dao.UserMapper;
import vote.dao.VoteMapper;

/**
 * 导入spring的测试模块
 * 使用runwith指定单元测试的模块
 * 使用contextconfiguration指定spring配置文件的路径
 * @author z_dk
 *
 */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:applicationContext.xml"})
public class MapperTest {
	
	@Autowired
	UserMapper userMapper;
	@Autowired
	SqlSession sqlSession;
	
	@Test
	public void testUserMapper() {
		System.out.println(userMapper);
		
		UserMapper mapper = sqlSession.getMapper(UserMapper.class);
		User record = new User();
		record.setUserName("zdk");
		record.setUserPassword("1234");
		BigInteger num = new BigInteger("1234");
		record.setPhoneNum(num);
		mapper.insertSelective(record);
		System.out.println("影响的数据库表的行数："+"userid:"+record.getUserId());
	}
	@Test
	public void testAdminMapper() {
		System.out.println(userMapper);
		
		AdminMapper mapper = sqlSession.getMapper(AdminMapper.class);
		Admin record = new Admin();
		record.setAdName("zdk");
		record.setAdPassword("1234");
		mapper.insertSelective(record);
		System.out.println("adid:"+record.getAdId());
	}
	@Test
	public void testVoteMapper() {
		System.out.println(userMapper);
		
		VoteMapper mapper = sqlSession.getMapper(VoteMapper.class);
		Vote record = new Vote();
		record.setVoteName("请选择以下你认为正确的答案？");
		record.setuId(1);
		mapper.insertSelective(record);
		System.out.println("voteid:"+record.getVoteId());
	}
	@Test
	public void testOptionMapper() {
		System.out.println(userMapper);
		
		OptionMapper mapper = sqlSession.getMapper(OptionMapper.class);
		Option record = new Option();
		record.setOpName("zdk");
		record.setvId(1);
		mapper.insertSelective(record);
		System.out.println("opid:"+record.getOpId());
	}
	//根据投票标题查询该投票的候选项
	@Test
	public void testVoteOptionMapper() {
		System.out.println(userMapper);
		
		VoteMapper mapper = sqlSession.getMapper(VoteMapper.class);
		Vote record = new Vote();
		int id = 2;
		record = mapper.selectByPrimaryKeyWithOption(id);
		//System.out.println("voteid:"+record.getVoteId());
		System.out.println("voteName:"+record.getVoteName());
		System.out.println("《==========选项组==========》");
		
		//System.out.println("选项个数:"+record.getOptions().size());
		List<Option> options = record.getOptions();
		for (Option option : options) {
			//System.out.println("optionId:"+option.getOpId());
			System.out.println("optionName:"+option.getOpName());
			//System.out.println("optionBrief:"+option.getOpBrief());
		}
	}
	//批量插入投票候选项
	@Test
	public void testInsertOptionsMapper() {
		OptionMapper mapper = sqlSession.getMapper(OptionMapper.class);
		
		List<Option> options = new ArrayList<Option>();
		Option a = new Option("选项A",2,"第一个选项");
		Option b = new Option("选项B",2,"第二个选项");
		Option c = new Option("选项C",2,"第三个选项");
		Option d = new Option("选项D",2,"第四个选项");
		options.add(a);
		options.add(b);
		options.add(c);
		options.add(d);
		
		for (Option option : options) {
			mapper.insertSelective(option);
			System.out.println("选项的id："+option.getOpId());
		}
	}
	//删除投票主题会连同相应的选项一起删除
	@Test
	public void testDeleteVoteMapper() {
		VoteMapper voteMapper = sqlSession.getMapper(VoteMapper.class);
		OptionMapper opMapper = sqlSession.getMapper(OptionMapper.class);
		
		int id = 1;
		List<Integer> ids = new ArrayList<>();
		ids.add(id);
		OptionExample example = new OptionExample();
		Criteria criteria = example.createCriteria();
		criteria.andVIdIn(ids);
		opMapper.deleteByExample(example);
		voteMapper.deleteByPrimaryKey(id);
		System.out.println("处理成功！"+id);
	}
	//对投票主题进行模糊查询
	@Test
	public void testSelectVoteMapper() {
		VoteMapper voteMapper = sqlSession.getMapper(VoteMapper.class);
		
		String name = "正确";
		VoteExample example = new VoteExample();
		vote.bean.VoteExample.Criteria criteria = example.createCriteria();
		criteria.andVoteNameLike("%"+name+"%");
		List<Vote> votes = voteMapper.selectByExample(example);
		for (Vote vote : votes) {
			System.out.println(vote.getVoteName());
		}
	}
}
