package com.web.board.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.web.board.domain.Board;
import com.web.board.domain.Search;
import com.web.board.domain.User;


@Service
public interface UserService {

	// 회원 가입
	public void join(User user) throws Exception;
	
	// 로그인
	public User login(User user);
	
	// 로그인 체크
    public boolean loginCheck(Map<String, Object> userMap) throws Exception;
    
    // 중복 체크
    public boolean dupCheck(Map<String,Object> userMap) throws Exception;
    
    // 게시글 등록
    void insertBoard(Map<String, Object> boardMap) throws Exception;
    
    // 게시글 조회
    public Board getBoard(int boardNo) throws Exception;
    
    // 게시글 목록
	Map<String, Object> listBoard(Map<String, Object> searchMap) throws Exception;
	
    // 게시글 수정폼
    public void updateBoardForm(int boardNo) throws Exception;
	
    // 게시글 수정
    public void updateBoard(Board board) throws Exception;

    // 게시글 삭제
	void deleteBoard(int boardNo) throws Exception;

}
