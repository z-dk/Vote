package vote.controller;

import java.util.ArrayList;
import java.util.List;

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


import vote.bean.Msg;
import vote.bean.Vote;
import vote.service.VoteService;

@Controller
public class VoteController {
	
	@Autowired
	VoteService voteService;
	
	
	/**
	 * 查询员工数据，分页查询
	 */
	@RequestMapping("/votes")
	@ResponseBody
	public Msg getEmpsWithJson(@RequestParam(value = "pn", defaultValue = "1") Integer pn) {
		// 引入分页插件
		// 使用pagehelper插件
		PageHelper.startPage(pn, 5);
		// 紧跟的方法就是使用分页插件的方法
		List<Vote> votes = voteService.getAll();
		// 使用pageinfo封装分页信息,连续传入5页
		PageInfo page = new PageInfo(votes, 5);
		return Msg.success().add("pageInfo", page);
	}
	
	@ResponseBody
	@RequestMapping(value="/getvotebytheme/{theme}",method=RequestMethod.POST)
	public Msg adminGetVoteByTheme(@PathVariable("theme")String theme,
			@RequestParam(value = "pn", defaultValue = "1") Integer pn) {
		
		PageHelper.startPage(pn, 5);
		List<Vote> votes = voteService.getVoteByTheme(theme);
		PageInfo page = new PageInfo(votes, 5);
		return Msg.success().add("pageInfo", page);
	}
	@ResponseBody
	@RequestMapping(value="/getvotebytheme",method=RequestMethod.POST)
	public Msg adminGetVoteAll() {
		String theme = null;
		PageHelper.startPage(1, 5);
		List<Vote> votes = voteService.getVoteByTheme(theme);
		PageInfo page = new PageInfo(votes, 5);
		return Msg.success().add("pageInfo", page);
	}
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
	//@ResponseBody
	@RequestMapping(value="/voteinfo",method=RequestMethod.GET)
	public ModelAndView getVoteInfo(@RequestParam("voteId")int voteId) {
		ModelAndView mv = new ModelAndView();
		Vote vote = new Vote();
		vote = voteService.getVoteInfo(voteId);
		mv.addObject("vote",vote);
		mv.setViewName("voteInfo");
		return mv;
	}
}
