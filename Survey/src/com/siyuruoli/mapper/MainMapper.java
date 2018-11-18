package com.siyuruoli.mapper;

import java.util.List;

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
import com.siyuruoli.util.PageInfo;

public interface MainMapper {
	List<Questionnaire> queryQuestionnaire(String type);
	List<Questionnaire> queryQuestionnaire2(PageInfo<Questionnaire> pageInfo);
	List<Questionnaire> queryQuestionnaire3(PageInfo<Questionnaire> pageInfo);
	
	Questionnaire queryQuestionnaire4(int questionnaireId);
	List<Question> queryQuestion(int questionnaireId);
	Options queryOptions(int questionId);
	
	void insertResult(Result result);
	List<Integer> queryQuestionnaireId(User user);
	
	Integer queryResult(AllQuestion allQuestion);
	
	void updateState(Questionnaire questionnaire);
	
	void updateCompleteStatus(int questionnaireId);
	
	List<HistoryPo> selectHistory(int userId);
	void insertHistory(History history);
	User selectUser(User user);
	void updatePassword(User user);
	void destoryUser(User user);
	
	//查询基本信息
	Birthday queryBirthday(int userId);
	Address  queryAddress(int userId);
	Profession queryProfession(int userId);
	User queryUser(User user);
	
	//修改基本信息
	void updateBirthday(Birthday birthday);
	void updateAddress(Address address);
	void updateProfession(Profession profession);
	void updateUser(User user);
	
	void insertProfession(Profession profession);
	
	int queryCount(String type);
	
	List<Questionnaire> queryTop();
	List<AllQuestion> queryNew();
}
