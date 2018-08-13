package vote.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import vote.bean.Limit;
import vote.bean.Msg;
import vote.bean.Option;
import vote.bean.Vote;
import vote.service.OptionService;

@Controller
public class OptionController {
	
	@Autowired
	OptionService optionService;
	
	/**
	 * 插入新增的选项
	 * @param opName	选项名称，每个投票有多个选项，所以以数组的形式接收
	 * @param opBrief	选项的简介，同样为数组
	 * @param vId		选项所属的投票主题的id值
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/createoptions/{vId}",method=RequestMethod.POST)
	public Msg createOption(String[] opName,String[] opBrief,@PathVariable("vId")int vId) {
		if(opName.length<1) {
			return Msg.fail();
		}
		List<Option> options = new ArrayList<>();
		for(int i=0;i<opName.length;i++) {
			Option option = new Option();
			option.setOpName(opName[i]);
			option.setOpBrief(opBrief[i]);
			option.setvId(vId);
			options.add(option);
		}
		optionService.createOption(options);
		return Msg.success();
	}
	/**
	 * 修改投票选项信息，包括选项名称，选项简介
	 * @param opName
	 * @param opBrief
	 * @param opId
	 * @param vId
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/updateoptions/{vId}",method=RequestMethod.POST)
	public Msg updateOption(String[] opName,String[] opBrief,int[] opId,@PathVariable("vId")int vId) {
		if(opName.length<1) {
			return Msg.fail();
		}
		List<Option> options = new ArrayList<>();
		if(opName.length==opId.length) {
			for(int i=0;i<opName.length;i++) {
				Option option = new Option();
				
				option.setOpId(opId[i]);
				option.setOpName(opName[i]);
				option.setOpBrief(opBrief[i]);
				option.setvId(vId);
				options.add(option);
			}
		}else {
			for(int i=0;i<opId.length;i++) {
				Option option = new Option();
				
				option.setOpId(opId[i]);
				option.setOpName(opName[i]);
				option.setOpBrief(opBrief[i]);
				option.setvId(vId);
				options.add(option);
			}
			for(int i=opId.length;i<opName.length;i++) {
				Option option = new Option();
				option.setOpName(opName[i]);
				option.setvId(vId);
				if(opBrief[i].equals("")||opBrief[i]==null) {
					options.add(option);
				}else {
					option.setOpBrief(opBrief[i]);
					options.add(option);
				}
			}
		}
		optionService.updateOption(options);
		return Msg.success();
	}
	/**
	 * 根据投票的id值获取到相应的投票候选项
	 * @param vId
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/getoptionbyvid/{vId}",method=RequestMethod.GET)
	public Msg getVoteOptions(@PathVariable("vId")int vId) {
		List<Option> options = optionService.getOptions(vId);
		return Msg.success().add("options", options);
	}
	/**
	 * 对投票操作进行计数，每一票加一记录
	 * @param ids
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/votingto/{ids}")
	public Msg votingTo(@PathVariable("ids")String ids,@RequestParam("voteId")int voteId,
			HttpServletRequest request) {
		if(ids.contains("-")) {
			List<Integer> sids = new ArrayList<>();
			String[] str_ids = ids.split("-");
			for (String id : str_ids) {
				optionService.updateTotal(id);
			}
		}else {
			optionService.updateTotal(ids);
		}
		Limit limit = new Limit();
		int userId = (int) request.getSession().getAttribute("userId");
		limit.setUserId(userId);
		limit.setVoteId(voteId);
		optionService.insertLimit(limit);
		return Msg.success();
	}
	
	@ResponseBody
	@RequestMapping("/checklimit/{voteId}")
	public Msg votelimit(@PathVariable("voteId")int voteId,HttpServletRequest request) {
		Limit limit = new Limit();
		int userId = (int) request.getSession().getAttribute("userId");
		limit.setUserId(userId);
		limit.setVoteId(voteId);
		boolean result = optionService.check(limit);
		return Msg.success().add("result", result);
	}
	
	@ResponseBody
	@RequestMapping(value="/deleteoption/{opName}",method=RequestMethod.DELETE)
	public Msg deleteOption(@PathVariable("opName")String opName) {
		optionService.deleteOption(opName);
		return Msg.success();
	}
}
