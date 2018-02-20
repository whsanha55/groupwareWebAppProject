package com.bit.groupware.persistent.employee;

import java.util.List;
import java.util.Map;

import com.bit.groupware.domain.employee.CodeHistoryVO;
import com.bit.groupware.domain.employee.CodeVO;

public interface CodeDAO {

	//�ڵ� ���
	void insertCode(CodeVO code);
	
	//�ڵ� ��ȸ
	CodeVO selectCode(String cNo);
	
	//�ڵ��ȣ �ߺ�üũ
	boolean checkCodeNo(String cNo);
	
	//�ڵ� �̸� �ߺ�üũ
	boolean checkCode(String cName);
	
	//���� �ڵ� �� Ȯ��
	int checkRelation(String relationCode);
	
	//�ֻ��� �ڵ� ����Ʈ ��ȸ
	List<CodeVO> selectCodeList1(Map<String, Object> map);
	
	//���� �ڵ� ����Ʈ ��ȸ
	List<CodeVO> selectCodeList2(Map<String, Object> map);
	
	//������ �ڵ� ����Ʈ ��ȸ
	List<CodeVO> selectCodeList3(Map<String, Object> map);
	
	//�ڵ� ����
	void updateCode(CodeVO code);
	
	//�ڵ� ����
	void deleteCode(String cNo);
	
	//�μ� ��� ��ȸ
	List<CodeVO> selectDeptCodeList();
	
	//��å ��� ��ȸ
	List<CodeVO> selectDutyCodeList();
	
	List<CodeVO> selectDeptCodeRelationList(String deptCode);
	
	//�ڵ� ���� �̷� ��ȸ�ϱ� (�����)
	List<CodeHistoryVO> selectCodeHistoryList(Map<String, Object> map);
	
	//�ڵ� ���� �̷� ��ȸ�ϱ� (������)
	List<CodeHistoryVO> selectCodeHistoryListByAdmin(Map<String,Object> map);
	
	//����¡ ó��
	int selectCodeCount(Map<String, Object> map);
	
	int selectCodeHistoryListByAdminCount(Map<String, Object> map);

}
