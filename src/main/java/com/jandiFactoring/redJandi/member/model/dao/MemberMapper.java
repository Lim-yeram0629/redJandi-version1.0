package com.jandiFactoring.redJandi.member.model.dao;

import org.apache.ibatis.annotations.Mapper;

import com.jandiFactoring.redJandi.member.model.dto.MemberDTO;

@Mapper
public interface MemberMapper {

	int isSsackEmailDup(MemberDTO member);

	int selectCountJandiNickName(String nickName);

}
