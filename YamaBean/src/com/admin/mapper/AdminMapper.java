package com.admin.mapper;

import java.util.List;

import org.apache.ibatis.session.RowBounds;

import com.admin.dto.BestMenuModel;
import com.admin.dto.OrderList;
import com.admin.dto.StoreOrder;
import com.admin.dto.StoreOrdercondition;
import com.admin.dto.StoreSales;
import com.admin.dto.UpdateOrderYN;
import com.member.dto.Member;
import com.menu.dto.MenuEntity;
import com.menu.dto.MenuModel;
import com.storeMap.dto.Store;

public interface AdminMapper {

	List<OrderList> selectByList(int num);

	int updateOrder(int num, int val);

	int updateOrder(UpdateOrderYN yn);

	List<Store> selectByStore();

	List<BestMenuModel> selectBestMenu();

	List<Member> selectByMemberList();

	List<MenuModel> selectByMenuList();

	List<StoreSales> findtotalSales();

	List<StoreOrder> findstoreOrder(RowBounds rowBounds,
			StoreOrdercondition condition);

}
