package com.bit.groupware.service.approval;

public interface ApprovalAutomaticallyRemove {

	
	//발표용 - 5분지나면 자동삭제 / 10분마다 검토
	
	void automaticallyRemove();
	
	
	//30일 지나면 읽음 메시지 자동 삭제 / 매일 12시에 검토
	
	void automaticallyRemove2();
	
	
}
