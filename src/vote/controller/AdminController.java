package vote.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
	
	/**
	 * 验证用户名密码是否正确
	 * @param ad
	 * @param request
	 * @param response
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/check",method = RequestMethod.GET)
	public Msg adminLogin(Admin ad,HttpServletRequest request,HttpServletResponse response) {
		Admin admin = new Admin();
		admin = adminService.logCheck(ad.getAdName());
		if(admin == null || admin.equals("")) {
			return Msg.fail();
		}
		if(admin.getAdPassword().equals(ad.getAdPassword())) {
			request.getSession().setAttribute("adminName", admin.getAdName());
			return Msg.success().add("admin", admin);
		}
		return Msg.fail();
	}
	
	@RequestMapping("/success")
	public ModelAndView success(@RequestParam("adName")String adName,@RequestParam("adId")int adId) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("adName", adName);
		mv.addObject("adId", adId);
		mv.setViewName("admin");
		return mv;
	}
	@ResponseBody
	@RequestMapping(value="/updatepassword/{adId}",method=RequestMethod.POST)
	public Msg updatepassword(Admin admin) {
		adminService.updatePassword(admin);
		return Msg.success();
	}
	
}
