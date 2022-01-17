package com.jandiFactoring.redJandi.classRoom.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.jandiFactoring.redJandi.classRoom.model.dto.ClassDTO;
import com.jandiFactoring.redJandi.classRoom.model.dto.ClassReviewDTO;
import com.jandiFactoring.redJandi.classRoom.model.dto.MokchaDTO;
import com.jandiFactoring.redJandi.common.file.dto.FileDTO;

@Mapper
public interface ClassRoomMapper {

	List<ClassDTO> selectTitlesAndClassCodesByEmail(String email);

	ClassDTO selectClassByClassCode(int classCode);

	List<Map<String, String>> selectCurrentMemberList(int classCode);

	List<Map<String, Object>> selectJJimClassMemberList(int classCode);

	int selectReviewListByClassCodeTotalCount(Map<String, Object> searchMap);

	List<ClassReviewDTO> selectReviewListByClassCode(Map<String, Object> searchMap);
	
	boolean modifyClass(ClassDTO classDTO);

	List<MokchaDTO> selectMokchaNamesByClassCode(int classCode);

	int selectMokchaListByClassCodeTotalCount(Map<String, Object> searchMap);

	List<MokchaDTO> selectMokchaListByClassCode(Map<String, Object> searchMap);

	List<FileDTO> selectMokchaFileListbyMokchaCode(int mokchaCode);

	boolean modifyMokcha(MokchaDTO mokchaDTO);

	boolean modifyMokchaFile(FileDTO fileDTO);

	boolean registMokcha(MokchaDTO mokchaDTO);

}