package com.bit.groupware.controller.employee;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.bit.groupware.domain.employee.EmployeeVO;
import com.bit.groupware.domain.employee.PhotoVO;
import com.bit.groupware.service.employee.EmployeeService;
import com.bit.groupware.util.UploadSigns;

@Controller
public class SignRegisterController {
	private static final Logger logger = LoggerFactory.getLogger(SignRegisterController.class);
	
	@Autowired
	private EmployeeService employeeService;
	
	@RequestMapping(value="/retrieveSign.do", method=RequestMethod.GET)
	public ModelAndView checkSignControllger(String empNo) {
		ModelAndView mv = new ModelAndView();
		empNo = "2018-00018";
		String signName = employeeService.checkSignCount(empNo);
		logger.info("signName", signName);
		if(signName!=null) {
			mv.addObject("signName", signName);
			mv.setViewName("employee/detailSign");
		} else {
			mv.setViewName("employee/insertSign");
		}
		return mv;
	}
	
	@RequestMapping(value="/registerSign.do", method=RequestMethod.POST)
	public String regSignController(EmployeeVO employee, HttpSession session) throws Exception {
		
		employee.setEmpNo("2018-00018");
		logger.info("employee : {}", employee);
		
		
		List<MultipartFile> uploadSigns = employee.getUpload();
		logger.info("uploadSigns : {}", uploadSigns);
		for(MultipartFile file : uploadSigns) {
			logger.info("file : {}", file);
			if(!file.isEmpty()) {
				ServletContext context = session.getServletContext();
				
				PhotoVO photo = UploadSigns.uploadFile(file, context);
				logger.info("photo : {}", photo);
				employee.addPhoto(photo);
			}
		}
		employeeService.registerSign(employee);
		return "redirect:/retrieveSign.do";
		
	}

}
