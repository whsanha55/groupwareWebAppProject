package com.bit.groupware.persistent.authority;

import java.util.List;
import java.util.Map;

import com.bit.groupware.domain.authority.AuthorityVO;

public interface AuthorityDAO {

	// ���������� ���ѹ�ȣ������ ������������ ��ȸ�Ѵ�.
	List<AuthorityVO> selectAuthorityList(Map<String, Object> map);

	// ������ ����Ѵ�.
	// ���� ��ȣ�� A + �Ϸù�ȣ(6�ڸ�)�� �ο��Ѵ�.
	String insertAuthority(AuthorityVO authority);

	// ���������� �����Ѵ�.
	void updateAuthority(AuthorityVO authority);

	// ������ �ϰ� �����Ѵ�.
	void deleteAuthority(Map<String, Object> map);

	// �� �Խñ� ���� ���Ѵ�.
	int selectAuthorityCount(Map<String, Object> map);

	// ���ѹ�ȣ�� ���� ����� ��ȸ�ϴ�.
	List<AuthorityVO> selectAuthEmpList(String aNo);

	//���ѹ�ȣ�� �ش��ϴ� ������ ��ȸ�ϴ�.
	AuthorityVO selectAuthorityByaNo(String aNo);
	
	//���Ѹ��� ���翩�θ� ��ȸ�ϴ�.
	int selectAuthorityByAname(String aName);

}
