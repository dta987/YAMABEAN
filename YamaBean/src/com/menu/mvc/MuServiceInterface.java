package com.menu.mvc;

import java.util.List;

import com.menu.dto.Menu;

public interface MuServiceInterface {
	
	public int addMenu(Menu menu); // �޴��߰�

	public int modifMenu(Menu menu); // �޴�����
	
	public Menu findByMenu(int pk); // �޴�ã��
	
	public int removeMember(int pk); // �޴��߰�, ����

	public List<Menu> findByList(String mode, String keyword); // �������Ʈ
	

}
