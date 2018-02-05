package com.bit.groupware.service.employee;

import java.util.List;
import java.util.Map;

import com.bit.groupware.domain.employee.CodeHistoryVO;
import com.bit.groupware.domain.employee.CodeVO;

public interface CodeService {

	//�ڵ� ���
	void registerCode(CodeVO code);
	
	//�ڵ� �̸� ��ȸ
	CodeVO retrieveCode(String cNo);
	
	//�ֻ��� �ڵ� ����Ʈ ��ȸ
	List<CodeVO> retrieveCodeList1(Map<String, Object> map);
	
	//���� �ڵ� ����Ʈ ��ȸ
	List<CodeVO> retrieveCodeList2(Map<String, Object> map);
	
	//������ �ڵ� ����Ʈ ��ȸ
	List<CodeVO> retrieveCodeList3(Map<String, Object> map);
		
	//�ڵ� ����
	void modifyCode(CodeVO code);
		
	//�ڵ� ����
	void removeCode(String cNo);
	
	int checkRelationCode(String relationCode);
	
	List<CodeVO> retrieveDeptCodeList();
	
	List<CodeVO> retrieveDutyCodeList();
	
	List<CodeVO> retrieveDeptCodeRelationList(String deptCode);
	
	List<CodeHistoryVO> retrieveCodeHistoryList(Map<String, Object> map);
	
	List<CodeHistoryVO> retrieveCodeHistoryListByAdmin(Map<String, Object> map);
	
	int retrieveCodeCount(Map<String, Object> map);
	
}
