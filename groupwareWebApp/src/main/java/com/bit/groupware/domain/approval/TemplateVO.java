package com.bit.groupware.domain.approval;

import java.util.ArrayList;
import java.util.List;

import com.bit.groupware.domain.employee.DelegationVO;

public class TemplateVO {

	int tmpNo;
	String tmpName;
	String tmpContent;
	String tmpSummary;
	String tmpDate;
	int tmpUsing;
	TemplateCategoryVO templateCategory;
	List<DelegationVO> delegations = new ArrayList<DelegationVO>();
	List<TemplateBookmarkVO> templateBookmarks = new ArrayList<TemplateBookmarkVO>();

	public TemplateVO() {
		super();
	}

	public TemplateVO(int tmpNo) {
		this.tmpNo = tmpNo;
	}

	public int getTmpNo() {
		return tmpNo;
	}

	public void setTmpNo(int tmpNo) {
		this.tmpNo = tmpNo;
	}

	public String getTmpName() {
		return tmpName;
	}

	public void setTmpName(String tmpName) {
		this.tmpName = tmpName;
	}

	public String getTmpContent() {
		return tmpContent;
	}

	public void setTmpContent(String tmpContent) {
		this.tmpContent = tmpContent;
	}

	public String getTmpSummary() {
		return tmpSummary;
	}

	public void setTmpSummary(String tmpSummary) {
		this.tmpSummary = tmpSummary;
	}

	public String getTmpDate() {
		return tmpDate;
	}

	public void setTmpDate(String tmpDate) {
		this.tmpDate = tmpDate;
	}

	public int isTmpUsing() {
		return tmpUsing;
	}

	public void setTmpUsing(int tmpUsing) {
		this.tmpUsing = tmpUsing;
	}

	public TemplateCategoryVO getTemplateCategory() {
		return templateCategory;
	}

	public void setTemplateCategory(TemplateCategoryVO templateCategory) {
		this.templateCategory = templateCategory;
	}

	public List<DelegationVO> getDelegations() {
		return delegations;
	}

	public void setDelegations(List<DelegationVO> delegations) {
		this.delegations = delegations;
	}

	public void addDelegation(DelegationVO delegation) {
		this.delegations.add(delegation);
	}

	public List<TemplateBookmarkVO> getTemplateBookmarks() {
		return templateBookmarks;
	}

	public void setTemplateBookmarks(List<TemplateBookmarkVO> templateBookmarks) {
		this.templateBookmarks = templateBookmarks;
	}

	public void addTemplateBookmark(TemplateBookmarkVO templateBookmark) {
		this.templateBookmarks.add(templateBookmark);
	}

	@Override
	public String toString() {
		return "TemplateVO [tmpNo=" + tmpNo + ", tmpName=" + tmpName + ", tmpContent=" + tmpContent + ", tmpSummary="
				+ tmpSummary + ", tmpDate=" + tmpDate + ", tmpUsing=" + tmpUsing + ", templateCategory="
				+ templateCategory + ", delegations=" + delegations + ", templateBookmarks=" + templateBookmarks + "]";
	}

}
