package com.siyuruoli.po;
/**
 * 所有题目
 * @author biao
 *
 */
public class AllQuestion {

	private String questionName;
	private String context1;
	private String context2;
	private String select1;
	private String select2;
	private String select3;
	private String type;
	private int number;
	private String stopTime;
	private double probabyA;
	private double probabyB;
	private double probabyC;
	private int numberA;
	private int numberB;
	private int numberC;
	private int allNumber;
	private String historyTime;
	private String userNickName;
	private String questionnaireName;
	
	
	
	
	
	public String getHistoryTime() {
		return historyTime;
	}
	public void setHistoryTime(String historyTime) {
		this.historyTime = historyTime;
	}
	public String getUserNickName() {
		return userNickName;
	}
	public void setUserNickName(String userNickName) {
		this.userNickName = userNickName;
	}
	public String getQuestionnaireName() {
		return questionnaireName;
	}
	public void setQuestionnaireName(String questionnaireName) {
		this.questionnaireName = questionnaireName;
	}
	public String getQuestionName() {
		return questionName;
	}
	public void setQuestionName(String questionName) {
		this.questionName = questionName;
	}
	public String getContext1() {
		return context1;
	}
	public void setContext1(String context1) {
		this.context1 = context1;
	}
	public String getContext2() {
		return context2;
	}
	public void setContext2(String context2) {
		this.context2 = context2;
	}
	public String getSelect1() {
		return select1;
	}
	public void setSelect1(String select1) {
		this.select1 = select1;
	}
	public String getSelect2() {
		return select2;
	}
	public void setSelect2(String select2) {
		this.select2 = select2;
	}
	public String getSelect3() {
		return select3;
	}
	public void setSelect3(String select3) {
		this.select3 = select3;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	public String getStopTime() {
		return stopTime;
	}
	public void setStopTime(String stopTime) {
		this.stopTime = stopTime;
	}
	public double getProbabyA() {
		return probabyA;
	}
	public void setProbabyA(double probabyA) {
		this.probabyA = probabyA;
	}
	public double getProbabyB() {
		return probabyB;
	}
	public void setProbabyB(double probabyB) {
		this.probabyB = probabyB;
	}
	public double getProbabyC() {
		return probabyC;
	}
	public void setProbabyC(double probabyC) {
		this.probabyC = probabyC;
	}
	public int getNumberA() {
		return numberA;
	}
	public void setNumberA(int numberA) {
		this.numberA = numberA;
	}
	public int getNumberB() {
		return numberB;
	}
	public void setNumberB(int numberB) {
		this.numberB = numberB;
	}
	public int getNumberC() {
		return numberC;
	}
	public void setNumberC(int numberC) {
		this.numberC = numberC;
	}
	
	
	public int getAllNumber() {
		return allNumber;
	}
	public void setAllNumber(int allNumber) {
		this.allNumber = allNumber;
	}
	@Override
	public String toString() {
		return "AllQuestion [questionName=" + questionName + ", context1=" + context1 + ", context2=" + context2
				+ ", select1=" + select1 + ", select2=" + select2 + ", select3=" + select3 + ", type=" + type
				+ ", number=" + number + ", stopTime=" + stopTime + ", probabyA=" + probabyA + ", probabyB=" + probabyB
				+ ", probabyC=" + probabyC + ", numberA=" + numberA + ", numberB=" + numberB + ", numberC=" + numberC
				+ ", allNumber=" + allNumber + "]";
	}
	
	
	
	
	
}
