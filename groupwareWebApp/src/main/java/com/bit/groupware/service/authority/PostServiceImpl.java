package com.bit.groupware.service.authority;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.groupware.domain.authority.PostFileVO;
import com.bit.groupware.domain.authority.PostVO;
import com.bit.groupware.persistent.authority.PostDAO;
import com.bit.groupware.persistent.authority.PostFileDAO;

@Service
public class PostServiceImpl implements PostService {
	@Autowired
	private PostDAO postDAO;
	@Autowired
	private PostFileDAO postFileDAO;
	

	public void registerPost(PostVO post) {
		postDAO.insertPost(post);
		List<PostFileVO> files = post.getPostFiles();
		
		if (files.size() != 0) {
			for (PostFileVO file : files) {
				file.setPostNo(post.getPostNo());
			}
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("postFiles", files);
			System.out.println("ÆÄÀÏ~~~~~~~~~~~~~~~"+files.toString());
			postFileDAO.insertPostFile(map);
		}
	}

	public List<PostVO> retrievePostList(Map<String, Object> map) {
		return postDAO.selectPostList(map);
	}

	public void modifyPost(PostVO post) {
		postDAO.updatePost(post);
		/*List<PostFileVO> files = post.getPostFiles();
		
		if (files.size() != 0) {
			for (PostFileVO file : files) {
				file.setPostNo(post.getPostNo());
			}
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("postFiles", files);
			PostFileDAO.insertPostFile(map);
		}*/
	}

	public List<PostVO> findPost(Map<String, Object> map) {
		return postDAO.searchPost(map);
	}

	public PostVO retrievePost(int postNo) {
		return postDAO.selectPost(postNo);
	}

	public void removePost(int postNo) {
		postDAO.deletePost(postNo);
	}
	
	public int retrievePostCount() {
		return postDAO.selectPostCount();
	}

}
