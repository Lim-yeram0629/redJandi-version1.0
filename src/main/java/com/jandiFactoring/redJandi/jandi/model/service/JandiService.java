package com.jandiFactoring.redJandi.jandi.model.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.jandiFactoring.redJandi.findClass.model.dto.FindClassDTO;
import com.jandiFactoring.redJandi.jandi.model.dto.JandiDTO;

public interface JandiService {

	JandiDTO selectJandiInformation(String email);

	List<FindClassDTO> selectJandiClassList(String email);

}
