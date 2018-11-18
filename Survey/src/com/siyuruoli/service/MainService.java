package com.siyuruoli.service;

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

public interface MainService {
	List<Questionnaire> queryQuestionnaire(String type);
	List<Questionnaire> queryQuestionnaire2(PageInfo<Questionnaire> pageInfo);

	
	Questionnaire queryQuestionnaire4(int questionnaireId);
	List<Question> queryQuestion(int questionnaireId);
	Options queryOptions(int questionId);
	void insertResult(Result result);
	List<Integer> queryQuestionnaireId(User user);
	
	Integer queryResult(int questionId,String content);
	
	void updateState(Questionnaire questionnaire);
	void updateCompleteStatus(int questionnaireId);
	//查询历史
	List<HistoryPo> selectHistory(int userId);
	void insertHistory(History history);
	//修改密码
	User selectUser(User user);
	void updatePassword(User user);
	//销毁用户
	void destoryUser(User user);
	
	//查询基本资料
	Birthday queryBirthday(int userId);
	Address  queryAddress(int userId);
	Profession queryProfession(int userId);
	User queryUser(User user);
	
	//修改基本资料
	void updateBirthday(Birthday birthday);
	void updateAddress(Address address);
	void updateProfession(Profession profession);
	void updateUser(User user);
	
	void insertProfession(Profession profession);
	
	//查询数量
	int queryCount(String type);
	
	List<Questionnaire> queryTop();
	List<AllQuestion> queryNew();
	
}
