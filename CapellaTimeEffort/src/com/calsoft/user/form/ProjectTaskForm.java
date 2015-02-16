package com.calsoft.user.form;

import java.util.Date;

import org.apache.struts.action.ActionForm;

public class ProjectTaskForm extends ActionForm {

	private String crmId;
	private String v1StoryId;
	private String taskDesc;
	private Date startDate;
	private Date endDate;
	private String plannedDays;
	private String complexity;
	private String priority;
	private String status;

	public String getCrmId() {
		return crmId;
	}

	public void setCrmId(String crmId) {
		this.crmId = crmId;
	}

	public String getV1StoryId() {
		return v1StoryId;
	}

	public void setV1StoryId(String storyId) {
		v1StoryId = storyId;
	}

	public String getTaskDesc() {
		return taskDesc;
	}

	public void setTaskDesc(String taskDesc) {
		this.taskDesc = taskDesc;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public String getPlannedDays() {
		return plannedDays;
	}

	public void setPlannedDays(String plannedDays) {
		this.plannedDays = plannedDays;
	}

	public String getComplexity() {
		return complexity;
	}

	public void setComplexity(String complexity) {
		this.complexity = complexity;
	}

	public String getPriority() {
		return priority;
	}

	public void setPriority(String priority) {
		this.priority = priority;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

}
