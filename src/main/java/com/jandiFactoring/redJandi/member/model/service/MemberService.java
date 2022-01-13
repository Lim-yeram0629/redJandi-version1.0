package com.jandiFactoring.redJandi.member.model.service;

import java.util.Map;

import com.jandiFactoring.redJandi.member.model.dto.MemberDTO;

public interface MemberService {

	int isSsackEmailDup(MemberDTO member);

	int isJandiNickNameDup(String nickName);
	
	int selectTrueNumber();

	int isSsackNickNameDup(MemberDTO member);

	String encodingPwd(String password);

	boolean isRegistMember(MemberDTO member);

	boolean isUpdateCheckHis(Map<String, String> checkNumMap);

	boolean isExistEmail(MemberDTO member);

	boolean isMatchesPwd(MemberDTO member);

	MemberDTO loginMember(MemberDTO member);

	String findEmail(MemberDTO member);

	int isExistPwd(MemberDTO member);

	int selectPwdTrueNumber(MemberDTO member);

	int isUpdatePwd(MemberDTO member);

	
	

}
