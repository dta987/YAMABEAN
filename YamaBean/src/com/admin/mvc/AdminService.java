package com.admin.mvc;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.admin.dto.BestMenuModel;
import com.admin.dto.OrderList;
import com.admin.dto.StoreOrdercondition;
import com.admin.dto.StoreSales;
import com.admin.dto.UpdateOrderYN;
import com.member.dto.Member;
import com.menu.dto.MenuModel;
import com.storeMap.dto.Store;

@Service
public class AdminService {

	@Autowired
	private AdminRepository repository;

	@Autowired
	private StoreOrderPageing pageing;

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

	public List<StoreSales> findtotalSales() {
		return repository.findtotalSales();
	}

	public List<OrderList> findstoreOrder(StoreOrdercondition condition) {

		RowBounds rowBounds = new RowBounds((condition.getSelectPage() - 1)
				* pageing.getPageSize(), pageing.getPageSize());

		return repository.findstoreOrder(rowBounds, condition);
	}

	public int getOrderPageing(StoreOrdercondition condition) {
		return (int)Math.ceil((double)repository.Count(condition) / pageing.getPageSize());
	}

}
