package com.poseidon.web.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.poseidon.web.dto.BoardDTO;

@Repository
public class BoardDAO {
	@Autowired
	private SqlSession sqlSession;
	
	public List<BoardDTO> list() {
		return sqlSession.selectList("board.boardList");
	
		
	}

	public void write(BoardDTO dto) {
		
		sqlSession.insert("board.write", dto);
		// 저장 sqlSession.insert("sql", 파라미터);
		//수정 sqlSession.update("sql",dto);
		//삭제 sqlSession.delete("sql", 파라미터);
		//조회 sqlSession.select("sql");
		//조회 sqlSession.select("sql", 파라미터);
		//조회 sqlSession.selectList("sql");
		//조회 sqlSession.selectList("sql", 파라미터);
		
		
	}
	public void write(Map<String, Object> map) {
		sqlSession.insert("board.write2", map);
	}
}
