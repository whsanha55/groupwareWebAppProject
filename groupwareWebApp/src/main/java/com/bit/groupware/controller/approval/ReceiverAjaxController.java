package com.bit.groupware.controller.approval;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.groupware.domain.approval.ReceiverLineVO;
import com.bit.groupware.domain.approval.ReceiverVO;
import com.bit.groupware.domain.employee.EmployeeVO;
import com.bit.groupware.service.approval.ReceiverLineService;
import com.bit.groupware.service.approval.ReceiverService;

@Controller
public class ReceiverAjaxController {

	@Autowired
	private ReceiverService receiverService;
	
	@Autowired
	private ReceiverLineService receiverLineService;
	
	@RequestMapping(value = "/receiverNoAjax.do", method = RequestMethod.GET)
	@ResponseBody
	public List<ReceiverLineVO> receiverLineAjax(@RequestParam(value = "receiverNo", required = true) int receiverNo) {

		return receiverLineService.retrieveReceiverLineList(receiverNo);
	}

	@RequestMapping(value = "/myReceiverList.do", method = RequestMethod.GET)
	@ResponseBody
	public List<ReceiverVO> myReceiverList(Principal principal) {
		
		return receiverService.retrieveReceiverList(principal.getName());
	}

	@RequestMapping(value = "/deleteReceiverAjax.do", method = RequestMethod.GET)
	@ResponseBody
	public boolean deleteReceiver(@RequestParam(value = "receiverNo", required = true) int receiverNo) {

		receiverService.removeReceiver(receiverNo);
		return true;
	}
	
	@RequestMapping(value = "/modifyReceiverAjax.do", method = RequestMethod.GET)
	@ResponseBody
	public boolean modifyReceiver(
			@RequestParam(value = "receiverNo", required = true) int receiverNo ,
			@RequestParam(value = "receiverName", required=true) String receiverName) {
		
		ReceiverVO receiver = new ReceiverVO();
		receiver.setReceiverNo(receiverNo);
		receiver.setReceiverName(receiverName);

		receiverService.modifyReceiver(receiver);
		return true;
	}

	@RequestMapping(value = "/submitReceiverAjax.do", method = RequestMethod.POST)
	@ResponseBody
	public boolean submitReceiver(
			@RequestParam(value = "receiverName", required = true) String receiverName ,
			@RequestParam(value = "apprLines", required = true) String apprLines ,
			@RequestParam(value = "refLines", required = true) String refLines,
			Principal principal) {
		
		ReceiverVO receiver = new ReceiverVO();
		
		EmployeeVO employee = new EmployeeVO();
		employee.setEmpNo(principal.getName());
		receiver.setEmployee(employee);
		
		receiver.setReceiverName(receiverName);
		
		List<ReceiverLineVO> receiverLines = new ArrayList<ReceiverLineVO>();
		
		String[] array = apprLines.split(",");
		for(int i=0;i<array.length;i++) {
			ReceiverLineVO receiverLine = new ReceiverLineVO();
			receiverLine.setApprType(0);
			receiverLine.setLineOrder(i+1);
			receiverLine.setReceiver(receiver);
			EmployeeVO emp = new EmployeeVO();
			emp.setEmpNo(array[i]);
			receiverLine.setLineEmployee(emp);
			receiverLines.add(receiverLine);
		}
		receiverLines.get(receiverLines.size()-1).setLineOrder(9);

		if(!refLines.equals("")) {	//참조가 하나도 없을때 수행하는거 막기위함
			array = refLines.split(",");
			for(int i=0;i<array.length;i++) {
				ReceiverLineVO receiverLine = new ReceiverLineVO();
				receiverLine.setApprType(1);
				EmployeeVO emp = new EmployeeVO();
				emp.setEmpNo(array[i]);
				receiverLine.setReceiver(receiver);
				receiverLine.setLineEmployee(emp);
				receiverLines.add(receiverLine);
			}
		}
		receiver.setReceiverLines(receiverLines);
		
		receiverService.registerReceiver(receiver);
		return true;
	}
}
