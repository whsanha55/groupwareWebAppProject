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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.bit.groupware.domain.authority.NoticeFileVO;
import com.bit.groupware.domain.employee.PhotoVO;
import com.bit.groupware.domain.employee.PlanFileVO;
import com.bit.groupware.domain.employee.PlanVO;
import com.bit.groupware.service.employee.CodeService;
import com.bit.groupware.service.employee.EmployeeFancyTreeService;
import com.bit.groupware.service.employee.PlanService;
import com.bit.groupware.util.UploadFiles;
import com.bit.groupware.util.UploadPhotos;
import com.bit.groupware.util.UploadPlanFiles;

@Controller
public class AdminRegisterPlanController {
	private static final Logger logger = LoggerFactory.getLogger(AdminRegisterPlanController.class);
	@Autowired
	private PlanService planService;
	@Autowired
	private CodeService codeService;
	@Autowired
	private EmployeeFancyTreeService employeeFancyTreeService;
	
	
	//일정 추가 폼 요청
	@RequestMapping(value="/admin/registerPlan.do", method=RequestMethod.GET)
	public ModelAndView form() {
		ModelAndView mv = new ModelAndView();
		PlanVO plan = new PlanVO();
		String pContent = plan.getpContent();
		pContent = pContent.replaceAll("\r\n", "<br>");
		mv.addObject("pContent", pContent);
		mv.addObject("deptCodes", employeeFancyTreeService.retrieveEmployeeDeptList());
		mv.setViewName("employee/admin_insertPlan");
		return mv;
	}
	
	//일정 추가 요청
	@RequestMapping(value="/admin/registerPlan.do", method=RequestMethod.POST)
	public String submit(PlanVO plan, HttpSession session) throws Exception {
		logger.info("plan :  {}", plan);
		List<MultipartFile> uploadFiles = plan.getUpload();
		for(MultipartFile file : uploadFiles) {
			if(!file.isEmpty()) {
				ServletContext context = session.getServletContext();
				PlanFileVO planFile = UploadPlanFiles.uploadFile(file, context);
				plan.addPlanFile(planFile);
			}
		}
		
		planService.registerPlan(plan);
		return "redirect:/admin/listPlan.do";
	}
}