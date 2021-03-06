package com.jandiFactoring.redJandi.classRoom.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jandiFactoring.redJandi.classRoom.model.dto.ClassDTO;
import com.jandiFactoring.redJandi.classRoom.model.dto.MokchaDTO;
import com.jandiFactoring.redJandi.classRoom.model.service.ClassRoomService;
import com.jandiFactoring.redJandi.common.file.dto.FileDTO;

@RestController
@RequestMapping({"/jandi/class/*", "/mypage/class/*", "/findclass/class/*", "/jandi/class"})
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
	
	@RequestMapping(value="", method = RequestMethod.POST)
	public void createClass(ClassDTO classDTO, HttpServletResponse response) throws IOException {
		
		if(!classRoomService.registClass(classDTO)) {
			response.sendRedirect("/jandi/jandiProfile");
		}
		// 최신 클래스 코드 가져오기
		List<ClassDTO> classDTOList = classRoomService.selectTitlesAndClassCodesByEmail(classDTO.getEmail());
		response.sendRedirect("/jandi/class/classRoom?classCode=" + classDTOList.get(0).getClassCode());
	}
	
	@RequestMapping(value="categorys", method = RequestMethod.GET)
	public List<HashMap<String, Object>> getCategorys() {
		
		return classRoomService.selectCategoryList();
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
	
	/**
	 * 해당 목차의 강의 영상 파일 조회
	 * @author 임예람
	 * @param mokchaCode
	 * @return 강의 영상 리스트
	 */
	@RequestMapping(value="mokcha/mokchaFiles/{mokchaCode}", method = RequestMethod.GET)
	public List<FileDTO> getMokchaFileListByMokchaCode(@PathVariable int mokchaCode){
		
		List<FileDTO> mokchaFileList = classRoomService.selectMokchaFileListbyMokchaCode(mokchaCode);
		
		return mokchaFileList;
	}
	
	/** 
	 * 목차 코드의 목차 내용을 수정하는 메소드
	 * @author 임예람
	 * @param mokchaCode
	 * @param mokchaDTO
	 * @return 업데이트 성공시 mokchaDTo, 실패시 null
	 */
	@RequestMapping(value="mokcha/{mokchaCode}", method = RequestMethod.PATCH)
	public MokchaDTO modifyMokcha(@PathVariable int mokchaCode, MokchaDTO mokchaDTO){
		
		if(!classRoomService.modifyMokcha(mokchaDTO)) {
			return null;
		}
		
		return mokchaDTO;
	}
	
	
	/**
	 * 해당 목차파일들을 업데이트 하는 메소드
	 * @author 임예람
	 * @param mokchaCode
	 * @param fileDTO
	 * @return 업데이트 성공시 fileDTO, 실패시 null
	 */
	@RequestMapping(value="mokcha/mokchaFiles/{mokchaCode}", method = RequestMethod.PATCH)
	public FileDTO patchMokchaFile(@PathVariable int mokchaCode, FileDTO fileDTO){
		
		if(!classRoomService.modifyMokchaFile(fileDTO)) {
			return null;
		}
		
		return fileDTO;
	}
	
	
	/**
	 * 목차 파일을을 데이터 베이스에 인서트 하는 메소드
	 * @author 임예람
	 * @param fileDTO
	 * @return 인서트 성공시 fileDTO, 실패시 null
	 */
	@RequestMapping(value="mokcha/mokchaFile", method = RequestMethod.POST)
	public FileDTO registMokchaFile(FileDTO fileDTO){
		
		if(!classRoomService.registMokchaFile(fileDTO)) {
			return null;
		}
		
		return fileDTO;
	}
	
}
