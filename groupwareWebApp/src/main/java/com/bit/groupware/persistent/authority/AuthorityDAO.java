package com.bit.groupware.persistent.authority;

import java.util.List;
import java.util.Map;

public interface AuthorityDAO {
	
	//���������� ���ѹ�ȣ������ ������������ ��ȸ�Ѵ�.
	List<AuthorityVO> selectAuthorityListByAdmin(Map<String, Integer> map);
	
	//�˻� ���ǿ� �ش��ϴ� ������ �˻��Ѵ�.
	//�˻� ���ǿ� ���� ������������ �����Ͽ� �����ش�.
	List<AuthorityVO> searchAuthority(Map<String , Object> map);
	
	//������ �߰��Ѵ�.
	//���� ��ȣ�� A + �Ϸù�ȣ(6�ڸ�)�� �ο��Ѵ�.
	String insertAuthority(AuthorityVO authority);
	
	//���������� �ϰ������Ѵ�.
	void updateAuthority(List<AuthorityVO> authority);
	
	//������ �ϰ� �����Ѵ�.
	void deleteAuthority(Map<String, Object> map);	
	

}
