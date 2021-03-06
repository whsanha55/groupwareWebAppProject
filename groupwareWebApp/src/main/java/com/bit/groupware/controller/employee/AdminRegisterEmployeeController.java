package com.bit.groupware.controller.employee;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.bit.groupware.domain.employee.EmployeeCodeVO;
import com.bit.groupware.domain.employee.EmployeeVO;
import com.bit.groupware.domain.employee.PhotoVO;
import com.bit.groupware.service.employee.CodeService;
import com.bit.groupware.service.employee.EmployeeService;
import com.bit.groupware.util.UploadPhotos;

@Controller
public class AdminRegisterEmployeeController {
	private static final Logger logger = LoggerFactory.getLogger(AdminRegisterEmployeeController.class);
	
	@Autowired
	private EmployeeService employeeService;
	
	@Autowired
	private CodeService codeService;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@RequestMapping(value="/admin/registerEmployee.do",method=RequestMethod.GET)
	public ModelAndView form() {
		ModelAndView mv = new ModelAndView();
		mv.addObject("deptCodes", codeService.retrieveDeptCodeList());
		mv.addObject("dutyCodes", codeService.retrieveDutyCodeList());
		mv.setViewName("employee/admin_insertEmployeeForm");
		return mv;
	}
	
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
		employee.setEmpPwd(passwordEncoder.encode(employee.getEmpPwd()));
		employeeService.registerEmployee(employee);
		return "redirect:/admin/listEmployee.do";
	}
	
}



