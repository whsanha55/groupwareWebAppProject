package com.bit.groupware.controller.employee;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.groupware.domain.employee.EmpFancyTreeVO;
import com.bit.groupware.service.employee.EmployeeFancyTreeService;

@Controller
public class EmployeeFancyTreeAjaxController {

	@Autowired
	private EmployeeFancyTreeService fancyTreeService;
	// 조직도 부서 리스트 Ajax
	@RequestMapping(value = "/retrieveEmployeeDeptList.do", method = RequestMethod.GET)
	@ResponseBody
	public List<EmpFancyTreeVO> deptList() {
		List<EmpFancyTreeVO> trees = fancyTreeService.retrieveEmployeeDeptList();
		for(EmpFancyTreeVO tree : trees) {
			tree.setLazy(true);
			tree.setFolder(true);
		}
		return trees;
	}

	@RequestMapping(value = "/retrieveEmployeeEmpList.do", method = RequestMethod.GET)
	@ResponseBody
	public List<EmpFancyTreeVO> empList(@RequestParam(value = "dutyNo") String dutyNo) {
		return fancyTreeService.retrieveEmployeeEmpList(dutyNo);
	}
	
	
	@RequestMapping(value = "/retrieveEmployeeAllList.do", method = RequestMethod.GET)
	@ResponseBody
	public List<EmpFancyTreeVO> allList(@RequestParam(value="lazyloadList") String lazyloadList) {
		List<String> list = new ArrayList<String>(Arrays.asList(lazyloadList.split(",")));
		
		List<EmpFancyTreeVO> trees =  fancyTreeService.retrieveEmployeeAllList();
		for(EmpFancyTreeVO tree : trees) {
			if(list.contains(tree.getKey())) {
				tree.setExpanded(true);
			}
			tree.setFolder(true);
		}
		return trees;
	}
}
