package com.siyuruoli.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.siyuruoli.mapper.MainMapper;
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
import com.siyuruoli.po.HistoryPo;
import com.siyuruoli.service.MainService;
import com.siyuruoli.util.PageInfo;

@Service
public class MainServiceImpl implements MainService {
	
	@Autowired
    private MainMapper mainMapper;
	@Override
	public List<Questionnaire> queryQuestionnaire(String type) {
		
		return mainMapper.queryQuestionnaire(type);
	}
	@Override
	public List<Questionnaire> queryQuestionnaire2(PageInfo<Questionnaire> pageInfo) {
		
		return mainMapper.queryQuestionnaire2(pageInfo);
	}
	
	@Override
	public Questionnaire queryQuestionnaire4(int questionnaireId) {
		
		return mainMapper.queryQuestionnaire4(questionnaireId);
	}
	@Override
	public List<Question> queryQuestion(int questionnaireId) {
		
		return mainMapper.queryQuestion(questionnaireId);
	}
	@Override
	public Options queryOptions(int questionId) {
		
		return mainMapper.queryOptions(questionId);
	}
	@Override
	public void insertResult(Result result) {
		
		mainMapper.insertResult(result);
	}
	@Override
	public List<Integer> queryQuestionnaireId(User user) {
		
		return mainMapper.queryQuestionnaireId(user);
	}
	@Override
	public Integer queryResult(int questionId, String content) {
		AllQuestion allQuestion=new AllQuestion();
		allQuestion.setNumber(questionId);
		allQuestion.setContext1(content);
		
		return mainMapper.queryResult(allQuestion);
	}
	@Override
	public void updateState(Questionnaire questionnaire) {
		mainMapper.updateState(questionnaire);
		
	}
	@Override
	public void updateCompleteStatus(int questionnaireId) {
		
		mainMapper.updateCompleteStatus(questionnaireId);
	}
	@Override
	public List<HistoryPo> selectHistory(int userId) {
		
		return mainMapper.selectHistory(userId);
	}
	@Override
	public void insertHistory(History history) {
		mainMapper.insertHistory(history);
		
	}
	@Override
	public User selectUser(User user) {
		
		return mainMapper.selectUser(user);
	}
	@Override
	public void updatePassword(User user) {
		
		mainMapper.updatePassword(user);
	}
	@Override
	public void destoryUser(User user) {
		
		mainMapper.destoryUser(user);
	}
	@Override
	public Birthday queryBirthday(int userId) {
		
		return mainMapper.queryBirthday(userId);
	}
	@Override
	public Address queryAddress(int userId) {
		
		return mainMapper.queryAddress(userId);
	}
	@Override
	public Profession queryProfession(int userId) {
		
		return mainMapper.queryProfession(userId);
	}
	@Override
	public User queryUser(User user) {
		
		return mainMapper.queryUser(user);
	}
	@Override
	public void updateBirthday(Birthday birthday) {
		mainMapper.updateBirthday(birthday);
		
	}
	@Override
	public void updateAddress(Address address) {
		mainMapper.updateAddress(address);
		
	}
	@Override
	public void updateProfession(Profession profession) {
		mainMapper.updateProfession(profession);
		
	}
	@Override
	public void updateUser(User user) {
		mainMapper.updateUser(user);
		
	}
	@Override
	public void insertProfession(Profession profession) {
		
		mainMapper.insertProfession(profession);
	}
	@Override
	public int queryCount(String type) {
		
		return mainMapper.queryCount(type);
	}
	@Override
	public List<Questionnaire> queryTop() {
		
		return mainMapper.queryTop();
	}
	@Override
	public List<AllQuestion> queryNew() {
		
		return mainMapper.queryNew();
	}
	
	

}
