package com.bit.groupware.controller.employee;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.bit.groupware.domain.employee.PlanFileVO;
import com.bit.groupware.domain.employee.PlanVO;
import com.bit.groupware.service.employee.CodeService;
import com.bit.groupware.service.employee.EmployeeFancyTreeService;
import com.bit.groupware.service.employee.PlanService;
import com.bit.groupware.util.UploadPlanFiles;

@Controller
public class AdminModifyPlanController {
	private static final Logger logger = LoggerFactory.getLogger(AdminModifyPlanController.class);
	
	@Autowired
	private PlanService planService;
	@Autowired
	private CodeService codeService;
	@Autowired
	private EmployeeFancyTreeService employeeFancyTreeService;
	
	//일정 수정 폼 요청
	@RequestMapping(value="/admin/modifyPlan.do", method=RequestMethod.GET)
	public ModelAndView modifyPlan(@RequestParam(value="pNo") String pNo) {
		logger.info("pNo : {} ", pNo);
		ModelAndView mv = new ModelAndView();
		mv.addObject("deptCodes", employeeFancyTreeService.retrieveEmployeeDeptList());
		PlanVO plan = planService.retrievePlan(pNo);
		plan.setStartDate(plan.getStartDate().replaceAll(" ", "T"));
		plan.setEndDate(plan.getEndDate().replaceAll(" ", "T"));
		
		mv.addObject("plan", plan);
		mv.setViewName("employee/admin_modifyPlan");
		return mv;
	}
	
	//일정 수정 요청
	@RequestMapping(value="/admin/modifyPlan.do", method=RequestMethod.POST)
	public String submit(@ModelAttribute("plan") PlanVO plan, SessionStatus status, HttpSession session) throws Exception {
		logger.info("plan : {} ", plan);
		
		List<MultipartFile> uploadFiles = plan.getUpload();
		for(MultipartFile file : uploadFiles) {
			if(!file.isEmpty()) {
				ServletContext context = session.getServletContext();
				PlanFileVO planFile = UploadPlanFiles.uploadFile(file, context);
				plan.addPlanFile(planFile);
			}
		}
		
		planService.modifyPlan(plan);
		return "redirect:/admin/detailPlan.do?pNo=" + plan.getpNo();
	}
	
	//일정 첨부파일 삭제 요청
	@RequestMapping(value="/admin/removePlanFile.do", method=RequestMethod.GET)
	@ResponseBody
	public String submit(@RequestParam(value="fileNo", required = true) String fileNo) {
		logger.info("fileNo : {} ", fileNo);
		planService.removePlanFile(fileNo);
		return null;
	}
}
