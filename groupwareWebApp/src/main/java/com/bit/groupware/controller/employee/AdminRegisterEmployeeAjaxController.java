package com.bit.groupware.controller.employee;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.bit.groupware.domain.employee.CodeVO;
import com.bit.groupware.domain.employee.EmployeeCodeVO;
import com.bit.groupware.domain.employee.EmployeeVO;
import com.bit.groupware.domain.employee.PhotoVO;
import com.bit.groupware.service.employee.CodeService;
import com.bit.groupware.service.employee.EmployeeService;
import com.bit.groupware.util.UploadPhotos;

@Controller
public class AdminRegisterEmployeeAjaxController {
	private static final Logger logger = LoggerFactory.getLogger(AdminRegisterEmployeeAjaxController.class);
	
	@Autowired
	private EmployeeService employeeService;
	@Autowired
	private CodeService codeService;
	
	public List<Object> deptList() {
		List<CodeVO> codes = codeService.retrieveDeptAll();
		List<Object> oList= new ArrayList<Object>();
		System.out.println("codes : " + codes);
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
				if(!list.isEmpty()) {
					map.put("children", list);
				}
				oList.add(map);
				System.out.println(map);
			}
		}
		return oList;
	}
	
	@RequestMapping(value="/admin/checkRelation.do", method=RequestMethod.POST)
	@ResponseBody
	public int checkRelation(@RequestParam String deptCode) {
		ModelAndView mv = new ModelAndView();
		int relationCount = codeService.checkRelationCode(deptCode);
		
		if(relationCount > 1) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("deptCode", deptCode);
			mv.addObject("relationdeptCodes", codeService.retrieveCodeList2(map));
			return 1;
		}
		return 0;
	}
}



