package vote.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import vote.bean.Admin;
import vote.bean.Msg;
import vote.service.AdminService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	AdminService adminService;

	@ResponseBody
	@RequestMapping(value="/in",method = RequestMethod.GET)
	public Msg adminLogin(Admin ad) {
		Admin admin = new Admin();
		admin = adminService.logCheck(ad.getAdName());
		if(admin == null || admin.equals("")) {
			return Msg.fail();
		}
		if(admin.getAdPassword().equals(ad.getAdPassword())) {
			return Msg.success().add("admin", admin);
		}
		return Msg.fail();
	}
	@RequestMapping("/admin")
	public String admin() {
		return "";
	}
	
}
