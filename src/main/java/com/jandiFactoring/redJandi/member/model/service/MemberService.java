package com.jandiFactoring.redJandi.member.model.service;

import java.util.Map;

import com.jandiFactoring.redJandi.member.model.dto.MemberDTO;

public interface MemberService {

	boolean isSsackEmailDup(MemberDTO member);

	int isJandiNickNameDup(String nickName);
	
	int selectTrueNumber();

	boolean isSsackNickNameDup(MemberDTO member);

	String encodingPwd(String password);

	boolean registMember(MemberDTO member);

	boolean checkUpdate(Map<String, String> map);
	
	

}
