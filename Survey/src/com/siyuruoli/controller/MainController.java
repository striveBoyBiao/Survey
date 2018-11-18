package com.siyuruoli.controller;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.siyuruoli.model.Address;
import com.siyuruoli.model.Birthday;
import com.siyuruoli.model.History;
import com.siyuruoli.model.Options;
import com.siyuruoli.model.Profession;
import com.siyuruoli.model.Question;
import com.siyuruoli.model.Questionnaire;
import com.siyuruoli.model.Result;
import com.siyuruoli.model.User;
import com.siyuruoli.po.AllQuestion;
import com.siyuruoli.po.ErrorPo;
import com.siyuruoli.po.HistoryPo;
import com.siyuruoli.po.UserPo;
import com.siyuruoli.service.ConsoleService;
import com.siyuruoli.service.MainService;
import com.siyuruoli.service.UserService;
import com.siyuruoli.util.PageInfo;

import net.sf.json.JSONArray;

/**
 * 主界面控制器
 * @author biao
 *
 */
@Controller
@RequestMapping("/main")
public class MainController {
	@Autowired
	private MainService mainService;


	@RequestMapping("/main")
	public String main(Model model){
		return "main";
	}
	
	@RequestMapping("/surveyList")
	public String surveyList(){
		return "wenjuanlibiao";
	}
	
	@RequestMapping("/quickResponse")
	public String quickResponse(){
		return "kuaishuhuida";
	}
	
	@RequestMapping("/console")
	public String console(){
		
		
		return "kongzhitai";
	}
	
	@RequestMapping("/personalData")
	public String personalData(){
		return "gerenziliao";
	}
	@RequestMapping("/accountSet")
	public String accountSet(){
		return "zhanghushezhi";
	}
	@RequestMapping("/surveyHistory")
	public String  surveyHistory(){
		return "wenjuanlishi";
	}
	
	@ResponseBody
	@RequestMapping("/initOne")
	public List<Questionnaire> initOne(){
		
		List<Questionnaire> list1=mainService.queryQuestionnaire("问卷列表");
		Date stopTime;
		Date newTime=new Date();
		SimpleDateFormat time=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		for(int i=0;i<list1.size();i++){
			try {
				stopTime=time.parse(list1.get(i).getStopTime());
				if(stopTime.compareTo(newTime)<=0&&list1.get(i).getQuestionnaireStatus().equals("发布中")){
					list1.get(i).setQuestionnaireStatus("已完成");
					Questionnaire questionnaire=new Questionnaire();
					questionnaire.setQuestionnaireId(list1.get(i).getQuestionnaireId());
					questionnaire.setQuestionnaireStatus("已完成");
					mainService.updateState(questionnaire);
				}
			} catch (ParseException e) {
				
				e.printStackTrace();
			}
			
			
		}
		return list1;
	}
	
	@ResponseBody
	@RequestMapping("/initTwo")
	public List<Questionnaire> initTwo(){
		
		List<Questionnaire> list2=mainService.queryQuestionnaire("快速回答");
		Date stopTime;
		Date newTime=new Date();
		SimpleDateFormat time=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		for(int i=0;i<list2.size();i++){
			try {
				stopTime=time.parse(list2.get(i).getStopTime());
				if(stopTime.compareTo(newTime)<=0&&list2.get(i).getQuestionnaireStatus().equals("发布中")){
					list2.get(i).setQuestionnaireStatus("已完成");
					Questionnaire questionnaire=new Questionnaire();
					questionnaire.setQuestionnaireId(list2.get(i).getQuestionnaireId());
					questionnaire.setQuestionnaireStatus("已完成");
					mainService.updateState(questionnaire);
				}
			} catch (ParseException e) {
				
				e.printStackTrace();
			}
			
			
		}
		
		return list2;
	}
	
	@ResponseBody
	@RequestMapping("/initThree")
	public PageInfo<Questionnaire> initThree(@RequestParam("pageNo") String pageNo){
		
		PageInfo<Questionnaire> pageInfo=new PageInfo<Questionnaire>(pageNo);
		int rowCount=mainService.queryCount("问卷列表");
		int pageCount;
		//计算总共多少页
		if(rowCount%PageInfo.pageSize==0){
			pageCount=rowCount/PageInfo.pageSize;
		}else{
			pageCount=rowCount/PageInfo.pageSize+1;
		}
		pageInfo.setPageCount(pageCount);
		pageInfo.setType("问卷列表");
		
		List<Questionnaire> list=mainService.queryQuestionnaire2(pageInfo);
		pageInfo.setPageDate(list);
		
		return pageInfo;
	}
	
	@ResponseBody
	@RequestMapping("/initFour")
	public PageInfo<Questionnaire> initFour(@RequestParam("pageNo") String pageNo){
		
		PageInfo<Questionnaire> pageInfo=new PageInfo<Questionnaire>(pageNo);
		int rowCount=mainService.queryCount("快速回答");
		int pageCount;
		//计算总共多少页
		if(rowCount%PageInfo.pageSize==0){
			pageCount=rowCount/PageInfo.pageSize;
		}else{
			pageCount=rowCount/PageInfo.pageSize+1;
		}
		pageInfo.setPageCount(pageCount);		
		pageInfo.setType("快速回答");
		List<Questionnaire> list=mainService.queryQuestionnaire2(pageInfo);
		pageInfo.setPageDate(list);
		
		return pageInfo;
	}
	
	@RequestMapping("/doQuestion")
	public String doQuestion(Model model,@RequestParam("questionnaireId") String questionnaireId,HttpServletRequest request){
		int id=Integer.parseInt(questionnaireId);
		model.addAttribute("questionnaireId", id);
		HttpSession session=request.getSession();
		User user=(User) session.getAttribute("user");
		if(user==null){
			return "entry";
		}
		
		List<Integer> list=mainService.queryQuestionnaireId(user);
		
		Questionnaire questionnaire=mainService.queryQuestionnaire4(id);
		if("已完成".equals(questionnaire.getQuestionnaireStatus())){
			return "huidawangcheng2";
		}
		
		for(int i=0;i<list.size();i++){
			if(list.get(i)==id){
				return "huidawangcheng";
			}
		}
		
		
		return "timuyulan";
	}
	
	/**
	 * 获取问卷题目
	 * @param questionnaireId
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/doQuestion2")
	public List<AllQuestion> doQuestion2(@RequestParam("questionnaireId") String questionnaireId){
		int id=Integer.parseInt(questionnaireId);
		List<AllQuestion> allQuestions=new ArrayList<>();
		Questionnaire questionnaire=mainService.queryQuestionnaire4(id);
		List<Question> lists=mainService.queryQuestion(id);
		for(int i=0;i<lists.size();i++){
			Options options=mainService.queryOptions(lists.get(i).getQuestionId());
			AllQuestion allQuestion=new AllQuestion();
			allQuestion.setQuestionName(lists.get(i).getQuestionName());
			allQuestion.setType(lists.get(i).getQuestionType());
			allQuestion.setNumber(questionnaire.getCompleteStatus());
			allQuestion.setStopTime(questionnaire.getStopTime());
			if(allQuestion.getType().equals("6")){
				
				allQuestion.setContext1(options.getA());
				allQuestion.setContext2(options.getB());
				
			}else if(allQuestion.getType().equals("7")){
				allQuestion.setSelect1(options.getA());
				allQuestion.setSelect2(options.getB());
				allQuestion.setSelect3(options.getC());
				
			}
			
			allQuestions.add(allQuestion);
		}
		
		
		return allQuestions;
	}
	
	/**
	 * 处理快速回答，是否已经答过
	 * @param model
	 * @param questionnaireId
	 * @param request
	 * @return
	 */
	@RequestMapping("/voteDetails")
	public String voteDetails(Model model,@RequestParam("questionnaireId") String questionnaireId,HttpServletRequest request){
		int id=Integer.parseInt(questionnaireId);
		model.addAttribute("questionnaireId", id);
		
		HttpSession session=request.getSession();
		User user=(User) session.getAttribute("user");
		if(user==null){
			return "entry";
		}
		List<Integer> list=mainService.queryQuestionnaireId(user);
		Questionnaire questionnaire=mainService.queryQuestionnaire4(id);
		if("已完成".equals(questionnaire.getQuestionnaireStatus())){
			return "xiangqingjieguo";
		}
		for(int i=0;i<list.size();i++){
			if(list.get(i)==id){
				return "xiangqingjieguo";
			}
		}
		
		
		return "xiangqing";
	}
	
	
	@RequestMapping("/voteResult")
	public String voteResult(Model model,@RequestParam("questionnaireId") String questionnaireId){
		
		int id=Integer.parseInt(questionnaireId);
		model.addAttribute("questionnaireId", id);
		return "xiangqingjieguo";
	}
	
	
	/**
	 * 获取结果显示
	 * @param questionnaireId
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/voteDetailsResult")
	public List<AllQuestion> voteDetailsResult(@RequestParam("questionnaireId") String questionnaireId){
		
	List<AllQuestion> allQuestions=new ArrayList<>();
	if(questionnaireId!=""){
		int id=Integer.parseInt(questionnaireId);
		
		Questionnaire questionnaire=mainService.queryQuestionnaire4(id);
		List<Question> lists=mainService.queryQuestion(id);
		for(int i=0;i<lists.size();i++){
			Options options=mainService.queryOptions(lists.get(i).getQuestionId());
			AllQuestion allQuestion=new AllQuestion();
			allQuestion.setQuestionName(lists.get(i).getQuestionName());
			allQuestion.setType(lists.get(i).getQuestionType());
			allQuestion.setNumber(questionnaire.getCompleteStatus());
			allQuestion.setStopTime(questionnaire.getStopTime());
			if(allQuestion.getType().equals("6")){
				
				allQuestion.setContext1(options.getA());
				allQuestion.setContext2(options.getB());
				
				int a=mainService.queryResult(lists.get(i).getQuestionId(),"A");
				int b=mainService.queryResult(lists.get(i).getQuestionId(),"B");
				
				double probabyA;
				double probabyB;
				if(a==0&&b==0){
					probabyA=0;
					probabyB=0;
				}else{
					probabyA=(a*1.0)/(a+b)*100;
					probabyB=(b*1.0)/(a+b)*100;
					
				}
				allQuestion.setProbabyA(probabyA);
				allQuestion.setProbabyB(probabyB);
				allQuestion.setNumberA(a);
				allQuestion.setNumberB(b);
				allQuestion.setAllNumber(a+b);
			}else if(allQuestion.getType().equals("7")){
				allQuestion.setSelect1(options.getA());
				allQuestion.setSelect2(options.getB());
				allQuestion.setSelect3(options.getC());
				int a=mainService.queryResult(lists.get(i).getQuestionId(),"A");
				int b=mainService.queryResult(lists.get(i).getQuestionId(),"B");
				int c=mainService.queryResult(lists.get(i).getQuestionId(),"C");
				double probabyA;
				double probabyB;
				double probabyC;
				
				if(a==0&&b==0&&c==0){
					probabyA=0;
					probabyB=0;
					probabyC=0;	
				}else{
					probabyA=(a*1.0)/(a+b+c)*100;
					probabyB=(b*1.0)/(a+b+c)*100;
					probabyC=(c*1.0)/(a+b+c)*100;	
					
				}
					
				allQuestion.setProbabyA(probabyA);
				allQuestion.setProbabyB(probabyB);
				allQuestion.setProbabyC(probabyC);
				allQuestion.setNumberA(a);
				allQuestion.setNumberB(b);
				allQuestion.setNumberC(c);
				allQuestion.setAllNumber(a+b+c);
			}
			
			allQuestions.add(allQuestion);
		}
		
	}
		return allQuestions;

	}
	
	
	
	
	
	@SuppressWarnings({"unchecked" })
	@RequestMapping("/saveResult")
	public void saveResult(@RequestParam(value="allQuestion",required=false)String allQuestion,
			                 @RequestParam(value="questionnaireId",required=false)String questionnaireId,
			                 HttpServletRequest request ){
	
        /**将json字符串转化成java对象   */
		JSONArray json = JSONArray.fromObject(allQuestion);
		List<String> questions= (List<String>)JSONArray.toCollection(json, String.class);
		
		int id=Integer.parseInt(questionnaireId);
		
		List<Question> lists=mainService.queryQuestion(id);
		HttpSession session=request.getSession();
		//获取user
		User user=(User) session.getAttribute("user");
		if(user!=null){
		   mainService.updateCompleteStatus(id);
		   //保存历史记录
		   SimpleDateFormat time=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		   String historyTime=time.format(new Date());
		   History history=new History();
		   history.setUserId(user.getUserId());
		   history.setQuestionnaireId(id);
		   history.setHistoryTime(historyTime);
		   mainService.insertHistory(history);
		  for(int i=0;i<lists.size();i++){
			Result result=new Result();
			result.setUserId(user.getUserId());
			result.setQuestionnaireId(id);
			result.setQuestionId(lists.get(i).getQuestionId());
			result.setContent(questions.get(i));
			mainService.insertResult(result);
			
		}
		
		}
		
	}
	
	@ResponseBody
	@RequestMapping("/getHistory")
	public List<HistoryPo> getHistory(HttpServletRequest request){
		HttpSession session=request.getSession();
		//获取user
		User user=(User) session.getAttribute("user");
		List<HistoryPo> list=mainService.selectHistory(user.getUserId());
		return list;
	}
	
	
	
	/**
	 * 
	 * 修改密码
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/updatePasswords")
	public ErrorPo updatePassword(HttpServletRequest request,@RequestParam("danqian")String danqian, @RequestParam("news")String news,@RequestParam("queren")String queren){
		HttpSession session=request.getSession();
		//获取user
		User user=(User) session.getAttribute("user");
		ErrorPo error=new ErrorPo();
		
		
		
		if(news.equals(queren)){
			user.setUserPassword(danqian);
			User u=mainService.selectUser(user);
			if(u==null){
				error.setErrorMessage("密码错误");
			}else{
				u.setUserPassword(news);
				mainService.updatePassword(u);
				error.setErrorMessage("修改成功");
			}
		}else{
			error.setErrorMessage("密码不相等");
		}
		
		
		return error;
	}
	
	
	
	
	/**
	 * 销毁账户
	 * @param request
	 * @param form_email
	 * @param form_password
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/destoryUser")
	public ErrorPo destoryUser(HttpServletRequest request,@RequestParam("account") String account, @RequestParam("password") String password){
		HttpSession session=request.getSession();
		//获取user
		User user=(User) session.getAttribute("user");
		ErrorPo error=new ErrorPo();
		
		if(user.getUserAccount().equals(account)){
			user.setUserPassword(password);
			User u=mainService.selectUser(user);
			if(u==null){
				error.setErrorMessage("密码错误");
			}else{
				u.setIsDestroy("是");
				mainService.destoryUser(u);
			}
			
		}else{
			error.setErrorMessage("账户错误");
		}
		return error;
	}
	
	
	@ResponseBody
	@RequestMapping("/queryUserMessage")
	public UserPo queryUserMessage(HttpServletRequest request){
		HttpSession session=request.getSession();
		//获取user
		User user=(User) session.getAttribute("user");
		//获取最新user
		User u=mainService.queryUser(user);
		UserPo userPo=new UserPo();
		Birthday birthday=mainService.queryBirthday(u.getUserId());
		//Address address=mainService.queryAddress(u.getUserId());
		Profession profession=mainService.queryProfession(u.getUserId());
		if(profession!=null){
			userPo.setOccupation(profession.getOccupation());
			userPo.setIndustry(profession.getIndustry());
			userPo.setDepartment(profession.getDepartment());
		}
		
		userPo.setUserId(u.getUserId());
		userPo.setUserAccount(u.getUserAccount());
		userPo.setUserNickName(u.getUserNickName());
		userPo.setSex(u.getSex());
		userPo.setYear(birthday.getYear());
		userPo.setMonth(birthday.getMonth());
		userPo.setDay(birthday.getDay());
	/*	userPo.setProvince(address.getProvince());
		userPo.setCity(address.getCity());*/
		userPo.setUserPhone(u.getUserPhone());
		userPo.setUserSalary(u.getUserSalary());
		userPo.setEducation(u.getEducation());
		userPo.setSignature(u.getSignature());
		userPo.setLikeMusic(u.getLikeMusic());
		userPo.setWish(u.getWish());
		return userPo;
	}
	
	@SuppressWarnings("unchecked")
	@ResponseBody
	@RequestMapping("/saveUserMessage")
	public List<UserPo> saveUserMessage(HttpServletRequest request,@RequestParam(value="allUser",required=false)String allUser){
		  /**将json字符串转化成java对象   */
				JSONArray json = JSONArray.fromObject(allUser);
				List<UserPo> questions= (List<UserPo>)JSONArray.toCollection(json, UserPo.class);
				
			
				
				//获取user
				HttpSession session=request.getSession();
				User user=(User) session.getAttribute("user");
				
				Birthday birthday=new Birthday();
				//Address address=new Address();
				Profession profession=new Profession();
				User u=new User();
				
				birthday.setUserId(user.getUserId());
				birthday.setYear(questions.get(0).getYear());
				birthday.setMonth(questions.get(0).getMonth());
				birthday.setDay(questions.get(0).getDay());
				
				/*address.setUserId(user.getUserId());
				address.setProvince(questions.get(0).getProvince());
				address.setCity(questions.get(0).getCity());*/
				
				profession.setUserId(user.getUserId());
				profession.setOccupation(questions.get(0).getOccupation());
				profession.setDepartment(questions.get(0).getDepartment());
				profession.setIndustry(questions.get(0).getIndustry());
				
				u.setUserId(user.getUserId());
				u.setUserNickName(questions.get(0).getUserNickName());
				u.setUserPhone(questions.get(0).getUserPhone());
				u.setSex(questions.get(0).getSex());
				u.setUserSalary(questions.get(0).getUserSalary());
				u.setEducation(questions.get(0).getEducation());
				u.setSignature(questions.get(0).getSignature());
				u.setLikeMusic(questions.get(0).getLikeMusic());
				u.setWish(questions.get(0).getWish());
				
				Profession p=mainService.queryProfession(u.getUserId());
				if(p==null){
					mainService.insertProfession(profession);
				}else{
					mainService.updateProfession(profession);
				}
				mainService.updateBirthday(birthday);
				/*mainService.updateAddress(address);*/
				mainService.updateUser(u);
				
				return questions;
	}
	
	
	
	@ResponseBody
	@RequestMapping("/queryTop")
	public List<Questionnaire> queryTop(){
		List<Questionnaire> list=mainService.queryTop();
		return list;
		
	}
	
	@ResponseBody
	@RequestMapping("/queryNew")
	public List<AllQuestion> queryNew(){
		List<AllQuestion> list=mainService.queryNew();
		return list;
		
	}
	
	
	
	
	
	
	
	
	
	
}
