package vote.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import vote.bean.Admin;
import vote.bean.Msg;
import vote.bean.User;
import vote.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	UserService userService;
	
	@ResponseBody
	@RequestMapping(value="/in",method = RequestMethod.GET)
	public Msg adminLogin(User user) {
		
		User u = userService.logCheck(user.getUserName());
		if(u == null || u.equals("")) {
			return Msg.fail();
		}
		if(u.getUserPassword().equals(user.getUserPassword())) {
			return Msg.success().add("user", u);
		}
		return Msg.fail();
	}
	
	
	@ResponseBody
	@RequestMapping("/adduser")
	public Msg addUser(User user) {
		int count = userService.create(user);
		return Msg.success().add("count", count);
	}

	@ResponseBody
	@RequestMapping("/updatepwd/{userId}")
	public Msg updatepwd(User user) {
		userService.updatepwd(user);
		return Msg.success();
	}
	
	@ResponseBody
	@RequestMapping("/updatephone/{userId}")
	public Msg updatephone(User user) {
		userService.updatephone(user);
		return Msg.success();
	}
}
