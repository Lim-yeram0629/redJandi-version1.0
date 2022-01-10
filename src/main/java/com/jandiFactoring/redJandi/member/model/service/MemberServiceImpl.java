package com.jandiFactoring.redJandi.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.jandiFactoring.redJandi.member.model.dao.MemberMapper;
import com.jandiFactoring.redJandi.member.model.dto.MemberDTO;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberMapper memberMapper;
	
	@Autowired
	private PasswordEncoder passwordEncoder;

	@Override
	public boolean isSsackEmailDup(MemberDTO member) {
		
		return memberMapper.isSsackEmailDup() > 0? true:false;
	}

}
