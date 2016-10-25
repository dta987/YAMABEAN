package com.order.mvc;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.member.dto.Member;
import com.menu.dto.MenuEntity;
import com.mymenu.dto.MyMenuModel;
import com.order.dto.OrderEntty;
import com.order.dto.OrderProductEntty;
import com.order.dto.PointEntty;
import com.order.mapper.OrderMapper;
import com.storeMap.dto.Store;

@Repository
public class OrderRepository {

	@Autowired
	private OrderMapper mapper;

	public List<MenuEntity> selectMenuList() {
		return mapper.selectMenuList();
	}

	public List<Store> selectStoreList() {
		return mapper.selectStoreList();
	}

	public int insertOrder(OrderEntty orderEntty) {
		return mapper.insertOrder(orderEntty);
	}

	public int insertOrderProduct(OrderProductEntty orderProductEntty) {
		return mapper.insertOrderProduct(orderProductEntty);
	}

	public int selectOrder_num() {
		return mapper.selectOrder_num();
	}

	public int selectPoint(String member_id) {
		return mapper.selectPoint(member_id);
	}

	public int updatePoint(PointEntty PointEntty) {
		return mapper.updatePoint(PointEntty);
	}

	public Store selectStore(int store_num) {
		return mapper.selectStore(store_num);
	}

	public Member selectByMember(String member_id) {
		return mapper.seelctByMember(member_id);
	}

	public List<MyMenuModel> mymenuList(String id) {
		return mapper.mymenuList(id);
	}

}
