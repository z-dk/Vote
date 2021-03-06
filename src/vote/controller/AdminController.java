package vote.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
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

import com.github.pagehelper.PageInfo;

import vote.bean.Admin;
import vote.bean.Msg;
import vote.bean.Option;
import vote.bean.User;
import vote.bean.Vote;
import vote.service.AdminService;
import vote.service.UserService;
import vote.service.VoteService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	AdminService adminService;
	
	@Autowired
	VoteService voteService;
	
	//通过地址栏进入管理员登录界面
	@RequestMapping("/")
	public void toAdminPage(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/ad.jsp").forward(request, response);
	}
	/**
	 * 验证用户名密码是否正确
	 * @param ad
	 * @param request
	 * @param response
	 * @return密码不正确返回错误信息，密码正确将管理员登录信息存入session中，以便判断是否已经登录
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
			request.getSession().setAttribute("adName", admin.getAdName());
			request.getSession().setAttribute("adId", admin.getAdId());
			return Msg.success().add("admin", admin);
		}
		return Msg.fail();
	}
	//跳转到管理员登录成功后的页面
	@RequestMapping("/success")
	public ModelAndView success(@RequestParam("adName")String adName,@RequestParam("adId")int adId) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("adName", adName);
		mv.addObject("adId", adId);
		mv.setViewName("admin");
		return mv;
	}
	//管理员更新密码
	@ResponseBody
	@RequestMapping(value="/updatepassword/{adId}",method=RequestMethod.POST)
	public Msg updatepassword(Admin admin) {
		adminService.updatePassword(admin);
		return Msg.success();
	}
	//管理员查看投票信息
	@RequestMapping(value="/voteinfo",method=RequestMethod.GET)
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
		int adId = (int) request.getSession().getAttribute("adId");
		String adName = (String) request.getSession().getAttribute("adName");
		mv.addObject("adId", adId);
		mv.addObject("adName", adName);
		mv.addObject("total",total);
 		mv.addObject("vote",vote);
		mv.setViewName("voteInfo");
		return mv;
	}
	//管理员进入用户管理页面
	@RequestMapping("/users")
	public ModelAndView Users(@RequestParam("adName") String adName,
			@RequestParam("adId") int adId) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("adusers");
		mv.addObject("adName",adName);
		mv.addObject("adId",adId);
		return mv;
	}
	//管理员获取用户列表，可按用户名姓名搜索
	@ResponseBody
	@RequestMapping(value="/getusers/{theme}do",method=RequestMethod.POST)
	public Msg getUsers(@PathVariable("theme") String theme,
			@RequestParam("pn") int pn) {
		List<User> users = new ArrayList<User>();
		PageInfo page = adminService.getUsers(pn,theme);
		return Msg.success().add("pageInfo", page);
	}
	//删除用户
	@RequestMapping("/del")
	public ModelAndView delUser(@RequestParam("userId") int userId,
			HttpServletRequest request) {
		adminService.deluser(userId);
		String adName = (String) request.getSession().getAttribute("adName");
		int adId = (int) request.getSession().getAttribute("adId");
		ModelAndView mv = Users(adName,adId);
		return mv;
	}
	//判断某个用户是否有已发起的投票
	@ResponseBody
	@RequestMapping("/getvotebyuserid")
	public Msg getvotebyuserid(@RequestParam("userId") int userId) {
		long count = adminService.getvotebyuserid(userId);
		return Msg.success().add("count", count);
	}
}
