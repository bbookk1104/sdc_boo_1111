package kr.or.member.controller;

import java.util.ArrayList;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;


import kr.or.booking.model.vo.Booking;
import kr.or.dm.model.vo.DirectMessage;

import kr.or.mail.controller.MailSender;

import kr.or.member.model.service.MemberService;
import kr.or.member.model.service.MessageService;
import kr.or.member.model.vo.Member;

@Controller
public class MemberController {
	@Autowired
	private MemberService service;
	
	@Autowired
	private MessageService msgService;
	
	@RequestMapping(value="/memberJoinSuccess.do")
	public String memberJoinSuccess() {
		return "member/memberJoinSuccess";
	}
	
	@RequestMapping(value="/memberJoinChkFrm.do")
	public String memberJoinChkFrm() {
		return "member/memberJoinChkFrm";
	}
	
	@RequestMapping(value="/memberJoinFrm.do")
	public String memberJoinFrm() {
		return "member/memberJoinFrm";
	}
	
	@RequestMapping(value="/memberJoin.do")
	public String memberJoin(Member m) {
		System.out.println(m);
		int result = service.insertMember(m);
		if (result > 0) {
			return "member/memberJoinSuccess";
		} else {
			return "redirect:/";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="/ajaxCheckMemberId.do")
	public int ajaxCheckMemberId(String memberId) {
		int result = service.selectOneMemberId(memberId);
		return result;
	}
	
	//메인에서 로그인 버튼 누르면 나오는 첫 페이지 이동
	@RequestMapping(value="/beforeLogin.do")
	public String beforeLogin(){
		return "main/common/beforeLogin";
	}
	
	//로그인 폼 이동
	@RequestMapping(value="/loginUserFrm.do")
	public String loginUserFrm(){
		return "main/common/loginUser";
	}
	
	//유저 로그인 화면
	@RequestMapping(value="/loginUser.do")
	public String loginUser(Member member, HttpSession session) {
		Member m = service.selectOneMember(member);
		if(m!=null) {
			session.setAttribute("m", m);
			return "redirect:/";
		}else {
			return "redirect:/loginUserFrm.do";
		}
	}
	
	//유저 로그아웃
	@RequestMapping(value="logoutUser.do")
	public String logoutUser(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	//유저 마이페이지 - 나의정보 이동
	@RequestMapping(value="/memberMypage.do")
	public String memberMypage() {
		return "member/mypageMyInfo";
	}
	
	//유저 마이페이지 - 나의정보 - 정보수정
	@RequestMapping(value="/memberUpdate.do")
	public String memberUpdate(Member m, Model model, HttpSession session) {
		Member updateM = service.updateMember(m);
		if(updateM != null) {
			session.setAttribute("m", updateM);
			model.addAttribute("title","정보수정 완료");
			model.addAttribute("msg","입력하신 정보로 수정을 완료했습니다.");
			model.addAttribute("icon","success");
		}else {
			model.addAttribute("title","정보수정 실패");
			model.addAttribute("msg","정보수정 중 오류가 발생했습니다.");
			model.addAttribute("icon","error");
		}
		model.addAttribute("loc","/memberMypage.do");
		return "common/msg";
	}
	
	//유저 마이페이지 - 1:1문의내역 이동 (메시지 관련 CRUD는 DirectMessageController에서 처리)
	@RequestMapping(value="/mypageMessage.do")
	public String mypageMessage() {
		return "member/mypageMessage";
	}
	

	//유저 마이페이지 - 이용내역 이동
	@RequestMapping(value="/mypageService.do")
	public String mypageService(Member m, Model model) {
		ArrayList<Booking> list = service.selectBookingList(m);
		model.addAttribute("list",list);
		return "member/mypageService";
	}
	
	/* 아이디 비밀번호 찾기*/	
	@RequestMapping(value="/findIdUserFrm.do")
	public String searchInfo() {
		return "member/findIdUserFrm";
	}
	
	@ResponseBody
	@RequestMapping(value="/findIdUser.do",produces="application/json;charset=utf-8")
	public String findIdUser(Member member) {
		Member m = service.findIdUser(member);
		String text = "";
		if(m != null) {
			text = m.getMemberId() + "/" + m.getMemberGender();
		}else {
			text = "아이디가 존재하지 않습니다";
		}
		return new Gson().toJson(text);
	}
	
	@RequestMapping(value="/findPwUserFrm.do")
	public String findPwUserFrm() {
		return "member/findPwUserFrm";
	}
	
	@ResponseBody
	@RequestMapping(value="/findPwUser.do", produces="application/json;charset=utf-8")
	public String findPwUser(Member member, HttpSession session) {
		Member m = service.selectOneMemberEnc(member);
		String text = "";
		if(m != null) {
			if(m.getMemberGender().equals("카카오")) {
				text = "kakao";
			} else {				
				session.setAttribute("updatePw", m);
				text = "find";
			}
		} else {
			text = "일치하는 회원 정보가 없습니다.";
		}
		return new Gson().toJson(text);
	}
	
	@ResponseBody
	@RequestMapping(value="/sendMsg.do")
	public String sendMsg(String memberPhone) {
		// 6자리 랜덤숫자 생성
		Random r = new Random();
		int rdNum = 0;
		String rdCode = "";
		String resultCode = "";
		
		for(int i=0; i<6; i++) {
			rdNum = r.nextInt(9);
			rdCode = Integer.toString(rdNum);
			resultCode += rdCode;
		}
		
		msgService.sendMessage(memberPhone, resultCode);
		return resultCode;
	}
	
	@RequestMapping(value="/updatePwFrm.do")
	public String updatePwFrm() {
		return "member/updatePwFrm";
	}
	
	@RequestMapping(value="/updatePw.do")
	public String updatePw(String updatePw, HttpSession session, Model model) {
		Member m = (Member)session.getAttribute("m");
		if(m == null) { // 로그인 안 한 상태에서 비밀번호 찾기일 때
			m = (Member)session.getAttribute("updatePw");
			m.setMemberPw(updatePw);
			int result = service.updatePwEncMember(m);
			if(result > 0) {
				return "member/updatePwSuccess";			
			} else {
				return "redirect:/";
			}
		} else { // 로그인한 회원이 비밀번호 변경할 때
			m.setMemberPw(updatePw);
			int result = service.updatePwEncMember(m);
			if(result > 0) {
				model.addAttribute("title", "변경 완료");
				model.addAttribute("msg", "비밀번호가 변경되었습니다.");
				model.addAttribute("icon", "success");
				model.addAttribute("loc", "/myPage.do");
				return "common/msg";			
			} else {
				return "redirect:/updatePwFrm.do";
			}
		}
	}

	
}
