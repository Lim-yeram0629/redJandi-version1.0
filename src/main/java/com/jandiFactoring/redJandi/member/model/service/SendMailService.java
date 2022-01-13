package com.jandiFactoring.redJandi.member.model.service;

import java.util.Map;

import com.jandiFactoring.redJandi.member.model.dto.MailDTO;
import com.jandiFactoring.redJandi.member.model.dto.MemberDTO;

public interface SendMailService {
	
	void sendMail(MailDTO mail);

	boolean isInsertCheckNum(String authNum);

	boolean isExistCheckNum(MemberDTO member);

	boolean isUpdateCheckNum(Map<String, String> checkNumMap);

}
