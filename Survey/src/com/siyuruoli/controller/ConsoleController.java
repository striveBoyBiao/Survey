package com.siyuruoli.controller;

import java.text.SimpleDateFormat;
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

import com.siyuruoli.model.Options;
import com.siyuruoli.model.Question;
import com.siyuruoli.model.Questionnaire;
import com.siyuruoli.po.AllQuestion;
import com.siyuruoli.service.ConsoleService;
import com.siyuruoli.util.PageInfo;

import net.sf.json.JSONArray;


/**
 * 控制台
 * @author biao
 *
 */
@Controller
@RequestMapping("/console")
public class ConsoleController {
	@Autowired
	private ConsoleService consoleService;

	@RequestMapping("/createSurvey")
	public String createSurvey(){
		
		return "createsurvey";
	}
	@RequestMapping("/designSurvey")
	public String designSurvey(@RequestParam(value="title",required=false)String title,Model model){
		model.addAttribute("title", title);
		return "shejitimu";
	}

	@RequestMapping("/topicPreview")
	public String topicPreview(){
		
		return "timuyulan";
	}
	
	@RequestMapping("/kongzhitai")
	public String console(){
		return "kongzhitai";
	}
	
	/**
	 * 
	 * 初始化
	 * @return
	 */
	@RequestMapping("/kongzhitai1")
	public @ResponseBody PageInfo<Questionnaire> console1(HttpServletRequest request,@RequestParam("pageNo") String pageNo ){
		PageInfo<Questionnaire> pageInfo=new PageInfo<Questionnaire>(pageNo);
		
		HttpSession session=request.getSession();
		
		session.setAttribute("mohu", null);
		session.setAttribute("state", null);
		pageInfo.setMohu(null);
		
		
		int rowCount=consoleService.queryCount(pageInfo);
		int pageCount;
		//计算总共多少页
		if(rowCount%PageInfo.pageSize==0){
			pageCount=rowCount/PageInfo.pageSize;
		}else{
			pageCount=rowCount/PageInfo.pageSize+1;
		}
		pageInfo.setPageCount(pageCount);		
		
		List<Questionnaire> list=consoleService.queryQuestionnaire(pageInfo);
		pageInfo.setPageDate(list);
		
		return pageInfo;
	}
	
	
	
	/**
	 * 
	 * 分页点击
	 * @return
	 */
	@RequestMapping("/kongzhitai2")
	public @ResponseBody PageInfo<Questionnaire> console2(HttpServletRequest request,@RequestParam("pageNo") String pageNo ){
		PageInfo<Questionnaire> pageInfo=new PageInfo<Questionnaire>(pageNo);
		
		HttpSession session=request.getSession();
		String mohu1=(String) session.getAttribute("mohu");
		String state=(String) session.getAttribute("state");
		pageInfo.setMohu(mohu1);
		pageInfo.setState(state);
		
		int rowCount=consoleService.queryCount(pageInfo);
		int pageCount;
		//计算总共多少页
		if(rowCount%PageInfo.pageSize==0){
			pageCount=rowCount/PageInfo.pageSize;
		}else{
			pageCount=rowCount/PageInfo.pageSize+1;
		}
		pageInfo.setPageCount(pageCount);		
		
		List<Questionnaire> list=consoleService.queryQuestionnaire(pageInfo);
		pageInfo.setPageDate(list);
		
		return pageInfo;
	}
	
	
	
	@RequestMapping("/kongzhitai3")
	public @ResponseBody PageInfo<Questionnaire> console3(HttpServletRequest request,@RequestParam("state") String state,@RequestParam("mohu") String mohu){
		PageInfo<Questionnaire> pageInfo=new PageInfo<Questionnaire>("1");
		if(mohu==""){
			pageInfo.setMohu(null);
		}
		pageInfo.setMohu(mohu);
		HttpSession session=request.getSession();
		session.setAttribute("mohu", mohu);
		
		if(state.equals("全部状态")){
			pageInfo.setState(null);
			session.setAttribute("state", null);
		}else if(state.equals("发布中")){
			pageInfo.setState("发布中");
			session.setAttribute("state", state);
		}else{
			pageInfo.setState("已完成");
			session.setAttribute("state", state);
		}
		
		int rowCount=consoleService.queryCount2(pageInfo);
		int pageCount;
		//计算总共多少页
		if(rowCount%PageInfo.pageSize==0){
			pageCount=rowCount/PageInfo.pageSize;
		}else{
			pageCount=rowCount/PageInfo.pageSize+1;
		}
		pageInfo.setPageCount(pageCount);		
		
		List<Questionnaire> list=consoleService.queryQuestionnaire2(pageInfo);
		pageInfo.setPageDate(list);
		
		return pageInfo;
	}
	
	
	
	
	
	
	/**
	 * 查看问卷结果
	 * @param model
	 * @param questionnaireId
	 * @return
	 */
	@RequestMapping("/topicResult")
	public String topicResult(Model model,@RequestParam("questionnaireId") String questionnaireId,@RequestParam("questionnaireType") String questionnaireType){
		int id=Integer.parseInt(questionnaireId);
		model.addAttribute("questionnaireId", id);
		if(questionnaireType.equals("快速回答")){
			return "xiangqingjieguo2";
		}
		return "timuyulanjieguo";
		
		
	}
	
	
	
	
	@SuppressWarnings({"unchecked" })
	@RequestMapping("/saveQuestion")
	public String saveQuestion(@RequestParam(value="allQuestion",required=false)String allQuestion,
			                   @RequestParam(value="surveyTitle",required=false)String surveyTitle ){
	
        /**将json字符串转化成java对象   */
		JSONArray json = JSONArray.fromObject(allQuestion);
		List<AllQuestion> questions= (List<AllQuestion>)JSONArray.toCollection(json, AllQuestion.class);
		
		//向questionnaire表中插入数据
		SimpleDateFormat time=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		/**开始时间*/
		Date begin=new Date();
		String beginData=time.format(begin);
		/**结束时间*/
		Date stop=new Date(System.currentTimeMillis()+10*24*60*60*1000);
		String stopData=time.format(stop);
		
		Questionnaire questionnaire=new Questionnaire();
		questionnaire.setQuestionnaireName(surveyTitle);
		questionnaire.setCreateTime(beginData);
		questionnaire.setStopTime(stopData);
		questionnaire.setCompleteStatus(0);
		questionnaire.setQuestionnaireStatus("发布中");
		if(questions.size()==1){
			questionnaire.setQuestionnaireType("快速回答");
		}else{
			questionnaire.setQuestionnaireType("问卷列表");
		}
		
		consoleService.insertQuestionnaire(questionnaire);
		
		
		for(int i=0;i<questions.size();i++){
			
			if(questions.get(i).getType().equals("6")){
				/**插入题干 */
				Question question=new Question();
				int questionnaireId=consoleService.queryMaxId();
				question.setQuestionnaireId(questionnaireId);
				question.setQuestionName(questions.get(i).getQuestionName());
				question.setQuestionType(questions.get(i).getType());
				consoleService.insertQuestion(question);
				/**插入选项 */
				
                  System.out.println(questions.get(i).getContext1());
				Options option=new Options();
				int questionId=consoleService.queryQuestionId();
				option.setQuestionId(questionId);
				option.setA(questions.get(i).getContext1());
				option.setB(questions.get(i).getContext2());
				consoleService.insertOption6(option);
				
			}else if(questions.get(i).getType().equals("7")){
				/**插入题干 */
				Question question=new Question();
				int questionnaireId=consoleService.queryMaxId();
				question.setQuestionnaireId(questionnaireId);
				question.setQuestionName(questions.get(i).getQuestionName());
				question.setQuestionType(questions.get(i).getType());
				consoleService.insertQuestion(question);
				/**插入选项 */
				Options option=new Options();
				int questionId=consoleService.queryQuestionId();
				option.setQuestionId(questionId);
				option.setA(questions.get(i).getSelect1());
			    option.setB(questions.get(i).getSelect2());
			    option.setC(questions.get(i).getSelect3());
			    consoleService.insertOption7(option);
			}
			
			
		}
		
		
		
		return "shejitimu";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}
