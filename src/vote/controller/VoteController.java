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

import vote.bean.Msg;
import vote.bean.Vote;
import vote.service.VoteService;

@Controller
public class VoteController {
	
	@Autowired
	VoteService voteService;
	
	@ResponseBody
	@RequestMapping(value="/getvotebytheme/{theme}",method=RequestMethod.GET)
	public Msg adminGetVoteByTheme(@PathVariable("theme") String theme) {
		
		List<Vote> votes = new ArrayList<>();
		votes = voteService.getVoteByTheme(theme);
		return Msg.success().add("votes", votes);
	}
	@ResponseBody
	@RequestMapping(value="/getvotebytheme",method=RequestMethod.GET)
	public Msg adminGetVoteAll() {
		String theme = null;
		List<Vote> votes = new ArrayList<>();
		votes = voteService.getVoteByTheme(theme);
		return Msg.success().add("votes", votes);
	}
	@ResponseBody
	@RequestMapping(value="/delete/{id}",method=RequestMethod.DELETE)
	public Msg adminDeleteVote(@PathVariable("id")int id) {
		int count = voteService.deleteVote(id);
		return Msg.success().add("count", count);
	}
}
