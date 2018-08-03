package vote.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import vote.bean.Msg;
import vote.bean.User;
import vote.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	UserService userService;
	
	@ResponseBody
	@RequestMapping("/adduser")
	public Msg addUser(User user) {
		int count = userService.create(user);
		return Msg.success().add("count", count);
	}

}
