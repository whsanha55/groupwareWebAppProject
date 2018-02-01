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

import com.bit.groupware.domain.employee.CodeVO;
import com.bit.groupware.service.employee.CodeService;
import com.bit.groupware.service.employee.EmployeeService;

@Controller
public class CodeAjaxController {

	@Autowired
	private CodeService codeService;
	
	@Autowired
	private EmployeeService employeeService;
	
	//조직도 부서 리스트 Ajax
	@RequestMapping(value="/receiverDeptListAjax.do", method=RequestMethod.GET)
	@ResponseBody
	public List<Object> deptList() {
		List<CodeVO> codes = codeService.retrieveDeptAll();
		List<Object> oList= new ArrayList<Object>();
		for(int i=0;i<codes.size()-1;i++) {
			if(codes.get(i).getcNo().length() == 4) {
				List<Object> list = new ArrayList<Object>();
				Map<String,Object> map = new HashMap<String, Object>();
				for(int j=i+1;j<codes.size();j++) {
					if(codes.get(j).getcNo().length() != 4) {
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
				if(!list.isEmpty()) {
					map.put("children", list);
				}
				oList.add(map);
			}
			
		}
		
		return oList;
	}
	
	@RequestMapping(value="/receiverEmpListAjax.do", method=RequestMethod.GET)
	@ResponseBody
	public List<Object> empList(@RequestParam(value="cNo") int cNo) {
		//employeeService.retrieveEmployeeList(map)
		return null;
	}
}
