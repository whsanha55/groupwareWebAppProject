package com.bit.groupware.domain.approval;

import java.util.ArrayList;
import java.util.List;

public class TemplateCategoryVO {

	private int categoryNo;
	private String categoryName;
	private int categoryUsing;
	private List<TemplateVO> templates = new ArrayList<TemplateVO>();

	public TemplateCategoryVO() {
	}

	public int getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;

	}
	
	public int getCategoryUsing() {
		return categoryUsing;
	}

	public void setCategoryUsing(int categoryUsing) {
		this.categoryUsing = categoryUsing;
	}

	public List<TemplateVO> getTemplates() {
		return templates;
	}

	public void setTemplates(List<TemplateVO> templates) {
		this.templates = templates;
	}
	
	public void addTemplate(TemplateVO template) {
		this.templates.add(template);
	}

	@Override
	public String toString() {
		return "TemplateCategoryVO [categoryNo=" + categoryNo + ", categoryName=" + categoryName + ", categoryUsing="
				+ categoryUsing + ", templates=" + templates + "]";
	}



	

}
