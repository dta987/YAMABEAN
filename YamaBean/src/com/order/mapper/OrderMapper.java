package com.order.mapper;

import java.util.List;

import com.member.dto.Member;
import com.menu.dto.MenuEntity;
import com.order.dto.OrderEntty;
import com.order.dto.OrderProductEntty;
import com.order.dto.PointEntty;
import com.storeMap.dto.Store;

public interface OrderMapper {

	public List<MenuEntity> selectMenuList();

	public List<Store> selectStoreList();

	public int insertOrder(OrderEntty orderEntty);

	public int insertOrderProduct(OrderProductEntty orderProductEntty);

	public int selectOrder_num();

	public int selectPoint(String member_id);

	public int updatePoint(PointEntty PointEntty);

	public Store selectStore(int store_num);

	public Member seelctByMember(String member_id);
	
	public List<OrderProductEntty> selectByOrder_p(int order_num);
}
