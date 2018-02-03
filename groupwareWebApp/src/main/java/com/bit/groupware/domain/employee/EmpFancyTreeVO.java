package com.bit.groupware.domain.employee;

import java.util.List;

public class EmpFancyTreeVO {

	private String title;
	private String key;
	private boolean lazy = false;
	private List<EmpFancyTreeVO> children;
	private boolean folder = false;
	private boolean expanded = false;

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public List<EmpFancyTreeVO> getChildren() {
		return children;
	}

	public void setChildren(List<EmpFancyTreeVO> children) {
		this.children = children;
	}

	public boolean isLazy() {
		return lazy;
	}

	public void setLazy(boolean lazy) {
		this.lazy = lazy;
	}

	public boolean isFolder() {
		return folder;
	}

	public void setFolder(boolean folder) {
		this.folder = folder;
	}

	public boolean isExpanded() {
		return expanded;
	}

	public void setExpanded(boolean expanded) {
		this.expanded = expanded;
	}

}
