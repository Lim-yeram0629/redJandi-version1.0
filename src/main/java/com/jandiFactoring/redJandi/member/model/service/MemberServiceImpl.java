package com.jandiFactoring.redJandi.member.model.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.jandiFactoring.redJandi.member.model.dao.MemberMapper;
import com.jandiFactoring.redJandi.member.model.dto.MemberDTO;

@Service
public class MemberServiceImpl implements MemberService {

	private MemberMapper memberMapper;
	private PasswordEncoder passwordEncoder;
	
	@Autowired
	public MemberServiceImpl(MemberMapper memberMapper,PasswordEncoder passwordEncoder) {
		this.memberMapper = memberMapper;
		this.passwordEncoder = passwordEncoder;
	}

	@Override
	public boolean isSsackEmailDup(MemberDTO member) {
		
		return memberMapper.isSsackEmailDup(member) > 0? true:false;
	}

	@Override
	public int selectTrueNumber() {
		
		return memberMapper.selectTrueNumber();
	}

	@Override
	public boolean isSsackNickNameDup(MemberDTO member) {
		
		return memberMapper.isSsackNickNameDup(member) > 0? true:false;
	}

	@Override
	public String encodingPwd(String password) {
		
		return passwordEncoder.encode(password);
	}

	@Override
	public boolean registMember(MemberDTO member) {
		
		return memberMapper.registMember(member) > 0? true:false;
	}

	@Override
	public boolean checkUpdate(Map<String, String> map) {
		
		return false;
	}

}
