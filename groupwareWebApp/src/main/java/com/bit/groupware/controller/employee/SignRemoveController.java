package com.bit.groupware.controller.employee;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.bit.groupware.domain.authority.UserVO;
import com.bit.groupware.domain.employee.EmployeeVO;
import com.bit.groupware.domain.employee.PhotoVO;
import com.bit.groupware.service.employee.EmployeeService;
import com.bit.groupware.util.UploadPhotos;
import com.bit.groupware.util.UploadSigns;

@Controller
public class SignRemoveController {

	@Autowired
	private EmployeeService employeeService;
	
	@RequestMapping(value="/removeSign.do", method=RequestMethod.POST)
	@ResponseBody
	public String removeController() {
		
		SecurityContext context1 = SecurityContextHolder.getContext();
		Authentication authentication = context1.getAuthentication();
		UserVO user = (UserVO)authentication.getPrincipal();
		
		String empNo = user.getUsername();
		
		employeeService.removeSign(empNo);
		return "삭제완료";
	}
	
	@RequestMapping(value="/modifySign.do", method=RequestMethod.POST)
	public String modifyController(EmployeeVO employee, HttpSession session) throws Exception {
		
		SecurityContext context1 = SecurityContextHolder.getContext();
		Authentication authentication = context1.getAuthentication();
		UserVO user = (UserVO)authentication.getPrincipal();
		
		employee.setEmpNo(user.getUsername());
		
		List<MultipartFile> uploadSigns = employee.getUpload();
		for(MultipartFile file : uploadSigns) {
			if(!file.isEmpty()) {
				ServletContext context = session.getServletContext();
				PhotoVO photo = UploadSigns.uploadFile(file, context);
				employee.addPhoto(photo);
			}
		}
		employeeService.modifySign(employee);
		return "redirect:/retrieveSign.do";
	}
}
