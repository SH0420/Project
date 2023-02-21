package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.springframework.web.bind.annotation.RequestParam;
import org.zerock.domain.ClubDTO;
import org.zerock.domain.MemberVO;
import org.zerock.domain.UsersVO;

public interface UsersMapper {
	
	//회원가입
	public void UserJoin(UsersVO vo);
	
	//사번체크
	public MemberVO MemberLogin(MemberVO member);
	
	//로그인
	public UsersVO Login(UsersVO vo);
	
	//중복체크
	public int idCheck(String memberId);
	
	//아이디 찾기
	public String find_id(MemberVO vo);
	
	//비밀번호찾기 - 이메일조회
	public String email_Ck(UsersVO vo);
	
	//비밀번호 재설정
	public int resetPw(UsersVO vo);
	
	//마이페이지 비밀번호
	public String mypage_Pw(String id);

	//마이페이지
	public MemberVO mypage_info(String empno);
	
	//마이페이지 이메일 수정
	public int mypage_update_email(UsersVO vo);
	
	//마이페이지 전화번호 수정
	public int mypage_update_phoneNum(UsersVO vo);
	
	//탈퇴시 클럽카운트 감소
	public int downClubCount(String id);
	
	//member 유저삭제
	public int deleteUser(String id);
	
	// mypage 내가 신청한 신규동호회 목록조회 
	public List<ClubDTO> myApplyList(String id);
	
	// mypage 활동중 동호회 목록조회
	public List<ClubDTO> myActiveList(String id);

	
	//mypage 동호회 탈퇴 downcount 
	public Long mypageDowncount(Long cno);
	
	//mypage 동호회 탈퇴 status변경
	public int clubWithdrawal (ClubDTO cdto);
	

	//탈퇴전id admin으료 변경
	public int updateId (String id);

}