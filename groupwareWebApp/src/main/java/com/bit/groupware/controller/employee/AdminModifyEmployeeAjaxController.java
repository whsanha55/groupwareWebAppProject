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
import org.springframework.web.multipart.MultipartFile;

import com.bit.groupware.domain.employee.EmployeeCodeVO;
import com.bit.groupware.domain.employee.EmployeeVO;
import com.bit.groupware.domain.employee.PhotoVO;
import com.bit.groupware.service.employee.CodeService;
import com.bit.groupware.service.employee.EmployeeService;
import com.bit.groupware.util.UploadPhotos;

@Controller
public class AdminModifyEmployeeAjaxController {
	private static final Logger logger = LoggerFactory.getLogger(AdminModifyEmployeeAjaxController.class);
	
	@Autowired
	private EmployeeService employeeService;
	
	@Autowired
	private CodeService codeService;
	
	@RequestMapping(value="/admin/modifyEmployee", method=RequestMethod.POST)
	public int modifyController(EmployeeVO employee,
			 @RequestParam(value="deptCode", required=false)String deptCode,
			 @RequestParam(value="dutyCode", required=false)String dutyCode,
			 					HttpSession session) throws Exception {

		logger.info("deptCode : {}", deptCode);
		logger.info("dutyCode : {}", dutyCode);
		if(deptCode!=null || dutyCode!=null) {
		List<EmployeeCodeVO> codeList = new ArrayList<EmployeeCodeVO>();
			if(deptCode != null) {
				codeList.add(new EmployeeCodeVO(deptCode));
			}
			if(dutyCode != null) {
				codeList.add(new EmployeeCodeVO(dutyCode));
			}
			employee.setCodeList(codeList);
		}
		
		List<MultipartFile> uploadPhotos = employee.getUpload();
		for(MultipartFile file : uploadPhotos) {
			if(!file.isEmpty()) {
				ServletContext context = session.getServletContext();
				
				PhotoVO photo = UploadPhotos.uploadFile(file, context);
				logger.info("photo : {}", photo);
				employee.addPhoto(photo);
			}
		}
		employeeService.modifyEmployee(employee);
		return 0;
	}
}
