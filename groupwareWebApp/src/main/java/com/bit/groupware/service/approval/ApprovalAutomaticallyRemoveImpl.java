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
		//��ǥ�� - 10�и��� ���� 
		dao.automaticallyRemoveDAO();
		//10���� ���� ���� �޽��� ����
		System.out.println("�޽��������� �����߽��ϴ�");
		
	}
	
	
	@Scheduled(cron= "0 0 0 * * *")
	/*@Bean*/
	public void automaticallyRemove2() {
		//���� 12��(����)�� ����
		dao.automaticallyRemoveDAO2();
		//30���� ���� ���� �޽��� ����
		
		
	}

	
}
