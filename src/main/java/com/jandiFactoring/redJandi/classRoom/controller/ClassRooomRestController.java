package com.jandiFactoring.redJandi.classRoom.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.jandiFactoring.redJandi.classRoom.model.dto.ClassDTO;
import com.jandiFactoring.redJandi.classRoom.model.dto.MokchaDTO;
import com.jandiFactoring.redJandi.classRoom.model.service.ClassRoomService;

@RestController
@RequestMapping({"/jandi/class/*", "/mypage/class/*", "/findclass/class/*"})
public class ClassRooomRestController {
	
	private final ClassRoomService classRoomService;
	
	@Autowired
	public ClassRooomRestController(ClassRoomService classRoomService) {
		this.classRoomService = classRoomService;
	}
	
	/**
	 * 이메일로 클래스의 타이틀과 코드를 반환하는 메소드
	 * @author 임예람
	 * 
	 * @param email
	 * @return 클래스의 타이틀과 코드 리스트
	 */
	@RequestMapping(value = "titles&ClassCodes/{email}", method = RequestMethod.GET)
	public List<ClassDTO> getTitlesAndClassCodesByEmail(@PathVariable("email") String email) {
		
		List<ClassDTO> classDTOList = classRoomService.selectTitlesAndClassCodesByEmail(email);
		return classDTOList;
	}
	
	/**
	 * 클래스 코드로 클래스 정보를 조회하는 메소드
	 * @author 임예람
	 * 
	 * @param classCode
	 * @return 클래스 정보
	 */
	@RequestMapping(value = "{classCode}", method = RequestMethod.GET)
	public ClassDTO getClassDTO(@PathVariable("classCode") int classCode) {
		
		ClassDTO classDTO = classRoomService.selectClassByClassCode(classCode);
		return classDTO;
	}
	
	/**
	 * 해당 클래스 코드의 클래스를 업데이트 하는 메소드
	 * @author 임예람
	 * 
	 * @param classCode
	 * @param classDTO
	 * @return 저장한 시간
	 */
	@RequestMapping(value="{classCode}", method = RequestMethod.PATCH)
	public String patchClassDTO(@PathVariable("classCode") int classCode, ClassDTO classDTO) {
		
		if(!classRoomService.modifyClass(classDTO)) {
			return "저장에 실패했습니다.";
		}
		
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String lastModifyTime = simpleDateFormat.format(new Date(System.currentTimeMillis()));
		
		return lastModifyTime + ", 저장";
	}
	
	/**
	 * 클래스코드로 해당 목차 5개만 조회하는 메소드
	 * @author 임예람
	 * 
	 * @param classCode
	 * @return 목차 타이틀 리스트
	 */
	@RequestMapping(value = "mokcha/names/{classCode}", method = RequestMethod.GET)
	public List<MokchaDTO> getMokchaNamesByClassCode(@PathVariable("classCode") int classCode) {
		
		List<MokchaDTO> classMokchaList = classRoomService.selectMokchaNamesByClassCode(classCode);
		return classMokchaList;
	}
	
}
