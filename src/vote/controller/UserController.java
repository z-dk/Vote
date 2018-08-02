package vote.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import vote.bean.User;
import vote.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	UserService userService;
	
	@RequestMapping("/adduser")
	public void addUser(User user,Model model) {
		int count = userService.create(user);
		model.addAttribute("count", count);
		
	}

}
