package com.bit.groupware.controller.employee;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.groupware.controller.authority.DetailNoticeController;
import com.bit.groupware.domain.employee.CodeVO;
import com.bit.groupware.domain.employee.EmployeeCodeVO;
import com.bit.groupware.domain.employee.EmployeeVO;
import com.bit.groupware.service.employee.CodeService;
import com.bit.groupware.service.employee.EmployeeCodeService;
import com.bit.groupware.service.employee.EmployeeService;

@Controller
public class CodeAjaxController {

	@Autowired
	private CodeService codeService;

	@Autowired
	private EmployeeService employeeService;

	@Autowired
	private EmployeeCodeService employeeCodeService;
	// 조직도 부서 리스트 Ajax
	@RequestMapping(value = "/receiverDeptListAjax.do", method = RequestMethod.GET)
	@ResponseBody
	public List<Object> deptList() {
		List<CodeVO> codes = codeService.retrieveDeptAll();
		List<Object> oList = new ArrayList<Object>();
		for (int i = 0; i < codes.size() - 1; i++) {
			if (codes.get(i).getcNo().length() == 4) {
				List<Object> list = new ArrayList<Object>();
				Map<String, Object> map = new HashMap<String, Object>();
				for (int j = i + 1; j < codes.size(); j++) {
					if (codes.get(j).getcNo().length() != 4) {
						Map<String, Object> map2 = new HashMap<String, Object>();
						map2.put("title", codes.get(j).getcName());
						map2.put("lazy", true);
						map2.put("key", codes.get(j).getcNo());
						list.add(map2);
					} else {
						break;
					}
				}
				map.put("title", codes.get(i).getcName());
				map.put("key", codes.get(i).getcNo());
				map.put("lazy", true);
				if (!list.isEmpty()) {
					map.put("children", list);
				}
				oList.add(map);
			}

		}

		return oList;
	}

	@RequestMapping(value = "/receiverEmpListAjax.do", method = RequestMethod.GET)
	@ResponseBody
	public List<Map<String, Object>> empList(@RequestParam(value = "cNo") String cNo) {
		List<EmployeeVO> employees = employeeService.retrieveEmployeeByDept(cNo);
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		for (EmployeeVO employee : employees) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("title", employee.getEmpName() + " " + employee.getDuty());
			map.put("key", employee.getEmpNo());
			list.add(map);
		}
		return list;
	}
	
	
	@RequestMapping(value = "/retrieveEmployeeCodeList.do", method = RequestMethod.GET)
	@ResponseBody
	public List<Object> employeeCodeList() {
	
		/*List<Object> list = new ArrayList<Object>();
		Map<String,Object> map = new HashMap<String, Object>();; 
		List<EmployeeCodeVO> ec = employeeCodeService.retrieveEmployeeCodeList();
		String deptNo1 = "";
		for(int i=0;i<ec.size();i++) {
			String deptNo= ec.get(i).getCode().getcNo();
			if(deptNo.length() == 4 && !deptNo1.equals(deptNo)) {
				List<Object> list2 = new ArrayList<Object>();
				Map<String, Object> map1 = new HashMap<String, Object>();
				for(int j=i;j<ec.size();j++) {
					EmployeeVO employee = ec.get(j).getEmployee();
					if(ec.get(j).getCode().getcNo().equals(deptNo)) { //같은 부서1 
						map1.put("title", employee.getEmpName() + " " + employee.getDuty());
						map1.put("key", employee.getEmpNo());
						list2.add(map1);
					} else if(ec.get(j).getCode().getcNo().startsWith(deptNo)) { //부서2 시작
						String deptTeamNo1 = ec.get(j).getCode().getcNo();
						List<Object> list3 = new ArrayList<Object>();
						for(int k=j;k<ec.size();k++) {
							EmployeeVO employee2 = ec.get(k).getEmployee();
							String deptTeamNo = ec.get(k).getCode().getcNo();
							if(deptTeamNo1.length() == deptTeamNo.length()) {
								if(deptTeamNo1.equals(deptTeamNo)) {	//같은 부서 같은 팀
									Map<String, Object> map3 = new HashMap<String, Object>();
									map3.put("title", employee2.getEmpName() + " " + employee2.getDuty());
									map3.put("key", employee2.getEmpNo());
									list3.add(map3);
								} else {
									if(!list3.isEmpty()) {
										map1.put("children", list3);
									}
									deptTeamNo1 = deptTeamNo;
								}
							} else {	//다른 부서
								break;
							}
							
						}
					} else {	//다른부서
						map.put("children", list2);
						break;
					}
				}
			} else {
				deptNo1 = deptNo;
			}
			
			
			
		}*/
		
		List<Object> list = new ArrayList<Object>();
		List<EmployeeCodeVO> ec = employeeCodeService.retrieveEmployeeCodeList();
		int num =0;
		while (num < ec.size()) {
			if(num == 32) {
				break;
			}
			Map<String,Object> map1 = new HashMap<String, Object>();
			map1.put("title", ec.get(num).getCode().getcName());
			List<Object> list2 = new ArrayList<Object>();
			System.out.println(num+"zzzzzzzzzzzzzzzzzzzzzzzzzzzz");
			for (int i = num+1; i < ec.size()-1; i++) {
				String deptNo = ec.get(i).getCode().getcNo();
				if (!deptNo.startsWith(ec.get(i + 1).getCode().getcNo())) {
					num = i;
					break;
				}
				
				if(deptNo.length() == 4) {
					Map<String,Object> map2 = new HashMap<String, Object>();
					EmployeeVO emp = ec.get(i).getEmployee();
					map2.put("title", emp.getEmpName() + " " + emp.getDuty());
					map2.put("key", emp.getEmpNo());
					list2.add(map2);
				}
				
			}
			System.out.println(num+"xxxxxxxxxxxxxxxxxxxxxxxxxxxx");
			map1.put("children", list2);
			list.add(map1);
		}
		
		return list;
	}
}
