package com.menu.dto;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.util.FileCopyUtils;

public class FileUtile {

	private static String uploadPath = "";

	/* 1. ���� ������ ����� ������ ���� �̸� ���� */
	public static String makeSavedFileName(String originalFilename,
			HttpServletRequest request) {
		
		uploadPath = request.getSession().getServletContext().getRealPath("/coffee/");
		
		System.out.println("fileUtile_makeSavedFileName");
		/* ������ ���� �̸��� ������ִ� Ŭ���� */
		UUID uid = UUID.randomUUID();
		/* ������ ���� �̸� ����� �ֱ� */
		String savedFile = uid.toString() + "_" + originalFilename;
		return savedFile;
	}

	/* 2. ���� ������ ���� ���� */
	public static boolean saveFile(String saveFileName, byte[] fileData) {
		File target = new File(getUploadpath(), saveFileName);
		try {
			FileCopyUtils.copy(fileData, target);
		} catch (IOException e) {
			System.out.println("--���ϼ����������");
			e.printStackTrace();
			return false;
		}
		return true;
	}

	public static boolean deleteFile(String image) {
		File deleteFile = new File(getUploadpath(), image);
		return deleteFile.delete();
	}

	public static String getUploadpath() {
		return uploadPath;
	}
}
