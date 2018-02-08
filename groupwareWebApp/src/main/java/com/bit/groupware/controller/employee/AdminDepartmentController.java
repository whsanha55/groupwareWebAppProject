package com.bit.groupware.controller.employee;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.bit.groupware.domain.employee.DepartmentVO;
import com.bit.groupware.service.employee.EmployeeService;

@Controller
public class AdminDepartmentController {
	private static final Logger logger = LoggerFactory.getLogger(AdminDepartmentController.class);
	
	@Autowired
	private EmployeeService employeeService;
	
	@RequestMapping("/admin/listDepartment.do")
	public ModelAndView form() {
		ModelAndView mv = new ModelAndView();
		List<DepartmentVO> departments = employeeService.retrieveDeptList();
		for(DepartmentVO department : departments) {

			String cNo = department.getcNo();
			
			Map<String, Object> map = employeeService.retrieveDeptInfo(cNo);
			DepartmentVO dept = (DepartmentVO)map.get("department");
			
			int teamCount = (Integer)map.get("teamCount");
			int memberCount = (Integer)map.get("memberCount");
			
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
		mv.addObject("departments", departments);
		mv.setViewName("employee/admin_listDepartment");
		return mv;
	}
}
