package com.jandiFactoring.redJandi.main.model.service;

import java.util.List;

import com.jandiFactoring.redJandi.classRoom.model.dto.ClassDTO;
import com.jandiFactoring.redJandi.jandi.model.dto.JandiDTO;

public interface MainService {

/*	List<ClassDTO> selectAllClassList(); */

	List<ClassDTO> popularClass();

	List<JandiDTO> popularJandi();

	List<ClassDTO> viewClass();

	List<ClassDTO> newestClass();

	List<ClassDTO> deadlineClass();

	List<ClassDTO> highScoreClass(); 

}
