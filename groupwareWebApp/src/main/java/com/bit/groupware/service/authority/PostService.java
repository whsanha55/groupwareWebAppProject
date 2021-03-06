package com.bit.groupware.service.authority;

import java.util.List;
import java.util.Map;

import com.bit.groupware.domain.authority.PostVO;

public interface PostService {

	// 게시글을 등록한다.
	void registerPost(PostVO post);

	// 게시글을 조회한다.
	List<PostVO> retrievePostList(Map<String, Object> map);
	
	//게시글 정보를 수정한다.
	void modifyPost(PostVO post);
	
	//검색 조건에 해당하는 게시글 정보를 조회한다.
	List<PostVO> findPost(Map<String , Object> map);
	
	//게시글을 상세조회한다.
	PostVO retrievePost(int postNo);
	
	//게시글을 삭제한다.
	void removePost(int postNo);
	
	int retrievePostCount(Map<String, Object> map);
	
	void removePostFile(int no);

}
