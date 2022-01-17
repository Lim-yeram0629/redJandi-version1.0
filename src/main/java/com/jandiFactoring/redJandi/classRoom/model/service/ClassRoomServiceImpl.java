package com.jandiFactoring.redJandi.classRoom.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jandiFactoring.redJandi.classRoom.model.dao.ClassRoomMapper;
import com.jandiFactoring.redJandi.classRoom.model.dto.ClassDTO;
import com.jandiFactoring.redJandi.classRoom.model.dto.ClassReviewDTO;
import com.jandiFactoring.redJandi.classRoom.model.dto.MokchaDTO;
import com.jandiFactoring.redJandi.common.file.dto.FileDTO;

@Service
@Transactional(rollbackFor = Exception.class)
public class ClassRoomServiceImpl implements ClassRoomService{

	private final ClassRoomMapper classRoomMapper;
	
	@Autowired
	public ClassRoomServiceImpl(ClassRoomMapper classRoomMapper) {
		this.classRoomMapper = classRoomMapper;
	}

	@Override
	public List<ClassDTO> selectTitlesAndClassCodesByEmail(String email) {
		return classRoomMapper.selectTitlesAndClassCodesByEmail(email);
	}

	@Override
	public ClassDTO selectClassByClassCode(int classCode) {
		return classRoomMapper.selectClassByClassCode(classCode);
	}

	@Override
	public List<Map<String, String>> selectCurrentMemberList(int classCode) {
		// TODO Auto-generated method stub
		return classRoomMapper.selectCurrentMemberList(classCode);
	}

	@Override
	public List<Map<String, Object>> selectJJimClassMemberList(int classCode) {
		// TODO Auto-generated method stub
		return classRoomMapper.selectJJimClassMemberList(classCode);
	}

	@Override
	public int selectReviewListByClassCodeTotalCount(Map<String, Object> searchMap) {
		// TODO Auto-generated method stub
		return classRoomMapper.selectReviewListByClassCodeTotalCount(searchMap);
	}

	@Override
	public List<ClassReviewDTO> selectReviewListByClassCode(Map<String, Object> searchMap) {
		// TODO Auto-generated method stub
		return classRoomMapper.selectReviewListByClassCode(searchMap);
	}
	
	@Override
	public boolean modifyClass(ClassDTO classDTO) {
		// TODO Auto-generated method stub
		return classRoomMapper.modifyClass(classDTO);
	}

	@Override
	public List<MokchaDTO> selectMokchaNamesByClassCode(int classCode) {
		// TODO Auto-generated method stub
		return classRoomMapper.selectMokchaNamesByClassCode(classCode);
	}

	@Override
	public int selectMokchaListByClassCodeTotalCount(Map<String, Object> searchMap) {
		// TODO Auto-generated method stub
		return classRoomMapper.selectMokchaListByClassCodeTotalCount(searchMap);
	}

	@Override
	public List<MokchaDTO> selectMokchaListByClassCode(Map<String, Object> searchMap) {
		// TODO Auto-generated method stub
		return classRoomMapper.selectMokchaListByClassCode(searchMap);
	}

	@Override
	public List<FileDTO> selectMokchaFileListbyMokchaCode(int mokchaCode) {
		// TODO Auto-generated method stub
		return classRoomMapper.selectMokchaFileListbyMokchaCode(mokchaCode);
	}
	
}
