package com.order.mvc;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sun.net.www.content.text.plain;

import com.member.dto.Member;
import com.menu.dto.MenuEntity;
import com.menu.dto.MenuModel;
import com.mymenu.dto.MyMenuModel;
import com.order.dto.OrderCheckModel;
import com.order.dto.OrderDomin;
import com.order.dto.OrderEntty;
import com.order.dto.OrderProductEntty;
import com.order.dto.PointEntty;
import com.storeMap.dto.Store;

@Service
public class OrderService {

	@Autowired
	private OrderRepository repository;

	public List<MenuModel> findByMenuList() {
		List<MenuEntity> menuEntity = repository.selectMenuList();
		List<MenuModel> menuModelList = new ArrayList<MenuModel>();
		for (MenuEntity menuListEntity : menuEntity) {
			MenuModel menuModel = new MenuModel();
			menuModel.setMenu_num(menuListEntity.getMenu_num());
			menuModel.setM_group(menuListEntity.getM_group());
			menuModel.setM_category(menuListEntity.getM_category());
			menuModel.setM_name(menuListEntity.getM_name());
			menuModel.setImage_name(menuListEntity.getImage());
			menuModel.setContent(menuListEntity.getContent());
			menuModel.setPrice(menuListEntity.getPrice());

			menuModelList.add(menuModel);
		}
		return menuModelList;
	}

	public List<Store> findByStoreList() {
		List<Store> stores = repository.selectStoreList();
		return stores;
	}

	public OrderCheckModel createOrder(OrderDomin orderDomin) {

		OrderCheckModel orderCheckModel = new OrderCheckModel();

		int cnt = 0;

		int order_num = repository.selectOrder_num();

		int myPoint = 0; // ���� ����Ʈ
		int Point; // ���� �Ǵ� ����� ����Ʈ

		// �ֹ����� ����
		if (orderDomin.getM_group().equals("coffee")) {
			OrderEntty orderEntty = new OrderEntty();
			orderEntty.setOrder_num(order_num);
			orderEntty.setMember_id(orderDomin.getMember_id());
			orderEntty.setM_group(orderDomin.getM_group());
			orderEntty.setStore_num(orderDomin.getStore_num());
			orderEntty.setTotal_price(orderDomin.getTotalprice());
			orderEntty.setPayment(orderDomin.getPayment());
			orderEntty.setPickup("����");
			orderEntty.setAddress("����");
			if (orderDomin.getUsepoint() != 0) {
				PointEntty pointEntty = new PointEntty();
				// ����Ʈ ��ȸ
				myPoint = repository.selectPoint(orderDomin.getMember_id());
				Point = myPoint - orderDomin.getUsepoint();

				pointEntty.setMember_id(orderDomin.getMember_id());
				pointEntty.setPoint(Point);

				// ����Ʈ ���
				cnt = repository.updatePoint(pointEntty);
				orderEntty.setOrder_etc("'" + orderDomin.getUsepoint()
						+ "'�� ����ϼ̽��ϴ�.");

				System.out.println(orderEntty.getOrder_etc());
			} else {
				orderEntty.setOrder_etc("");
			}

			// �ֹ����� ����
			cnt = repository.insertOrder(orderEntty);

			// �ֹ� ��ǰ ����
			if (cnt == 1) {
				int[] m_num = orderDomin.getM_num();
				int[] ordervalue = orderDomin.getOrdervalue();
				String[] m_name = orderDomin.getM_name();
				String[] size = orderDomin.getOptionsize();
				int[] shot = orderDomin.getOptionshot();
				int[] whip = orderDomin.getOptionwhip();
				// ///�޴��̸��� MY�� ���ٸ�
				for (int i = 0; i < m_num.length; i++) {
					OrderProductEntty orderProductEntty = new OrderProductEntty();
					orderProductEntty.setOrder_num(order_num);
					orderProductEntty.setMenu_num(m_num[i]);
					orderProductEntty.setOrder_p_qty(ordervalue[i]);
					orderProductEntty.setOrder_p_group(orderDomin.getM_group());
					orderProductEntty.setOptionsize(size[i]);
					orderProductEntty.setOptionshot(shot[i]);
					orderProductEntty.setOptionwhip(whip[i]);
					
					cnt = repository.insertOrderProduct(orderProductEntty);
				}
			}
		}

		// ����Ʈ����
		PointEntty pointEntty = new PointEntty();
		// ����Ʈ ��ȸ
		myPoint = repository.selectPoint(orderDomin.getMember_id());
		int addPoint = orderDomin.getTotalprice() * 10 / 100;

		pointEntty.setMember_id(orderDomin.getMember_id());
		pointEntty.setPoint(myPoint + addPoint);

		cnt = repository.updatePoint(pointEntty);

		Store store = repository.selectStore(orderDomin.getStore_num());

		orderCheckModel.setMember_id(orderDomin.getMember_id());
		orderCheckModel.setUsePoint(orderDomin.getUsepoint());
		orderCheckModel.setAddPoint(addPoint);
		myPoint = repository.selectPoint(orderDomin.getMember_id());
		orderCheckModel.setPoint(myPoint);
		orderCheckModel.setTotalprice(orderDomin.getTotalprice());
		orderCheckModel.setPayment(orderDomin.getPayment());
		orderCheckModel.setStore(store);

		return orderCheckModel;

	}

	public Member findByMember(String member_id) {
		return repository.selectByMember(member_id);
	}

	public List<MyMenuModel> mymenuList(String id) {
		return repository.mymenuList(id);
	}

}
