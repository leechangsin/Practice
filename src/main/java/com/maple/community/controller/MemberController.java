package com.maple.community.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.maple.community.model.FriendModel;
import com.maple.community.model.MemberModel;
import com.maple.community.model.Search_FriendModel;
import com.maple.community.model.Subject_board;
import com.maple.community.service.MemberService;
import com.maple.community.service.MemberServiceImpl;
import com.maple.community.service.SubjectService;
import com.maple.community.service.SubjectServiceImpl;

/**
 * Handles requests for the application home page.
 */
@Controller
public class MemberController {
	@Autowired
	private MemberServiceImpl memberservice;
	@Autowired
	private SubjectServiceImpl subjectservice;

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	// @RequestMapping(value = "/", method = RequestMethod.GET)
	// public String home(Locale locale, Model model) {
	// logger.info("Welcome home! The client locale is {}.", locale);
	//
	// Date date = new Date();
	// DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG,
	// DateFormat.LONG, locale);
	//
	// String formattedDate = dateFormat.format(date);
	//
	// model.addAttribute("serverTime", formattedDate );
	//
	// return "home";
	// }

	@RequestMapping("/example")
	public String example() {
		return "example";
	}

	//TODO 세션으로 메인페이지 접근하는법 알아보기
	@RequestMapping("/login")
	public ModelAndView login(MemberModel model, HttpSession session) {
		
		//loginResult id,passwd 해당되는 값이 존재하면 mav result 값에 true 넣어 전달
		ModelAndView mav = new ModelAndView("loginResult");
		model = memberservice.login(model);
		if(model != null){
			mav.addObject("result", true);
			session.setAttribute("username", model.getName());
			session.setAttribute("id",model.getId());
			if(model.getImage() != null)
				session.setAttribute("img", model.getImage());
		}
		else{
			mav.addObject("result", false);
		}
		
		return mav;
	}
	
	@RequestMapping("/main")
	public String main(HttpSession session,Model model){
		String id = (String) session.getAttribute("id");
		List<Subject_board> subject_List = subjectservice.selectSubject(id);
		model.addAttribute("subject_List",subject_List);
		return "main";
	}

	@RequestMapping("/")
	// 메인 페이지
	public String index() {
		return "index";
	}

	// 회원가입 처리
	// TODO 시간남으면 비밀번호확인 로직 구현
	@RequestMapping("/join")
	public String join(HttpServletRequest request,MemberModel model) {
		System.out.println(model.getId()+model.getName()+model.getPasswd());
		if (memberservice.join(model)) {
			return "joinSuccess";
		} else {
			return "joinFail";
		}
	}
	
	//친구찾기
	@RequestMapping("/search_Friend")
	public String search_Frined(Search_FriendModel model,Model passModel,HttpSession session){
		String id = (String) session.getAttribute("id");
		List<Subject_board> subject_List = subjectservice.selectSubject(id);
		passModel.addAttribute("subject_List", subject_List);
		List<MemberModel> mem =memberservice.selectFriend(model);
		passModel.addAttribute("search_Friend", mem);
		return "search";
	}
	
	//id 가 건쪽, friend 가 받는 쪽
	//친구목록 가기전 ing 테이블 삽입
	@RequestMapping("/addFriend")
	public String addFriend(String id,HttpSession session, FriendModel FM){
		String id_1= (String) session.getAttribute("id");
		FM.setId(id_1);
		FM.setFriend(id);
		memberservice.addFriendIng(FM);
		return "main";
	}
	
	@RequestMapping("/friend")
	public String friend(HttpSession session,Model model){
		String id = (String) session.getAttribute("id");
		//게시판뿌려주기
		List<Subject_board> subject_List = subjectservice.selectSubject(id);
		model.addAttribute("subject_List",subject_List);
		//요청친구
		List<MemberModel> modelList = memberservice.fri_list_ready(id);
		model.addAttribute("search_List", modelList);
		
		//친구목록 가져오기
		List<MemberModel> modelList_Fri = memberservice.select_fri_list(id);
		model.addAttribute("search_Fri_List",modelList_Fri);
		
		return "friend";
	}
	
	@RequestMapping("/aceeptFriend")
	public String acceptFriend(String id,HttpSession session,FriendModel model,Model model2){
		memberservice.deleteFriend(id);
		model.setFriend((String) session.getAttribute("id"));
		memberservice.addFriend(model);
		
//		//요청 친구 가져오기
		String sessionId = (String) session.getAttribute("id");
		List<MemberModel> modelList = memberservice.fri_list_ready(sessionId);
		model2.addAttribute("search_List", modelList);
		
//		//친구 목록 가져오기
		List<MemberModel> modelList_Fri = memberservice.select_fri_list(sessionId);
		model2.addAttribute("search_Fri_List",modelList_Fri);
		
		return "friend";
	}
	
	
}
