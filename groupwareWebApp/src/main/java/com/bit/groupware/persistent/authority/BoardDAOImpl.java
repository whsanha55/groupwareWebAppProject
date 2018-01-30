package com.bit.groupware.persistent.authority;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bit.groupware.domain.authority.BoardVO;

@Repository
public class BoardDAOImpl implements BoardDAO {

	private static final String NAMESPACE = "com.bit.groupware.persistent.mapper.authority.BoardMapper";
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	public List<BoardVO> selectBoard() {
		return sqlSession.selectList(NAMESPACE + ".selectBoardList");
	}

	public void insertBoard(BoardVO board) {
		sqlSession.insert(NAMESPACE + ".insertBoard" , board);
	}

	public void updateBoard(BoardVO board) {
		sqlSession.update(NAMESPACE + ".updateBoard", board);
		
	}

	public void deleteBoard(int boardNo) {
		sqlSession.delete(NAMESPACE + ".deleteBoard" , boardNo);
	}

}
