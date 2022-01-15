package com.jandiFactoring.redJandi.classRoom.model.service;

import java.util.List;
import java.util.Map;

import com.jandiFactoring.redJandi.classRoom.model.dto.ClassDTO;
import com.jandiFactoring.redJandi.classRoom.model.dto.ClassReviewDTO;

public interface ClassRoomService {

	List<ClassDTO> selectTitlesAndClassCodesByEmail(String email);

	ClassDTO selectClassByClassCode(int classCode);

	List<Map<String, String>> selectCurrentMemberList(int classCode);

	List<Map<String, Object>> selectJJimClassMemberList(int classCode);

	int selectReviewListByClassCodeTotalCount(Map<String, Object> searchMap);

	List<ClassReviewDTO> selectReviewListByClassCode(Map<String, Object> searchMap);

}
