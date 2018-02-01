package com.bit.groupware.controller.approval;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.groupware.domain.approval.ReceiverLineVO;
import com.bit.groupware.service.approval.ReceiverLineService;

@Controller
public class ReceiverAjaxController {

	@Autowired
	private ReceiverLineService receiverLineService;

	@RequestMapping("/receiverNoAjax.do")
	@ResponseBody
	public List<ReceiverLineVO> receiverLineAjax(@RequestParam(value = "receiverNo", required = true) int receiverNo) {

		return receiverLineService.retrieveReceiverLineList(receiverNo);
	}
}
