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
	public int isSsackEmailDup(MemberDTO member) {
		
		return memberMapper.isSsackEmailDup(member);
	}

	@Override
	public int isJandiNickNameDup(String nickName) {
		
		return memberMapper.selectCountJandiNickName(nickName);
	}
	
	@Override
	public int selectTrueNumber() {
		
		return memberMapper.selectTrueNumber();
	}

	@Override
	public int isSsackNickNameDup(MemberDTO member) {
		
		return memberMapper.isSsackNickNameDup(member);
	}

	@Override
	public String encodingPwd(String password) {
		
		return passwordEncoder.encode(password);
	}

	@Override
	public boolean isRegistMember(MemberDTO member) {
		
		return memberMapper.isRegistMember(member) > 0? true:false;
	}

	@Override
	public boolean isUpdateCheckHis(Map<String, String> checkNumMap) {
		
		return memberMapper.isUpdateCheckHis(checkNumMap) > 0? true:false;
	}

	@Override
	public boolean isExistEmail(MemberDTO member) {
		
		return memberMapper.isExistEmail(member) > 0? true:false;
	}

	@Override
	public boolean isMatchesPwd(MemberDTO member) {
		
		return passwordEncoder.matches(member.getPassword(), memberMapper.selectEncPwd(member))? true:false;
	}

	@Override
	public MemberDTO loginMember(MemberDTO member) {
		
		return memberMapper.loginMember(member);
	}

	@Override
	public String findEmail(MemberDTO member) {
		
		return memberMapper.findEmail(member);
	}

	@Override
	public int isExistPwd(MemberDTO member) {
		
		return memberMapper.isExistPwd(member);
	}

	@Override
	public int selectPwdTrueNumber(MemberDTO member) {
		
		return memberMapper.selectPwdTrueNumber(member);
	}

	@Override
	public int isUpdatePwd(MemberDTO member) {
		
		return memberMapper.isUpdatePwd(member);
	}



}
