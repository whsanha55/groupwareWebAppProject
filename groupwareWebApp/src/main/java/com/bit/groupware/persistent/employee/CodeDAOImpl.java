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
	
	
	//코드 등록
	public void insertCode(CodeVO code) {
		sqlSession.insert(NAMESPACE + ".insertCode", code);
	}
	
	
	//코드 이름 중복체크
	public boolean checkCode(String cName) {
		if(sqlSession.selectOne(NAMESPACE + ".checkCode", cName) == null) {
			return true;
		} else {
			return false;
		}
	}
	
	
	//하위 코드 수 확인
	public int checkRelation(String relationCode) {
		return (Integer)sqlSession.selectOne(NAMESPACE + ".checkRelation", relationCode);	
	}
	
	
	//코드 리스트 조회
	public List<CodeVO> selectCodeList(Map<String, Object> map) {
		return sqlSession.selectList(NAMESPACE + ".selectCodeList" ,map);
	}
	
	
	//코드 수정
	public void updateCode(CodeVO code) {
		sqlSession.update(NAMESPACE + ".updateCode", code);
	}
	
	
	//코드 삭제
	public void deleteCode(CodeVO code) {
		sqlSession.delete(NAMESPACE + ".deleteCode", code);
	}
}
