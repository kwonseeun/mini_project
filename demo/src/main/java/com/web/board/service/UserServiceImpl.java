package com.web.board.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.web.board.domain.Board;
import com.web.board.domain.Search;
import com.web.board.domain.User;
import com.web.board.mapper.UserMapper;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper userMapper;

	// 회원 가입
	@Override
	public void join(User user) throws Exception {
		userMapper.join(user);
	}

	// 로그인 체크
	@Override
	public boolean loginCheck(Map<String, Object> userMap) throws Exception {
		boolean result = false;
		int cnt = userMapper.loginCk(userMap);
		if (cnt > 0)
			result = true;

		return result;
	}

	// 로그인
	@Override
	public User login(User user) {
		// TODO Auto-generated method stub
		return null;
	}

	// 중복 체크
	@Override
	public boolean dupCheck(Map<String, Object> userMap) throws Exception {
		boolean result = false;
		int cnt = userMapper.loginCk(userMap);
		if (cnt > 0)
			result = true;

		return result;
	}

	// 게시글 등록
	public void insertBoard(Map<String, Object> boardMap) throws Exception {
		userMapper.insertBoard(boardMap);
	}
	
	// 게시글 목록
	@Override
	public Map<String, Object> listBoard(Map<String, Object> searchMap) throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		List<Map<String, Object>> list = userMapper.listBoard(searchMap);
		resultMap.put("list", list);
		
		List<String> pageList = new ArrayList<>();
		
		boolean isNull = false;
		if(list.size() <= 0) isNull = true;
		
		//페이지 목록
		int pageSize = 0;
		int currentPage = 0;
		int totalPage = 0;
		int totalPageBlock = 0;
		int curPageBlock = 1;
		
		//보여줄 페이지 블록 개수
		int pageBlockSize = 10;
		int startPage= 0;
		int endPage = 0;
		if(!isNull) {
			
			if (searchMap.get("pageSize") != null) {
				pageSize = Integer.parseInt(String.valueOf(searchMap.get("pageSize")));
			}		
			if (searchMap.get("currentPage") != null) {
				currentPage = Integer.parseInt(String.valueOf(searchMap.get("currentPage")));
			}	
			if (list.get(0).get("TOTALPAGE") != null) {
				totalPage = (int) Math.ceil((double)(Integer.parseInt(String.valueOf(list.get(0).get("TOTALPAGE"))))/pageSize);
			}	
			
			totalPageBlock = (int) Math.ceil((double)totalPage/pageSize); // 0, 0 
			curPageBlock = (int) Math.ceil((double)currentPage/pageBlockSize); // 0,10
			startPage = (curPageBlock-1)*pageBlockSize + 1 ; // (10-1) * 10 + 1  
			endPage = curPageBlock*pageBlockSize ; // 1 * 10 ; 
			
			if (curPageBlock == totalPageBlock) {
				endPage = totalPage;
			}
			if(curPageBlock == 1) {
				startPage = 1;
			}
	
			for(int i=startPage; i<=endPage; i++) {
				pageList.add(String.valueOf(i));
			}
		}
		resultMap.put("pageList", pageList);
		resultMap.put("totalPage", totalPage);
		
		return resultMap;

	}
	
	// 게시글 수정 폼
	  @Override 
	  public void updateBoardForm(int boardNo) throws Exception {
		  userMapper.updateBoardForm(boardNo);
	  }
		
	// 게시글 수정
	  @Override 
	  public void updateBoard(Board board) throws Exception {
		  userMapper.updateBoard(board);
	  }

	 // 게시글 조회
	@Override
	public Board getBoard(int BoardNo) throws Exception  {		
		return userMapper.getBoard(BoardNo);

	}

	@Override
	public void deleteBoard(int boardNo) throws Exception {
		userMapper.deleteBoard(boardNo);
	}

}
