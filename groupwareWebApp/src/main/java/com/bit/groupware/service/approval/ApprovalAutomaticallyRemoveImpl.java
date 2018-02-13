package com.bit.groupware.service.approval;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.bit.groupware.persistent.approval.ApprovalAutomaticDAO;


@Service
public class ApprovalAutomaticallyRemoveImpl implements ApprovalAutomaticallyRemove{
	
	@Autowired
	private ApprovalAutomaticDAO dao;
	
/*	@Scheduled(fixedRate = 600000)*/
	/*@Bean*/
	public void automaticallyRemove() {
		//발표용 - 10분마다 실행 
		dao.automaticallyRemoveDAO();
		//10분이 지난 읽은 메시지 삭제
		System.out.println("메시지삭제에 성공했습니다");
		
	}
	
	
	@Scheduled(cron= "0 0 0 * * *")
	/*@Bean*/
	public void automaticallyRemove2() {
		//매일 12시(자정)에 실행
		dao.automaticallyRemoveDAO2();
		//30일이 지난 읽은 메시지 삭제
		
		
	}

	
}
