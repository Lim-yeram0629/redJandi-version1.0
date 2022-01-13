package com.jandiFactoring.redJandi.main.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jandiFactoring.redJandi.classRoom.model.dto.ClassDTO;
import com.jandiFactoring.redJandi.jandi.model.dto.JandiDTO;

@Mapper
public interface MainDAO {

/*	List<ClassDTO> selectAllClassList(); */

	List<ClassDTO> selectPopularClass();

	List<JandiDTO> selectPupularJandi();

	List<ClassDTO> selectViewClass();

	List<ClassDTO> selectNewestClass();

	List<ClassDTO> selectDeadlineClass();

	List<ClassDTO> selectHighScoreClass(); 

}
