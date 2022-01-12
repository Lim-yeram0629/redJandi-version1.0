package com.jandiFactoring.redJandi.member.model.service;

import com.jandiFactoring.redJandi.member.model.dto.MailDTO;

public interface SendMailService {
	
	void sendMail(MailDTO mail);

	boolean isInsertCheckNum(String authNum);

}
