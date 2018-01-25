package com.bit.groupware.persistent.authority;

import java.util.List;
import java.util.Map;

import com.bit.groupware.domain.authority.PostVO;

public interface PostDAO {
	
	//게시글을 등록한다.
	//단, 게시글 번호는 일련번호를 부여한다.
	void insertPost(PostVO post);
	
	//게시글을 조회한다.
	List<PostVO> selectPostList(Map<String, Integer> map);
	
	//게시글 정보를 수정한다.
	void updatePost(PostVO Post);
	
	//게시글을 상세조회한다.
	PostVO detailPost(int postNo);
	
	//게시글을 삭제한다.
	void deletePost(int postNo);

}
