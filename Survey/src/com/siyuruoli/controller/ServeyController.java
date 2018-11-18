package com.siyuruoli.controller;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.siyuruoli.model.User;
import com.siyuruoli.po.UserPo;
import com.siyuruoli.service.UserService;
/**
 * 登录、注册的控制器
 * @author biao
 *
 */
@Controller
public class ServeyController {
	@Autowired 
	private UserService userService;
	
	@RequestMapping("/entry")
	public String entry(){
		
		return "entry";
	}
	
	@RequestMapping("/register")
	public String register(){
		
		return "register";
	}
	
	@RequestMapping("/login")
	public String login(){
		
		return "login";
	}
	
	/**
	 * 跳转到主界面，并将user保存到Session中
	 * @param user
	 * @param request
	 * @return
	 */
	@RequestMapping("/main")
	public String main(User user,HttpServletRequest request){
		User u =userService.queryUser(user);
		HttpSession session=request.getSession();
		session.setAttribute("user",u);
		
		return "main";
	}
	
	//注册时添加用户
	@RequestMapping("/reallyRegister")
	public String reallyRegister(UserPo userPo){
		int userId=userService.queryCount();
		userPo.setUserId(userId+1);
		userPo.setUserType("用户");
		userPo.setIsDestroy("否");
		userService.insertUser(userPo);
		return "login";
	}
	
	//注册时判断账号
	@RequestMapping("/account")
	public ResponseEntity<User> Account(HttpEntity<User> httpEntity){
		User user=httpEntity.getBody();
		User users=userService.queryUser(user);
		ResponseEntity<User> responseEntity=new ResponseEntity<User>(users,HttpStatus.OK);
		return responseEntity;
	}
	
	
	//登录时判断账号
	@RequestMapping("/reallyLogin")
	public ResponseEntity<User> reallyLogin(HttpEntity<User> httpEntity){
		User user=httpEntity.getBody();
		User users=userService.queryUser(user);
		ResponseEntity<User> responseEntity;
		if(users==null){
			User u=new User();
			u.setUserAccount("错误");
		   responseEntity=new ResponseEntity<User>(u,HttpStatus.OK);
		}else{
		   responseEntity=new ResponseEntity<User>(users,HttpStatus.OK);
		};
		
		return responseEntity;
	}
	
	

}
