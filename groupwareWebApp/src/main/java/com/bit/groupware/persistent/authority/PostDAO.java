package com.bit.groupware.persistent.authority;

import java.util.List;
import java.util.Map;

import com.bit.groupware.domain.authority.PostVO;

public interface PostDAO {
	
	//�Խñ��� ����Ѵ�.
	//��, �Խñ� ��ȣ�� �Ϸù�ȣ�� �ο��Ѵ�.
	void insertPost(PostVO post);
	
	//�Խñ��� ��ȸ�Ѵ�.
	List<PostVO> selectPostList(Map<String, Integer> map);
	
	//�Խñ� ������ �����Ѵ�.
	void updatePost(PostVO post);
	
	//�Խñ��� ����ȸ�Ѵ�.
	PostVO selectPost(int postNo);
	
	//�Խñ��� �����Ѵ�.
	void deletePost(int postNo);
	
	//�Խñ��� �˻��Ѵ�.
	List<PostVO> searchPost(Map<String, Object> map);

}
