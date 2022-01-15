package com.jandiFactoring.redJandi.common.file;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

import com.jandiFactoring.redJandi.common.file.dto.FileDTO;


/**
 * @author 임예람
 *
 * 파일 업로드, 파일 다운로드를 위한 클래스
 */
public class FileWrapper {
	
	/**
	 * 원본 파일명을 랜덤으로 저장하여 파일명 중복을 방지하는 메소드
	 * @author 임예람
	 * 
	 * @param originalFileName
	 * @return savedName
	 */
	public String changeFileNameByRandomUUID(String originalFileName) {
		
		String ext = originalFileName.substring(originalFileName.lastIndexOf("."));
		String savedName = UUID.randomUUID().toString().replace("-", "") + ext;
		
		return savedName;
	}
	
	
	/**
	 * 파일을 저장할 경로를 체크하여 경로가 없다면 해당 폴더를 만들고
	 * 파일 경로를 반환한다.
	 * 
	 * @author 임예람
	 * 
	 * @param rootPath
	 * @param dir
	 * @return filePath
	 */
	public String checkFilePath(String dir) {
		// 파일이 저장될 루트 경로
		final String rootPath = new File("").getAbsolutePath() + "/src/main/resources/static";
		String filePath = rootPath + dir;
		
		// 해당 경로가 있는지 체크하여 경로가 없으면 폴더를 생성한다.
		File mkdir = new File(filePath);
		if(!mkdir.exists()) { 	mkdir.mkdirs(); 	}
		
		return filePath;
	}
	
	
	/**
	 * 파일 업로드 처리
	 * @param file 파라미터로 받은 multipartFile
	 * @param dir 파일을 저장할 폴더
	 * @return 성공시 true, 실패시 false
	 * 
	 * @author 임예람
	 * @throws Exception 
	 */
	public String uploadSingleFile(MultipartFile file, String dir) throws Exception {
		
		String savedName = changeFileNameByRandomUUID(file.getOriginalFilename());
		String filePath = checkFilePath(dir);
		
		// multipartFile을 매개변수로 받은 경로에 지정한 이름으로 저장
		try {
			file.transferTo(new File(filePath + "/" + savedName));
		
			System.out.println("파일 업로드 성공");
			
		} catch (IllegalStateException | IOException e) {	// 오류 발생시 해당 파일 삭제
			e.printStackTrace();
			new File(filePath + "/" + savedName).delete();
			throw new Exception();
		}
		
		return savedName;
	}
	
	
	/**
	 * 파일 다운로드
	 * @param file	다운받을 파일
	 * @param os 파일을 내보낼 outputStream
	 * @return 성공시 true, 실패시 false
	 * 
	 * @author 임예람
	 * @throws IOException 
	 */
	public boolean downloadSingleFile(File file, OutputStream os) throws IOException {
		
		boolean result = false;
		
		// 파일의 내용을 byte단위로 읽어오기 때문에 읽어서 저장할 byte배열 선언
		byte[] buffer = new byte[1024];
		FileInputStream fis = null;

		// 파일 인풋스트림에 파일 담기
		fis = new FileInputStream(file);
		
		int readCount = 0;
		// 파일을 buffer만큼 읽고 그 길이를 readCount에 저장한다. 
		// readCount가 0이면 파일을 모두 읽은 것이므로 readCount가 0보다 클 때까지만 반복한다.
		while((readCount = fis.read(buffer)) > 0) {
			// 파일을 저장한 버퍼를 0부터 그 길이 만큼인 readCount만큼 쓴다.
			os.write(buffer, 0, readCount);
		}
		
		fis.close();
		os.close();
		
		return result;
	}
	
	/**
	 * @author 임예람
	 * 같은 경로의 여러개 파일 동시 삭제하기
	 * 
	 * @param filePath
	 * @param files
	 */
	public void deleteFilesInSamePath(String filePath, List<FileDTO> files) {
		
		for(FileDTO file : files) {
			new File(filePath + "/" + file.getFilePath()).delete();
		}
		
	}
	
}
