package com.bit.groupware.controller.employee;

import java.util.ArrayList;
import java.util.List;

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
			 					HttpSession session) throws Exception {
		
		List<EmployeeCodeVO> codeList = new ArrayList<EmployeeCodeVO>();
		codeList.add(new EmployeeCodeVO(deptCode));
		codeList.add(new EmployeeCodeVO(dutyCode));
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
		if(employee.getRetireStatus().equals("ÀçÁ÷")) {
			employee.setRetireStatus("1");
		} else {
			employee.setRetireStatus("0");	
		}
		employeeService.modifyEmployeeAdmin(employee);
		return "redirect:/admin/listEmployee.do";
	}
	/*
	@RequestMapping(value="/admin/modifyEmployee.do", method=RequestMethod.POST)
	@ResponseBody
	public String modifyController(EmployeeVO employee,
			 @RequestParam(value="deptCode", required=false)String deptCode,
			 @RequestParam(value="dutyCode", required=false)String dutyCode,
			 					HttpSession session) throws Exception {

		List<EmployeeCodeVO> codeList = new ArrayList<EmployeeCodeVO>();
		codeList.add(new EmployeeCodeVO(deptCode));
		codeList.add(new EmployeeCodeVO(dutyCode));
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

		employeeService.modifyEmployeeAdmin(employee);
		return "data";
	}*/
}
