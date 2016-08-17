package com.maple.community.controller;

import java.io.IOException;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import com.maple.community.model.MemberModel;
import com.maple.community.model.MessageModel;
import com.maple.community.model.SubjectModel;
import com.maple.community.model.Subject_board;
import com.maple.community.service.MemberServiceImpl;
import com.maple.community.service.SubjectServiceImpl;

@Controller
public class MainController {
	
	@Autowired
	private MemberServiceImpl MemberService; 
	
	@Autowired
	private SubjectServiceImpl SubjectService;

	
	@RequestMapping("/search")
	public String search(HttpSession session,Model model){
		String id = (String) session.getAttribute("id");
		List<Subject_board> subject_List = SubjectService.selectSubject(id);
		model.addAttribute("subject_List",subject_List);
		
		return "search";
	}
	
	
	@RequestMapping("/profile")
	public String profile(HttpSession session,Model model){
		String id = (String) session.getAttribute("id");
		List<Subject_board> subject_List = SubjectService.selectSubject(id);
		model.addAttribute("subject_List",subject_List);
		return "profile";
	}

	
	
	
	@RequestMapping("/modify")
	public String modify(MemberModel model, HttpSession session, Model model1, MultipartRequest multipartRequest,SubjectModel model2) throws IOException{
		 MultipartFile file = multipartRequest.getFile("upload");   //뷰에서 form으로 넘어올 때 name에 적어준 이름입니다.
		  Calendar cal = Calendar.getInstance();
		  String fileName = file.getOriginalFilename();
		  String fileType = fileName.substring(fileName.lastIndexOf("."), fileName.length());
		  String replaceName = cal.getTimeInMillis() + fileType;  //파일 이름의 중복을 막기 위해서 이름을 재설정합니다.
		  String path = "C:/Users/sh514/Desktop/INUCommunity (2)/src/main/webapp/resources/";   //제 바탕화면의 upload 폴더라는 경로입니다. 자신의 경로를 쓰세요.
		  String path2="C:/Users/sh514/Desktop/workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/INUCommunity/resources/";
		  //String imagePath = path+replaceName;
		  FileUpload.fileUpload(file, path, replaceName);
		  FileUpload.fileUpload(file, path2, replaceName);
		  model.setId((String) session.getAttribute("id"));
		  model2.setId((String) session.getAttribute("id"));
		  model.setImage("/resources/"+replaceName);
		  MemberService.updateMember(model);
		  session.setAttribute("img", "/resources/"+replaceName);
//		  System.out.println(imagePath);
//		  System.out.println(model2.getId());
//		  System.out.println(model.getId());
		  MemberService.deleteCourse(model.getId()); //전에 모든 자료 삭제
		  for(int i: model2.getSubnum()){
			  model2.setSubnum_origin(i);
			  SubjectService.insertCourse(model2);
		  }
		  return "modify";
	}
	
	@RequestMapping("/sendMessage")
	public String sendMessage(MessageModel model,HttpSession session){
		
		String receiver_id = model.getReceiver_id();
		String sender_id = 	String.valueOf(session.getAttribute("id"));
		model.setSender_id(sender_id);
		//model.setReceiver_id(receiver_id);
		MemberModel model1;
		MemberModel model2;
		model1 = MemberService.selectName(sender_id);
		model2 = MemberService.selectName(receiver_id);
		model.setReceiver_id(receiver_id);
		model.setReceiver_name(model2.getName());
		model.setSender_id(sender_id);
		model.setSender_name(model1.getName());
		model.setImage(model1.getImage());
		model.setMajor(model1.getMajor());
		SubjectService.insertMessage(model);
		return "messageResult";
	}
	
	@RequestMapping("/sendMessage2")
	public String sendMessage2(MessageModel model, HttpSession session){
		
		String receiver_id =  SubjectService.selectMessageId(model.getName());
		String sender_id = 	String.valueOf(session.getAttribute("id"));
		model.setSender_id(sender_id);
		//model.setReceiver_id(receiver_id);
		MemberModel model1;
		MemberModel model2;
		model1 = MemberService.selectName(sender_id);
		model2 = MemberService.selectName(receiver_id);
		model.setReceiver_id(receiver_id);
		model.setReceiver_name(model2.getName());
		model.setSender_id(sender_id);
		model.setSender_name(model1.getName());
		model.setImage(model1.getImage());
		model.setMajor(model1.getMajor());
		SubjectService.insertMessage(model);
		return "messageResult";
		
	}
	
	@RequestMapping("/message")
	public String message(HttpSession session, Model model){
		String id = (String) session.getAttribute("id");
		List<Subject_board> subject_List = SubjectService.selectSubject(id);
		model.addAttribute("subject_List",subject_List);
		
		List<MessageModel> message_List = SubjectService.selectMessage(id);
		model.addAttribute("message_List", message_List);
		
		return "message";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session){
		session.invalidate();
		return "index";
	}
}
