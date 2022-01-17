package com.jandiFactoring.redJandi.classRoom.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.jandiFactoring.redJandi.classRoom.model.dto.ClassDTO;
import com.jandiFactoring.redJandi.classRoom.model.dto.ClassReviewDTO;
import com.jandiFactoring.redJandi.classRoom.model.service.ClassRoomService;
import com.jandiFactoring.redJandi.common.paging.Pagenation;
import com.jandiFactoring.redJandi.common.paging.dto.SelectCriteria;

@Controller
@RequestMapping({"/jandi/class/*", "/mypage/class/*", "/findclass/class/*"})
@SessionAttributes({"currentClassDTO", "currentMemberList", "currentMemberCount", "jandi"})
public class ClassRoomController {
	
	private final ClassRoomService classRoomService;
	
	@Autowired
	public ClassRoomController(ClassRoomService classRoomService) {
		this.classRoomService = classRoomService;
	}
	
	@GetMapping("classRoom")
	public void classRoom(ClassDTO classDTO, SelectCriteria selectCriteria, Model model) {
		
		// 해당 클래스 번호로 클래스 정보 조회
		ClassDTO currentClassDTO = classRoomService.selectClassByClassCode(classDTO.getClassCode());
		model.addAttribute("currentClassDTO", currentClassDTO);
		
		// 해당 클래스를 듣고 있는 새싹의 리스트 조회, 해당 리스트의 사이즈로 총 멤버의 수 저장
		List<Map<String, String>> currentMemberList = classRoomService.selectCurrentMemberList(classDTO.getClassCode());
		model.addAttribute("currentMemberList", currentMemberList);
		model.addAttribute("currentMemberCount", currentMemberList.size());
		
		// 해당 클래스를 찜한 회원의 리스트 조회 후 SessionAttributes에 저장
		model.addAttribute("jjimClassMemberList", classRoomService.selectJJimClassMemberList(classDTO.getClassCode()));
		
		// 클래스 코드와 페이징처리 객체 맵에 저장
		Map<String, Object> searchMap = new HashMap<>();
		searchMap.put("classCode", classDTO.getClassCode());
		searchMap.put("selectCriteria", selectCriteria);
		
		// 불러올 개수, 버튼 개수, 전체 개수 저장 후 페이징처리
		selectCriteria.setPagenationConfig(5, 5, classRoomService.selectReviewListByClassCodeTotalCount(searchMap));
		selectCriteria = Pagenation.getSelectCriteria(selectCriteria);
		
		model.addAttribute("reviewList", classRoomService.selectReviewListByClassCode(searchMap));
		model.addAttribute("selectCriteria", selectCriteria);
		
	}

}
