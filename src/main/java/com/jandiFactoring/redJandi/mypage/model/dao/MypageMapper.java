package com.jandiFactoring.redJandi.mypage.model.dao;

import org.apache.ibatis.annotations.Mapper;

import com.jandiFactoring.redJandi.member.model.dto.MemberDTO;

@Mapper
public interface MypageMapper {

	MemberDTO selectMyInfo();

}
