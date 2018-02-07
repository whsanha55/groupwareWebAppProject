package com.bit.groupware.persistent.authority;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bit.groupware.domain.authority.AuthorityVO;

@Repository
public class AuthorityDAOImpl implements AuthorityDAO {

	private static final String NAMESPACE = "com.bit.groupware.persistent.mapper.authority.AuthorityMapper";	
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//권한 목록을 조회하다.
	public List<AuthorityVO> selectAuthorityList(Map<String, Object> map) {
		List<AuthorityVO> authorities= sqlSession.selectList(NAMESPACE + ".selectListAuthority", map);
		return authorities;
	}

	//권한을 등록하다.
	public String insertAuthority(AuthorityVO authority) {
		// TODO Auto-generated method stub
		return null;
	}

	//권한을 수정하다.
	public void updateAuthority(AuthorityVO authority) {
		sqlSession.update(NAMESPACE + ".updateAuthority" , authority);
	}

	//권한을 일괄삭제하다.
	public void deleteAuthority(Map<String, Object> map) {
		// TODO Auto-generated method stub
		
	}

	//총 게시글 수를 구하다.
	public int selectAuthorityCount(Map<String, Object> map) {
		return sqlSession.selectOne(NAMESPACE + ".selectAuthorityCount", map);
	}

	//권한번호에 해당하는 사원을 조회하다.
	public List<AuthorityVO> selectAuthEmpList(String aNo) {
		return sqlSession.selectList(NAMESPACE + ".selectAuthEmpList" ,aNo);
	}

	//권한을 조회하다.
	public AuthorityVO selectAuthorityByaNo(String aNo) {
		return sqlSession.selectOne(NAMESPACE + ".selectAuthorityByaNo" , aNo);
	}

	//권한명 체크
	public int selectAuthorityByAname(String aName) {
		return sqlSession.selectOne(NAMESPACE + ".selectAuthorityByAname", aName);
	}

	
}
