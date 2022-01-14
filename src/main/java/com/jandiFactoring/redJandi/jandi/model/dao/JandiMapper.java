package com.jandiFactoring.redJandi.jandi.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jandiFactoring.redJandi.findClass.model.dto.FindClassDTO;
import com.jandiFactoring.redJandi.jandi.model.dto.JandiDTO;

@Mapper
public interface JandiMapper {

	JandiDTO selectJandiInformation(JandiDTO jandi);

	List<FindClassDTO> selectJandiClassList(JandiDTO jandi);

	boolean modifyJandiNickName(JandiDTO jandi);

	boolean modifyProfile(JandiDTO jandiDTO);

	boolean modifyJandiCareerAndIntro(JandiDTO jandiDTO);


}
