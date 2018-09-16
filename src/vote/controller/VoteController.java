package vote.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import vote.bean.Limit;
import vote.bean.Msg;
import vote.bean.Option;
import vote.bean.UserOption;
import vote.bean.Vote;
import vote.service.VoteService;

@Controller
public class VoteController {
	
	@Autowired
	VoteService voteService;
	
	/**
	 * 管理员按照搜索主题进行模糊查询
	 * 对查询结果进行分页处理
	 * 在占位符后加do是为了防止当theme为空值时，出现404
	 * @param theme
	 * @param pn
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/getvotebytheme/{theme}do",method=RequestMethod.POST)
	public Msg adminGetVoteByTheme(@PathVariable("theme") String theme,
			@RequestParam(value = "pn", defaultValue = "1") Integer pn,
			@RequestParam(value = "flag") boolean flag) {
		
		
		PageInfo page = voteService.getVoteByTheme(pn,theme,flag);
		
		return Msg.success().add("pageInfo", page);
	}
	
	/**
	 * 管理员对投票信息进行删除
	 * 可以批量删除也可以单个删除
	 * @param ids
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/delete/{ids}",method=RequestMethod.DELETE)
	public Msg adminDeleteVote(@PathVariable("ids")String ids) {
		if(ids.contains("-")) {
			List<Integer> sids = new ArrayList<>();
			String[] str_ids = ids.split("-");
			for (String string : str_ids) {
				sids.add(Integer.parseInt(string));
			}
			voteService.deleteBatch(sids);
		}else {
			Integer id = Integer.parseInt(ids);
			voteService.deleteVote(id);
		}
		return Msg.success();
	}
	
	//======================================华丽的分割线=======================================管理员部分结束
	/**
	 * 根据投票显示列表可以查看投票的详细信息
	 * 返回带有选项信息的投票信息
	 * 返回选项的总得票数
	 * @param voteId
	 * @return
	 */
	@RequestMapping(value="/user/voteinfo",method=RequestMethod.GET)
	public ModelAndView getVoteInfo(@RequestParam("voteId")int voteId,HttpServletRequest request,
			HttpServletResponse response) {
		ModelAndView mv = new ModelAndView();
		Vote vote = new Vote();
		vote = voteService.getVoteInfo(voteId);
		List<Option> options = new ArrayList<>();
		options = vote.getOptions();
		int total = 0;
		for (Option option : options) {
			total +=option.getOpTotal();
		}
		int userId = (int) request.getSession().getAttribute("userId");
		String userName = (String) request.getSession().getAttribute("userName");
		
		List<Limit> myOptions = new ArrayList<Limit>();
		myOptions = voteService.getmyOptions(userId,vote.getVoteId());
		
		List<Integer> optionIds = new ArrayList<Integer>();
		for (Limit limit : myOptions) {
			for (UserOption option : limit.getUserOptions()) {
				optionIds.add(option.getOptionId());
			}
		}
		System.out.println(optionIds);
		
		mv.addObject("userId", userId);
		mv.addObject("userName", userName);
		mv.addObject("total",total);
 		mv.addObject("vote",vote);
 		mv.addObject("myOptions",optionIds);
		mv.setViewName("voteInfo");
		return mv;
	}
	//点击去修改投票按钮，去往相应的修改投票页面
	@RequestMapping("/user/updatevote")
	public ModelAndView updateVote(@RequestParam("voteId")int voteId) {
		ModelAndView mv = new ModelAndView();
		Vote vote = new Vote();
		vote = voteService.getVoteInfo(voteId);
		mv.addObject("vote",vote);
		mv.setViewName("updatevote");
		return mv;
	}
	//创建投票
	@RequestMapping(value="/user/createvote",method=RequestMethod.GET)
	public ModelAndView createVote(@RequestParam("userId")int userId) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("userId",userId);
		mv.setViewName("createvote");
		return mv;
	}
	//下一步，新建选项
	@ResponseBody
	@RequestMapping(value="/createtheme/{uId}/{endtime}",method=RequestMethod.POST)
	public Msg createTheme(Vote vote,@PathVariable("endtime") Date endTime) {
		Date date = new Date();
		vote.setStartTime(date);
		vote.setEndTime(endTime);
		voteService.createTheme(vote);
		return Msg.success().add("vote", vote);
	}
	//用户去往投票列表页面，选择哪个主题进行投票
	@RequestMapping("/user/votesall")
	public ModelAndView toVotesAll() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("votesList");
		return mv;
	}
	//点击去投票按钮，去往相应的投票页面
	@RequestMapping("/user/votingPage")
	public ModelAndView toVotingPage(@RequestParam("voteId")int voteId) {
		ModelAndView mv = new ModelAndView();
		Vote vote = new Vote();
		vote = voteService.getVoteInfo(voteId);
		mv.addObject("vote",vote);
		mv.setViewName("votingPage");
		return mv;
	}
	//=====================================华丽的分割线===========================================用户部分开始
	/**
	 * 用户按照搜索主题进行模糊查询
	 * 对查询结果进行分页处理
	 * 在占位符后加do是为了防止当theme为空值时，出现404
	 * @param theme
	 * @param pn
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/getuservote/{theme}do",method=RequestMethod.POST)
	public Msg userGetVoteByTheme(@PathVariable("theme") String theme,
			@RequestParam(value = "pn", defaultValue = "1") Integer pn,
			@RequestParam(value = "uId") Integer uId) {
		
		PageHelper.startPage(pn, 5);
		List<Vote> votes = voteService.userGetVoteByTheme(theme,uId);
		PageInfo page = new PageInfo(votes, 5);
		return Msg.success().add("pageInfo", page);
	}
	
	/**
	 * 按照搜索主题查询，并过滤自己已投过的投票
	 * @param theme
	 * @param pn
	 * @param userId
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/getvotebylimit/{theme}do",method=RequestMethod.POST)
	public Msg userGetVoteByTheme(@PathVariable("theme") String theme,
			@RequestParam(value = "pn", defaultValue = "1") Integer pn,
			@RequestParam(value = "userId") int userId,
			@RequestParam(value = "flag") boolean flag) {
		
		PageInfo page = voteService.getVoteByLimit(pn,theme,userId,flag);
		return Msg.success().add("pageInfo", page);
	}
	
	@RequestMapping("/help")
	public String toHelp() {
		return "helpcenter";
	}
}
