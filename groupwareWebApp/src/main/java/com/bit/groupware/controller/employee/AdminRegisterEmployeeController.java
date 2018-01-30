package com.bit.groupware.controller.employee;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bit.groupware.domain.employee.EmployeeVO;
import com.bit.groupware.service.employee.EmployeeService;

@Controller
public class AdminRegisterEmployeeController {
	private static final Logger logger = LoggerFactory.getLogger(AdminRegisterEmployeeController.class);
	
	@Autowired
	private EmployeeService employeeService;
	
	@RequestMapping(value="/admin/registerEmployee.do",method=RequestMethod.GET)
	public String form() {
		return "employee/admin_insertEmployeeForm";
	}
	
	@RequestMapping(value="/admin/registerEmployee.do", method=RequestMethod.POST)
	public String submit(EmployeeVO employee, HttpSession session) throws Exception {
		logger.info("employee : {} ", employee);
		/*List<MultipartFile> uploadPhotos = employee.getUpload();
		for(MultipartFile file : uploadPhotos) {
			if(!file.isEmpty()) {
				ServletContext context = session.getServletContext();
				
				PhotoVO photo = UploadPhotos.uploadFile(file, context);
				employee.addPhoto(photo);
			}
		}*/
		employeeService.registerEmployee(employee);
		return "redirect:/admin/listEmployee.do";
	}
}
