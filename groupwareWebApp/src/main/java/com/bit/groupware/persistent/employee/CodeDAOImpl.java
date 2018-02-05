package com.bit.groupware.persistent.employee;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bit.groupware.domain.employee.CodeVO;

@Repository
public class CodeDAOImpl implements CodeDAO {
	private static final String NAMESPACE = "com.bit.groupware.persistent.mapper.employee.CodeMapper";
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	//�ڵ� ���
	public void insertCode(CodeVO code) {
		sqlSession.insert(NAMESPACE + ".insertCode", code);
	}

	//�ڵ� ��ȸ
	public CodeVO selectCode(String cNo) {
		return sqlSession.selectOne(NAMESPACE + ".selectCode", cNo);
	}
	
	//�ڵ��ȣ �ߺ�üũ
	public boolean checkCodeNo(String cNo) {
		if(sqlSession.selectOne(NAMESPACE + ".checkCodeNo", cNo) == null) {
			return true;
		} else {
			return false;
		}
	}
	
	
	//�ڵ� �̸� �ߺ�üũ
	public boolean checkCode(String cName) {
		if(sqlSession.selectOne(NAMESPACE + ".checkCode", cName) == null) {
			return true;
		} else {
			return false;
		}
	}
	
	
	//���� �ڵ� �� Ȯ��
	public int checkRelation(String relationCode) {
		return sqlSession.selectOne(NAMESPACE + ".checkRelation", relationCode);	
	}
	
	
	//�ֻ��� �ڵ� ����Ʈ ��ȸ
	public List<CodeVO> selectCodeList1(Map<String, Object> map) {
		return sqlSession.selectList(NAMESPACE + ".selectCodeList1" ,map);
	}
	
	//���� �ڵ� ����Ʈ ��ȸ
	public List<CodeVO> selectCodeList2(Map<String, Object> map) {
		return sqlSession.selectList(NAMESPACE + ".selectCodeList2" ,map);
	}
	
	//���� �ڵ� ����Ʈ ��ȸ
	public List<CodeVO> selectCodeList3(Map<String, Object> map) {
		return sqlSession.selectList(NAMESPACE + ".selectCodeList3" ,map);
	}
	
	
	//�ڵ� ����
	public void updateCode(CodeVO code) {
		sqlSession.update(NAMESPACE + ".updateCode", code);
	}
	
	//�ڵ� ����
	public void deleteCode(String cNo) {
		sqlSession.delete(NAMESPACE + ".deleteCode", cNo);
	}
	
	//�μ� �ڵ� ��� ��ȸ
	public List<CodeVO> selectDeptCodeList() {
		return sqlSession.selectList(NAMESPACE + ".selectDeptCodeList");
	}
	
	//�μ� ���� �ڵ� ��� ��ȸ
	public List<CodeVO> selectDeptCodeRelationList(String deptCode) {
		return sqlSession.selectList(NAMESPACE + ".selectDeptCodeRelationList", deptCode);
	}
	
	//��å �ڵ� ��� ��ȸ
	public List<CodeVO> selectDutyCodeList() {
		return sqlSession.selectList(NAMESPACE + ".selectDutyCodeList");
	}
	
	/*//����¡ ó��
	public int selectCodeCount(Map<String, Object> map) {
		return sqlSession.selectOne(NAMESPACE + ".selectCodeCount", map);
	}*/
	
	
}
