package com.jandiFactoring.redJandi.jandi.model.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.jandiFactoring.redJandi.findClass.model.dto.FindClassDTO;
import com.jandiFactoring.redJandi.jandi.model.dto.JandiDTO;

public interface JandiService {

	JandiDTO selectJandiInformation(JandiDTO jandiDTO);

	List<FindClassDTO> selectJandiClassList(JandiDTO jandiDTO);

	boolean modifyJandiNickName(JandiDTO jandiDTO);

	boolean modifyProfile(JandiDTO jandiDTO);

	boolean modifyJandiCareerAndIntro(JandiDTO jandiDTO);



}
