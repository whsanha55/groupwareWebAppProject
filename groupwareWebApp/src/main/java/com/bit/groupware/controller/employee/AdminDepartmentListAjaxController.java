package com.bit.groupware.controller.employee;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bit.groupware.domain.employee.DepartmentVO;
import com.bit.groupware.domain.employee.DeputyVO;
import com.bit.groupware.domain.employee.EmployeeVO;
import com.bit.groupware.service.employee.EmployeeService;

@Controller
public class AdminDepartmentListAjaxController {
	private static final Logger logger = LoggerFactory.getLogger(AdminDepartmentListAjaxController.class);
	
	@Autowired
	private EmployeeService employeeService;

	@RequestMapping(value="/admin/departmentListSearchAjax.do", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> form(
						@RequestParam(required=false) String keyfield,
						@RequestParam(required=false) String keyword
						) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyfield", keyfield);
		map.put("keyword", keyword);
				
		List<DepartmentVO> departments = employeeService.retrieveDeptList(map);
		int totalCount = departments.size();
		map.put("totalCount", totalCount);
		for(DepartmentVO department : departments) {

			String cNo = department.getcNo();
			
			Map<String, Object> map1 = employeeService.retrieveDeptInfo(cNo);
			DepartmentVO dept = (DepartmentVO)map1.get("department");
			
			int teamCount = (Integer)map1.get("teamCount");
			int memberCount = (Integer)map1.get("memberCount");
			
			if(dept != null) {
				department.setHeadDept(dept.getHeadDept());
				department.setPhoneNumber(dept.getPhoneNumber());
			} else {
				department.setHeadDept("책임자 없음");
				department.setPhoneNumber("");
			}
			department.setMemberCount(memberCount);
			if(teamCount == 0) {
				department.setTeamCount(1);
			} else {
				department.setTeamCount(teamCount);
			}
		}
		map.put("departments", departments);
		return map;
	}
	
	@RequestMapping(value="/admin/deptMemberListAjax.do", method=RequestMethod.POST)
	@ResponseBody
	public List<EmployeeVO> retrieveMemberController(@RequestParam("cNo")String cNo) {
		logger.info("return value : {}", employeeService.retrieveMemberDetail(cNo));
		return employeeService.retrieveMemberDetail(cNo);
	}
}
