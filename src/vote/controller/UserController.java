package vote.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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
	@RequestMapping(value="/check",method = RequestMethod.GET)
	public Msg userLogin(User user,HttpServletRequest request,HttpServletResponse response) {
		User u = userService.logCheck(user.getUserName());
		if(u == null || u.equals("")) {
			return Msg.fail();
		}
		if(u.getUserPassword().equals(user.getUserPassword())) {
			request.getSession().setAttribute("userName", user.getUserName());
			request.getSession().setAttribute("userId", u.getUserId());
			return Msg.success().add("user", u);
		}
		return Msg.fail();
	}
	
	@ResponseBody
	@RequestMapping("/checkuser")
	public Msg checkuser(@RequestParam("userName") String userName) {
		String regx = "(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})";
		if(!userName.matches(regx)){
			return Msg.fail().add("va_msg", "用户名为6-16位英文或2-5位中文");
		}
		boolean b = userService.checkUser(userName);
		if(b){
			return Msg.success();
		}else{
			return Msg.fail().add("va_msg", "用户名已存在");
		}
	}

	@RequestMapping("/success")
	public ModelAndView success(@RequestParam("userName")String userName,@RequestParam("userId")int userId) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("userName", userName);
		mv.addObject("userId", userId);
		mv.setViewName("user");
		return mv;
	}
	@ResponseBody
	@RequestMapping(value="/adduser",method=RequestMethod.POST)
	public Msg addUser(@Valid User user,BindingResult result) {
		if(result.hasErrors()){
			Map<String, Object> map = new HashMap<String, Object>();
			List<FieldError> errors = result.getFieldErrors();
			for (FieldError fieldError : errors) {
				System.out.println("错误字段名称"+fieldError.getField());
				System.out.println("错误字段信息"+fieldError.getDefaultMessage());
				map.put(fieldError.getField(), fieldError.getDefaultMessage());
			}
			return Msg.fail().add("errorFields", map);}
		else {
		    int count = userService.create(user);
		    return Msg.success().add("count", count);}
	}

	@ResponseBody
	@RequestMapping("/updatepwd/{userId}")
	public Msg updatepwd( @Valid User user,BindingResult result) {
		if(result.hasErrors()){
			Map<String, Object> map = new HashMap<String, Object>();
			List<FieldError> errors = result.getFieldErrors();
			for (FieldError fieldError : errors) {
				System.out.println("错误字段名称"+fieldError.getField());
				System.out.println("错误字段信息"+fieldError.getDefaultMessage());
				map.put(fieldError.getField(), fieldError.getDefaultMessage());
			}
			return Msg.fail().add("errorFields", map);}
		else {
		userService.updatepwd(user);
		return Msg.success();}
	}
	
	@ResponseBody
	@RequestMapping(value="/findpwd",method=RequestMethod.POST)
	public Msg findpwd(@Valid User user,BindingResult result) {
		if(result.hasErrors()){
			Map<String, Object> map = new HashMap<String, Object>();
			List<FieldError> errors = result.getFieldErrors();
			for (FieldError fieldError : errors) {
				System.out.println("错误字段名称"+fieldError.getField());
				System.out.println("错误字段信息"+fieldError.getDefaultMessage());
				map.put(fieldError.getField(), fieldError.getDefaultMessage());
			}
			return Msg.fail().add("errorFields", map);
		}
		User userTrue = userService.getUser(user.getUserName());
		if(userTrue ==null) {
			Map<String, Object> map = new HashMap<String, Object>();
			return Msg.fail().add("errorFields", map);
		}
		if(0==user.getPhoneNum().compareTo(userTrue.getPhoneNum())) {
			userTrue.setUserPassword(user.getUserPassword());
			userService.updatepwd(userTrue);
			return Msg.success();
		}
		Map<String, Object> map = new HashMap<String, Object>();
		return Msg.fail().add("errorFields", map);
	}
	
	@ResponseBody
	@RequestMapping("/updatephone/{userId}")
	public Msg updatephone(User user) {
		userService.updatephone(user);
		return Msg.success();
	}
	
	@RequestMapping("/exit")
	public void exit(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		request.getSession().removeAttribute("userName");
		request.getSession().removeAttribute("userId");
		request.getRequestDispatcher("/index.jsp").forward(request, response);
	}
}
