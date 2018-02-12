package com.bit.groupware.persistent.authority;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bit.groupware.domain.authority.PostVO;

@Repository
public class PostDAOImpl implements PostDAO {
	private static final String NAMESPACE = "com.bit.groupware.persistent.mapper.authority.PostMapper";
	@Autowired
	private SqlSessionTemplate sqlSession;

	public void insertPost(PostVO post) {
		sqlSession.insert(NAMESPACE + ".insertPost", post);
	}

	public List<PostVO> selectPostList(Map<String, Object> map) {
		
		return sqlSession.selectList(NAMESPACE + ".selectPostList", map);
	}

	public void updatePost(PostVO post) {
		sqlSession.update(NAMESPACE + ".updatePost", post);
	}

	public PostVO selectPost(int postNo) {
		return sqlSession.selectOne(NAMESPACE + ".selectPost", postNo);
	}

	public void deletePost(int postNo) {
		sqlSession.delete(NAMESPACE + ".deletePost", postNo);
	}

	public List<PostVO> searchPost(Map<String, Object> map) {
		return sqlSession.selectList(NAMESPACE + ".deletePost", map);
	}
	
	public int selectPostCount() {
		return sqlSession.selectOne(NAMESPACE + ".selectPostCount");
	}



}
