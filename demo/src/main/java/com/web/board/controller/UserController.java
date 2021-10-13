package com.web.board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.web.board.domain.Board;
import com.web.board.domain.Search;
import com.web.board.domain.User;
import com.web.board.service.UserService;

@Controller
public class UserController {

	public static final Logger logger = LoggerFactory.getLogger(UserController.class);

	@Autowired
	private UserService userService;

	// 회원가입 화면
	@RequestMapping("/join")
	public String join() {

		return "join";
	}

	// 회원가입
	@ResponseBody
	@RequestMapping(value = "/joinUser", method = RequestMethod.POST)
	public Map<String, Object> joinUser(@RequestBody Map<String, Object> userMap) throws Exception {
		Map<String, Object> resultMap = new HashMap<>();

		try {
			resultMap.put("resultCode", "0000");
			User user = new User();
			user.setUserId(String.valueOf(userMap.get("userId")));
			user.setUserPw(String.valueOf(userMap.get("userPw")));
			user.setUserName(String.valueOf(userMap.get("userName")));
			user.setUserPhone(String.valueOf(userMap.get("userPhone")));
			userService.join(user);
		} catch (Exception e) {
			resultMap.put("resultCode", "9999");
			throw new Exception(e);
		}
		return resultMap;
	}

	// 홈으로 이동
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home(HttpSession session) {

		return "home";
	}

	// 로그인 화면
	@RequestMapping("/login")
	public String login(Model model, HttpServletRequest request) {
		model.addAttribute("contextPath", request.getContextPath());

		return "login";
	}

	// 로그아웃 처리
	@RequestMapping("/logout")
	public ModelAndView logout(HttpSession session) {
		session.invalidate();
		ModelAndView mv = new ModelAndView("redirect:/login");
		return mv;
	}

	// 로그인 처리
	@ResponseBody
	@RequestMapping(value = "/loginCheck", method = RequestMethod.POST)
	public Map<String, Object> loginCheck(@RequestBody Map<String, Object> userMap, HttpSession session)
			throws Exception {
		Map<String, Object> resultMap = new HashMap<>();

		boolean isLogin = false;
		try {
			System.out.println("s");
			isLogin = userService.loginCheck(userMap);
			resultMap.put("isLogin", isLogin);

			if (isLogin) {
				session.setAttribute("user", userMap);
			} else {

			}
		} catch (Exception e) {
			throw new Exception(e);
		}
		return resultMap;
	}

	@ResponseBody
	@RequestMapping(value = "/dupCheck", method = RequestMethod.POST)
	public Map<String, Object> dupCheck(@RequestBody Map<String, Object> userMap) throws Exception {

		Map<String, Object> resultMap = new HashMap<>();
		boolean isDup = false;
		try {
			isDup = userService.loginCheck(userMap);
			if (isDup) {
				// 중복
				resultMap.put("resultCode", "9999");
			} else {
				resultMap.put("resultCode", "0000");
			}
		} catch (Exception e) {
			throw new Exception(e);
		}

		return resultMap;

	}

	// 게시글 작성
	@RequestMapping("/write") // 게시글 작성 화면 호출
	public String write(HttpServletRequest request, Model model) throws Exception {
		model.addAttribute("contextPath", request.getContextPath());

		return "write";
	}

	// 게시글 등록
	@PostMapping("/insertBoard") // 게시글 작성 화면 호출
	public String insertBoard(@ModelAttribute Board board) throws Exception {
		Map<String, Object> boardMap = new HashMap<String, Object>();
		boardMap.put("boardTitle", board.getBoardTitle());
		boardMap.put("boardContents", board.getBoardContents());
		boardMap.put("writer", board.getWriter());
		userService.insertBoard(boardMap);

		return "redirect:/listBoard";

	}

	// 게시글 등록
	/*
	 * @ResponseBody
	 * 
	 * @RequestMapping("/insertBoard") public Map<String, Object>
	 * insertBoard(@RequestBody Map<String, Object> boardMap) throws Exception {
	 * 
	 * System.out.println("jjjhhjhjhjhjh"+boardMap); Map<String, Object> resultMap =
	 * new HashMap<>(); try { resultMap.put("resultCode", "0000");
	 * userService.insertBoard(boardMap);
	 * 
	 * } catch (Exception e) { resultMap.put("resultCode", "9999"); }
	 * 
	 * return resultMap; // 게시글 리스트로 이동 }
	 */

	@SuppressWarnings("unchecked")
	// 게시글 목록
	@RequestMapping("/listBoard")
	public String listBoard(@ModelAttribute Search search, Model model) throws Exception {
		// 게시글 목록을 조회하기 위해 ServiceImpl 클래스의 listBoard 메서드 호출
		Map<String, Object> searchMap = new HashMap<String, Object>();

		searchMap.put("keyWord", search.getKeyWord());
		searchMap.put("keyType", search.getKeyType());
		if (search.getCurrentPage() == 0)
			search.setCurrentPage(1);
		if (search.getPageSize() == 0)
			search.setPageSize(10);
		searchMap.put("currentPage", search.getCurrentPage());
		searchMap.put("pageSize", search.getPageSize());

		Map<String, Object> resultMap = userService.listBoard(searchMap);
		List<Board> list = null;
		List<String> pageList = null;
		int totalPage = 0;
		
		if (resultMap.get("list") != null) {
			list = (List<Board>) resultMap.get("list");
		}
		if (resultMap.get("pageList") != null) {
			pageList = (List<String>) resultMap.get("pageList");
		}
		if (resultMap.get("totalPage") != null) {
			totalPage = Integer.parseInt(String.valueOf(resultMap.get("totalPage"))) ;
		}
		search.setTotalPage(totalPage);

		model.addAttribute("list", list);
		model.addAttribute("pageList", pageList);
		model.addAttribute("Search", search);

		return "listBoard";

	}

	// 게시글 상세
	@RequestMapping(value = "/getBoard", method = RequestMethod.POST)
	public String getBoard(Model model, @ModelAttribute Search search, HttpSession session) throws Exception {

		Board board = userService.getBoard(Integer.parseInt(search.getBoardNo()));
		Map<String, Object> userMap = (Map<String, Object>) session.getAttribute("user");
		model.addAttribute("board", board);
		if(userMap != null) {
			model.addAttribute("userId", userMap.get("userId"));
			return "getBoard";
		}else {
			return "login";
		}

	}

	// 게시글 수정폼
	@RequestMapping(value = "/updateBoardForm", method = RequestMethod.GET)
	public String updateBoardForm(@RequestParam("boardNo") int boardNo, Model model) throws Exception {
		Board board = userService.getBoard(boardNo);
		model.addAttribute("board", board);

		return "updateBoardForm";
	}

	// 게시글 수정
	@RequestMapping(value = "/updateBoard", method = RequestMethod.POST)
	public String updateBoard(@ModelAttribute("board") Board board) throws Exception {
		userService.updateBoard(board);

		return "redirect:listBoard";
	}

	// 게시글 삭제
	@RequestMapping(value = "deleteBoard", method = RequestMethod.GET)
	public String deleteBoard(int boardNo) throws Exception {
		userService.deleteBoard(boardNo);

		return "redirect:listBoard";
	}

}

/*
 * @ResponseBody
 * 
 * @RequestMapping("/updateBoard") public Map<String, Object>
 * updateBoard(@RequestBody Map<String, Object> boardMap) throws Exception {
 * Map<String, Object> resultMap = new HashMap<>(); try {
 * resultMap.put("resultCode", "0000"); userService.updateBoard(boardMap);
 * 
 * } catch (Exception e) { resultMap.put("resultCode", "9999"); }
 * 
 * return resultMap; } }
 */