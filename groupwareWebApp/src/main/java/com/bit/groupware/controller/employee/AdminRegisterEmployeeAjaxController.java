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
	
	@RequestMapping(value="/admin/checkRelation.do", method=RequestMethod.POST)
	@ResponseBody
	public List<CodeVO> checkRelation(@RequestParam String deptCode) {
		return codeService.retrieveDeptCodeRelationList(deptCode);
	}
/*
	@RequestMapping(value="/admin/registerEmployee.do", method=RequestMethod.POST)
	public String submit(EmployeeVO employee,
						 @RequestParam("deptCode")String deptCode,
						 @RequestParam("dutyCode")String dutyCode,
						 				HttpSession session) throws Exception {
		
		List<EmployeeCodeVO> codeList = new ArrayList<EmployeeCodeVO>();
		codeList.add(new EmployeeCodeVO(deptCode));
		codeList.add(new EmployeeCodeVO(dutyCode));
		employee.setCodeList(codeList);
	
		List<MultipartFile> uploadPhotos = employee.getUpload();
		for(MultipartFile file : uploadPhotos) {
			if(!file.isEmpty()) {
				ServletContext context = session.getServletContext();
				
				PhotoVO photo = UploadPhotos.uploadFile(file, context);
				logger.info("photo : {}", photo);
				employee.addPhoto(photo);
			}
		}
		employeeService.registerEmployee(employee);
		return "등록 완료";
	}*/
}











