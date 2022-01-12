package com.jandiFactoring.redJandi.member.model.service;

import com.jandiFactoring.redJandi.member.model.dto.MemberDTO;

public interface MemberService {

	boolean isSsackEmailDup(MemberDTO member);

	int isJandiNickNameDup(String nickName);
	
	

}
