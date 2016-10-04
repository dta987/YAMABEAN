package com.menu.dto;

import java.io.File;
import java.io.IOException;
import java.util.UUID;



import org.springframework.util.FileCopyUtils;

public class FileUtile {

	static final String uploadPath="..\\WEB-INF\\coffee";
	
	/*1. 파일 서버에 저장될 유일한 파일 이름 생성 */
	public static String makeSavedFileName(String originalFilename) {
		System.out.println("fileUtile_makeSavedFileName");
		
		/*유일한 파일 이름을 만들어주는 클래스*/
		UUID uid = UUID.randomUUID();
		/*유일한 파일 이름 만들어 주기*/
		String savedFile = uid.toString()+"_"+originalFilename;
		return savedFile;
	}

	/* 2. 파일 서버에 파일 저장 */
	public static boolean saveFile(String saveFileName, byte[] fileData) {
		File target = new File(uploadPath, saveFileName);
		try {
			FileCopyUtils.copy(fileData, target);
		} catch (IOException e) {
			System.out.println("--파일서버저장실패");
			e.printStackTrace();
			return false;
		}
		return true;
	}

	public static boolean deleteFile(String image) {
		File deleteFile = new File(uploadPath, image);
		return deleteFile.delete();
	}

}
