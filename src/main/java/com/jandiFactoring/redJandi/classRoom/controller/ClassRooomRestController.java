package com.jandiFactoring.redJandi.classRoom.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.jandiFactoring.redJandi.classRoom.model.dto.ClassDTO;
import com.jandiFactoring.redJandi.classRoom.model.service.ClassRoomService;

@RestController
@RequestMapping({"/jandi/class/*", "/mypage/class/*", "/findclass/class/*"})
public class ClassRooomRestController {
	
	private final ClassRoomService classRoomService;
	
	@Autowired
	public ClassRooomRestController(ClassRoomService classRoomService) {
		this.classRoomService = classRoomService;
	}
	
	@RequestMapping(value = "titles&ClassCodes/{email}", method = RequestMethod.GET)
	public List<ClassDTO> getTitlesAndClassCodesByEmail(@PathVariable("email") String email) {
		
		List<ClassDTO> classDTOList = classRoomService.selectTitlesAndClassCodesByEmail(email);
		
		return classDTOList;
	}
	
	@RequestMapping(value = "{classCode}", method = RequestMethod.GET)
	public ClassDTO getClassDTO(@PathVariable("classCode") int classCode) {
		
		ClassDTO classDTO = classRoomService.selectClassByClassCode(classCode);
		
		return classDTO;
	}
	
}
