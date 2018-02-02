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
	
	
	public List<BoardVO> selectBoardList() {
		return sqlSession.selectList(NAMESPACE + ".selectBoardList");
	}

	public int insertBoard(BoardVO board) {
		sqlSession.insert(NAMESPACE + ".insertBoard" , board);
		int boardNo = board.getBoardNo();
		return boardNo;
	}

	public int updateBoard(BoardVO board) {
		return sqlSession.update(NAMESPACE + ".updateBoard", board);
		
	}

	public void deleteBoard(int boardNo) {
		sqlSession.delete(NAMESPACE + ".deleteBoard" , boardNo);
	}

	public BoardVO selectBoard(int boardNO) {
		return sqlSession.selectOne(NAMESPACE + ".selectBoard", boardNO);
	}

	public int selectBoardByBoardNo(int boardNo) {
		return sqlSession.selectOne(NAMESPACE + ".selectBoardByBoardNo" , boardNo);
	}

	public List<BoardVO> selectBoardNameList() {
		return sqlSession.selectList(NAMESPACE + ".selectBoardNameList");
	}

	
}
