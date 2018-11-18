package com.siyuruoli.model;

public class History {
	
	private int userId;
	private int questionnaireId;
	private String historyTime;
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getQuestionnaireId() {
		return questionnaireId;
	}
	public void setQuestionnaireId(int questionnaireId) {
		this.questionnaireId = questionnaireId;
	}
	public String getHistoryTime() {
		return historyTime;
	}
	public void setHistoryTime(String historyTime) {
		this.historyTime = historyTime;
	}
	

}
