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

	//코드 조회
	public CodeVO selectCode(String cNo) {
		return sqlSession.selectOne(NAMESPACE + ".selectCode", cNo);
	}
	
	//코드번호 중복체크
	public boolean checkCodeNo(String cNo) {
		if(sqlSession.selectOne(NAMESPACE + ".checkCodeNo", cNo) == null) {
			return true;
		} else {
			return false;
		}
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
		return sqlSession.selectOne(NAMESPACE + ".checkRelation", relationCode);	
	}
	
	
	//최상위 코드 리스트 조회
	public List<CodeVO> selectCodeList1(Map<String, Object> map) {
		return sqlSession.selectList(NAMESPACE + ".selectCodeList1" ,map);
	}
	
	//하위 코드 리스트 조회
	public List<CodeVO> selectCodeList2(Map<String, Object> map) {
		return sqlSession.selectList(NAMESPACE + ".selectCodeList2" ,map);
	}
	
	//하위 코드 리스트 조회
	public List<CodeVO> selectCodeList3(Map<String, Object> map) {
		return sqlSession.selectList(NAMESPACE + ".selectCodeList3" ,map);
	}
	
	
	//코드 수정
	public void updateCode(CodeVO code) {
		sqlSession.update(NAMESPACE + ".updateCode", code);
	}
	
	//코드 삭제
	public void deleteCode(String cNo) {
		sqlSession.delete(NAMESPACE + ".deleteCode", cNo);
	}
	
	//부서 코드 목록 조회
	public List<CodeVO> selectDeptCodeList() {
		return sqlSession.selectList(NAMESPACE + ".selectDeptCodeList");
	}
	
	//부서 하위 코드 목록 조회
	public List<CodeVO> selectDeptCodeRelationList(String deptCode) {
		return sqlSession.selectList(NAMESPACE + ".selectDeptCodeRelationList", deptCode);
	}
	
	//직책 코드 목록 조회
	public List<CodeVO> selectDutyCodeList() {
		return sqlSession.selectList(NAMESPACE + ".selectDutyCodeList");
	}
	
	/*//페이징 처리
	public int selectCodeCount(Map<String, Object> map) {
		return sqlSession.selectOne(NAMESPACE + ".selectCodeCount", map);
	}*/
	
	
}
