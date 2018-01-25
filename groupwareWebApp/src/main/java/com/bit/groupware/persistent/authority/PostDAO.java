package com.bit.groupware.persistent.authority;

public interface PostDAO {
	
	//�Խñ��� ����Ѵ�.
	//��, �Խñ� ��ȣ�� �Ϸù�ȣ�� �ο��Ѵ�.
	void insertPost(PostVO post);
	
	//�Խñ��� ��ȸ�Ѵ�.
	List<PostVO> selectPostList(Map<String, Integer> map);
	
	//�Խñ� ������ �����Ѵ�.
	void updatePost(PostVO Post);
	
	//�Խñ��� ����ȸ�Ѵ�.
	postVO detailPost(int postNo);
	
	//�Խñ��� �����Ѵ�.
	void deletePost(int postNo);

}
