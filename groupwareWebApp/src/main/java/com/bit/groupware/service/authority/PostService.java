package com.bit.groupware.service.authority;

import java.util.List;
import java.util.Map;

import com.bit.groupware.domain.authority.PostVO;

public interface PostService {

	// �Խñ��� ����Ѵ�.
	void registerPost(PostVO post);

	// �Խñ��� ��ȸ�Ѵ�.
	List<PostVO> retrievePostList(Map<String, Integer> map);
	
	//�Խñ� ������ �����Ѵ�.
	void modifyPost(PostVO Post);
	
	//�˻� ���ǿ� �ش��ϴ� �Խñ� ������ ��ȸ�Ѵ�.
	List<PostVO> findPost(Map<String , Object> map);
	
	//�Խñ��� ����ȸ�Ѵ�.
	PostVO retrievePost(int postNo);
	
	//�Խñ��� �����Ѵ�.
	void removePost(int postNo);

}
