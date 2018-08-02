package vote.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import vote.bean.Admin;
import vote.bean.Msg;
import vote.bean.Vote;
import vote.bean.VoteExample;
import vote.service.AdminService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	AdminService adminService;

	@RequestMapping("/log")
	public String adminLog() {
		return "admin";
	}
	@ResponseBody
	@RequestMapping(value="/in",method = RequestMethod.GET)
	public Msg adminLogin(Admin ad) {
		Admin admin = new Admin();
		admin = adminService.logCheck(ad.getAdName());
		if(admin.getAdPassword().equals(ad.getAdPassword())) {
			return Msg.success();
		}
		return Msg.fail();
	}
	
	
}
