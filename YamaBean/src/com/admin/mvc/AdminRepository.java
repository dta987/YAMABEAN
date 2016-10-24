package com.admin.mvc;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.admin.dto.BestMenuModel;
import com.admin.dto.OrderList;
import com.admin.dto.UpdateOrderYN;
import com.admin.mapper.AdminMapper;
import com.member.dto.Member;
import com.menu.dto.MenuEntity;
import com.menu.dto.MenuModel;
import com.storeMap.dto.Store;

@Repository
public class AdminRepository {
	
	@Autowired
	private AdminMapper mapper;

	public List<OrderList> selectByList(int num) {
		return mapper.selectByList(num);
	}

	public int updateOrder(UpdateOrderYN yn) {
		return mapper.updateOrder(yn);
	}

	public List<Store> selectByStore() {
		return mapper.selectByStore();
	}

	public List<BestMenuModel> selectBestMenu() {
		return mapper.selectBestMenu();
	}

	public List<Member> selectByMemberList() {
		return mapper.selectByMemberList();
	}

	public List<MenuModel> selectByMenuList() {
		return mapper.selectByMenuList();
	}

}
