package com.siyuruoli.model;
/**
 * 问卷列表
 * @author biao
 *
 */
public class Questionnaire {

	private Integer questionnaireId;
	private String questionnaireName;
	private String createTime;
	private Integer completeStatus;
	private String questionnaireStatus;
	private String questionnaireType;
	private String stopTime;
	//当前页
	private String pageNo;
	//页的数量
	private int pageCount;
	
	public String getPageNo() {
		return pageNo;
	}
	public void setPageNo(String pageNo) {
		this.pageNo = pageNo;
	}
	public int getPageCount() {
		return pageCount;
	}
	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}
	public Integer getQuestionnaireId() {
		return questionnaireId;
	}
	public void setQuestionnaireId(Integer questionnaireId) {
		this.questionnaireId = questionnaireId;
	}
	public String getQuestionnaireName() {
		return questionnaireName;
	}
	public void setQuestionnaireName(String questionnaireName) {
		this.questionnaireName = questionnaireName;
	}
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	public Integer getCompleteStatus() {
		return completeStatus;
	}
	public void setCompleteStatus(Integer completeStatus) {
		this.completeStatus = completeStatus;
	}
	public String getQuestionnaireStatus() {
		return questionnaireStatus;
	}
	public void setQuestionnaireStatus(String questionnaireStatus) {
		this.questionnaireStatus = questionnaireStatus;
	}
	public String getQuestionnaireType() {
		return questionnaireType;
	}
	public void setQuestionnaireType(String questionnaireType) {
		this.questionnaireType = questionnaireType;
	}
	public String getStopTime() {
		return stopTime;
	}
	public void setStopTime(String stopTime) {
		this.stopTime = stopTime;
	}
	
}
