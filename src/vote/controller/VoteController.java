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

import vote.bean.Msg;
import vote.bean.Option;
import vote.bean.Vote;
import vote.service.VoteService;

@Controller
public class VoteController {
	
	@Autowired
	VoteService voteService;
	
	@ResponseBody
	@RequestMapping(value="/getvotebytheme/{theme}",method=RequestMethod.POST)
	public Msg adminGetVoteByTheme(@PathVariable("theme") String theme) {
		
		List<Vote> votes = new ArrayList<>();
		votes = voteService.getVoteByTheme(theme);
		return Msg.success().add("votes", votes);
	}
	@ResponseBody
	@RequestMapping(value="/getvotebytheme",method=RequestMethod.POST)
	public Msg adminGetVoteAll() {
		String theme = null;
		List<Vote> votes = new ArrayList<>();
		votes = voteService.getVoteByTheme(theme);
		return Msg.success().add("votes", votes);
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
