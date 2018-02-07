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
	
	//���� ����� ��ȸ�ϴ�.
	public List<AuthorityVO> selectAuthorityList(Map<String, Object> map) {
		List<AuthorityVO> authorities= sqlSession.selectList(NAMESPACE + ".selectListAuthority", map);
		return authorities;
	}

	//������ ����ϴ�.
	public String insertAuthority(AuthorityVO authority) {
		// TODO Auto-generated method stub
		return null;
	}

	//������ �����ϴ�.
	public void updateAuthority(AuthorityVO authority) {
		sqlSession.update(NAMESPACE + ".updateAuthority" , authority);
	}

	//������ �ϰ������ϴ�.
	public void deleteAuthority(Map<String, Object> map) {
		// TODO Auto-generated method stub
		
	}

	//�� �Խñ� ���� ���ϴ�.
	public int selectAuthorityCount(Map<String, Object> map) {
		return sqlSession.selectOne(NAMESPACE + ".selectAuthorityCount", map);
	}

	//���ѹ�ȣ�� �ش��ϴ� ����� ��ȸ�ϴ�.
	public List<AuthorityVO> selectAuthEmpList(String aNo) {
		return sqlSession.selectList(NAMESPACE + ".selectAuthEmpList" ,aNo);
	}

	//������ ��ȸ�ϴ�.
	public AuthorityVO selectAuthorityByaNo(String aNo) {
		return sqlSession.selectOne(NAMESPACE + ".selectAuthorityByaNo" , aNo);
	}

	//���Ѹ� üũ
	public int selectAuthorityByAname(String aName) {
		return sqlSession.selectOne(NAMESPACE + ".selectAuthorityByAname", aName);
	}

	
}
