package com.admin.mvc;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.admin.dto.BestMenuModel;
import com.admin.dto.OrderList;
import com.admin.dto.UpdateOrderYN;
import com.member.dto.Member;
import com.menu.dto.MenuEntity;
import com.menu.dto.MenuModel;
import com.storeMap.dto.Store;

@Service
public class AdminService {
	
	@Autowired
	private AdminRepository repository;

	public List<OrderList> orderList(int num) {
		return repository.selectByList(num);
	}

	public int modifyOrder(UpdateOrderYN yn) {
		return repository.updateOrder(yn);
	}

	public List<Store> findByStore() {
		return repository.selectByStore();
	}

	public List<BestMenuModel> findBestMenu() {
		return repository.selectBestMenu();
	}

	public List<Member> findByMemberList() {
		return repository.selectByMemberList();
	}

	public List<MenuModel> findByMenuList() {
		return repository.selectByMenuList();
	}

}
