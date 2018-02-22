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

import com.bit.groupware.domain.employee.EmployeeCodeVO;
import com.bit.groupware.domain.employee.EmployeeVO;
import com.bit.groupware.domain.employee.PhotoVO;
import com.bit.groupware.service.employee.EmployeeService;
import com.bit.groupware.util.UploadPhotos;

@Controller
public class AdminModifyEmployeeController {
	private static final Logger logger = LoggerFactory.getLogger(AdminModifyEmployeeController.class);
	
	@Autowired
	private EmployeeService employeeService;
	
	@RequestMapping(value="/admin/modifyEmployee.do", method=RequestMethod.POST)
	public String modifyController(EmployeeVO employee,
			 @RequestParam(value="deptCode", required=false)String deptCode,
			 @RequestParam(value="dutyCode", required=false)String dutyCode,
			 @RequestParam(value="oldDept", required=false)String oldDept,
			 @RequestParam(value="oldDuty", required=false)String oldDuty,
			 					HttpSession session) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("oldDept", oldDept);
		map.put("oldDuty", oldDuty);
		List<EmployeeCodeVO> codeList = new ArrayList<EmployeeCodeVO>();
		//boolean isChange = false;
		
		codeList.add(new EmployeeCodeVO(deptCode));
		codeList.add(new EmployeeCodeVO(dutyCode));
		
	//	map.put("isChange", isChange);
		logger.info("codeList : {}", codeList);
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
		logger.info("employee : {}", employee);
		if(employee.getRetireStatus().equals("재직")) {
			employee.setRetireStatus("1");
		} else {
			employee.setRetireStatus("0");	
		}
		map.put("employee", employee);
		employeeService.modifyEmployeeAdmin(map);
		return "redirect:/admin/listEmployee.do";
	}
	
	/*
	@RequestMapping(value="/admin/modifyAjaxEmployee.do", method=RequestMethod.POST)
	@ResponseBody
	public String modifyController(EmployeeVO employee,
			 @RequestParam(value="deptCode", required=false)String deptCode,
			 @RequestParam(value="dutyCode", required=false)String dutyCode,
			 @RequestParam(value="oldDept", required=false)String oldDept,
			 @RequestParam(value="oldDuty", required=false)String oldDuty,
			 					HttpSession session) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("oldDept", oldDept);
		map.put("oldDuty", oldDuty);
		List<EmployeeCodeVO> codeList = new ArrayList<EmployeeCodeVO>();
		//boolean isChange = false;
		
		codeList.add(new EmployeeCodeVO(deptCode));
		codeList.add(new EmployeeCodeVO(dutyCode));
		
	//	map.put("isChange", isChange);
		logger.info("codeList : {}", codeList);
		employee.setCodeList(codeList);

		
		List<MultipartFile> uploadPhotos = employee.getUpload();
		if(uploadPhotos != null) {
			for(MultipartFile file : uploadPhotos) {
				if(!file.isEmpty()) {
					ServletContext context = session.getServletContext();
					
					PhotoVO photo = UploadPhotos.uploadFile(file, context);
					logger.info("photo : {}", photo);
					employee.addPhoto(photo);
				}
			}
		}
		logger.info("employee : {}", employee);
		if(employee.getRetireStatus().equals("재직")) {
			employee.setRetireStatus("1");
		} else {
			employee.setRetireStatus("0");	
		}
		map.put("employee", employee);
		employeeService.modifyEmployeeAdmin(map);
		return "yes";
	}*/
}
