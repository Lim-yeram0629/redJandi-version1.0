package com.jandiFactoring.redJandi.member.model.dao;

import java.sql.Date;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.jandiFactoring.redJandi.member.model.dto.MemberDTO;

@Mapper
public interface MemberMapper {

	int isSsackEmailDup(MemberDTO member);

	int selectCountJandiNickName(String nickName);
	
	int isInsertCheckNum(String authNum);

	int selectTrueNumber();

	int isSsackNickNameDup(MemberDTO member);

	int isRegistMember(MemberDTO member);

	int isUpdateCheckHis(Map<String, String> checkNumMap);

	int isExistEmail(MemberDTO member);

	String selectEncPwd(MemberDTO member);

	MemberDTO loginMember(MemberDTO member);

	String findEmail(MemberDTO member);

	int isExistPwd(MemberDTO member);

	int isExistCheckNum(MemberDTO member);

	int isUpdateCheckNum(Map<String, String> checkNumMap);

	int selectPwdTrueNumber(MemberDTO member);

	int isUpdatePwd(MemberDTO member);

	int selectBlackTime(MemberDTO member);

	int isBlackUnlocked(MemberDTO member);

}
