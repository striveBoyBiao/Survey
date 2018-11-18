package com.siyuruoli.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.siyuruoli.mapper.ConsoleMapper;
import com.siyuruoli.model.Options;
import com.siyuruoli.model.Question;
import com.siyuruoli.model.Questionnaire;
import com.siyuruoli.service.ConsoleService;
import com.siyuruoli.util.PageInfo;
@Service
public class ConsoleServiceImpl implements ConsoleService {
    
	@Autowired
	private ConsoleMapper consoleMapper;
	
	@Override
	public void insertQuestionnaire(Questionnaire questionnaire) {
		consoleMapper.insertQuestionnaire(questionnaire);

	}

	@Override
	public Integer queryMaxId() {
		
		return consoleMapper.queryMaxId();
	}

	@Override
	public Integer queryQuestionId() {
		
		return consoleMapper.queryQuestionId();
	}

	@Override
	public void insertQuestion(Question question) {
		
		consoleMapper.insertQuestion(question);
	}

	

	@Override
	public void insertOption6(Options option) {
		consoleMapper.insertOption6(option);
		
	}

	@Override
	public void insertOption7(Options option) {
		consoleMapper.insertOption7(option);
		
	}

	@Override
	public List<Questionnaire> queryQuestionnaire(PageInfo<Questionnaire> pageInfo) {
		
		return consoleMapper.queryQuestionnaire(pageInfo);
	}

	@Override
	public int queryCount(PageInfo<Questionnaire> pageInfo) {
		
		return consoleMapper.queryCount(pageInfo);
	}

	@Override
	public int queryCount2(PageInfo<Questionnaire> pageInfo) {
		
		return consoleMapper.queryCount2(pageInfo);
	}

	@Override
	public List<Questionnaire> queryQuestionnaire2(PageInfo<Questionnaire> pageInfo) {
		
		return consoleMapper.queryQuestionnaire2(pageInfo);
	}

}
