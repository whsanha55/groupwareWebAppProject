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
}
