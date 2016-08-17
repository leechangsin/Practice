package com.maple.community.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.maple.community.model.BoardModel;
import com.maple.community.model.Subject_Professor;
import com.maple.community.model.Subject_board;
import com.maple.community.service.BoardService;
import com.maple.community.service.SubjectService;


@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private SubjectService subjectSerivce;
	
	//TODO 시간순으로 데이터를 넣어서 출력할때 나중에 입력한게 위로오게
	//where 절에 subject 해당 db 갖고옴  
		@RequestMapping("/board/{subject}")
		public String board(@PathVariable int subject,HttpSession session, Model model){
			
			session.setAttribute("subnum",subject); //과목게시판 별로 subnum 설정 해주어서 게시판 작성 할때 이용
			//id에 따른 수강과목 게시판 목록으로 출력
			String id = (String)session.getAttribute("id");
			List<Subject_board> subject_List = subjectSerivce.selectSubject(id);
			model.addAttribute("subject_List",subject_List);
			
			//게시판의 내용 과 정보들을 가져 와서
			//board에 뿌려줌
			List<BoardModel> boardModel;
			boardModel = boardService.selectBoard(subject);
			session.setAttribute("subject", subject);
			//board에 게시판 내용 뿌려주기위해 모델담기
			model.addAttribute("board_List", boardModel);
			
			//subject_professor 객체로 모델에 담아서 정보 뿌려주는거 물어보기
			Subject_Professor lectureInfo = boardService.selectlecture(subject);
			model.addAttribute("lecture_subject", lectureInfo.getSubject());
			model.addAttribute("lecture_professor", lectureInfo.getProfessor());
			model.addAttribute("lecture_time", lectureInfo.getTime());
			model.addAttribute("lecture_intro", lectureInfo.getIntro());
			model.addAttribute("lecture_image",lectureInfo.getImage());
			System.out.println(lectureInfo.getProfessor()+lectureInfo.getIntro());
			return "board";
		}
		
		@RequestMapping("/writeBoard")
		public String writeBoard(HttpSession session,String content,Model model,BoardModel boarModel){
			boarModel.setContent(content);
			boarModel.setId((String) session.getAttribute("id"));
			boarModel.setSubnum((Integer) session.getAttribute("subnum"));
			boardService.insertBoard(boarModel);
			
			List<BoardModel> boardModel;
			boardModel = boardService.selectBoard((Integer) session.getAttribute("subject"));
			model.addAttribute("board_List",boardModel);
			
			return "writeboard";
			
		}
		
		@RequestMapping("/timeTable")
		public String timeTalbe(){
			return "timetable";
			
		}
}
