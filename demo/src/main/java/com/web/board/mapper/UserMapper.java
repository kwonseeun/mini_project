package com.web.board.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.web.board.domain.Board;
import com.web.board.domain.Search;
import com.web.board.domain.User;

@Mapper
@Repository
public interface UserMapper {

	// 회원 가입
	void join(User user) throws Exception;

	// 로그인
	User login(User userId, User userPw) throws Exception;

	// 로그인 체크, 아이디 중복체크
	int loginCk(Map<String, Object> userMap) throws Exception;

	// 게시글 작성
	void insertBoard(@Param("boardMap") Map<String, Object> boardMap) throws Exception;

	// 게시글 목록
	List<Map<String, Object>> listBoard(Map<String, Object> searchMap) throws Exception;
	
	// 게시글 수정폼
	public void updateBoardForm(int boardNo) throws Exception;

	// 게시글 수정
	public void updateBoard(Board board) throws Exception;

	// 게시글 조회
	public Board getBoard(int boardNo) throws Exception;

	// 게시글 삭제
	public void deleteBoard(int boardNo) throws Exception;
}