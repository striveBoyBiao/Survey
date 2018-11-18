package com.siyuruoli.service;

import java.util.List;

import com.siyuruoli.model.Options;
import com.siyuruoli.model.Question;
import com.siyuruoli.model.Questionnaire;
import com.siyuruoli.util.PageInfo;

public interface ConsoleService {

	void insertQuestionnaire(Questionnaire questionnaire);
	Integer queryMaxId();
	Integer queryQuestionId();
	void insertQuestion(Question question);
	void insertOption6(Options option);
	void insertOption7(Options option);
	//分页
	List<Questionnaire> queryQuestionnaire(PageInfo<Questionnaire> pageInfo);
	int queryCount(PageInfo<Questionnaire> pageInfo);
	//模糊查询
		int queryCount2(PageInfo<Questionnaire> pageInfo);
		List<Questionnaire> queryQuestionnaire2(PageInfo<Questionnaire> pageInfo);
}
