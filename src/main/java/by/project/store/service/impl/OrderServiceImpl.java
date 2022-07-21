package by.project.store.service.impl;

 import java.util.List;

import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

 import by.project.store.dao.OrderDAO;
import by.project.store.entity.Address;
import by.project.store.entity.CheckoutResponce;
import by.project.store.entity.Delivery;
import by.project.store.entity.Order;
import by.project.store.entity.OrderDetail;
import by.project.store.service.OrderService;
 
@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderDAO orderDAO;

	@Override
	@Transactional
	public int createOrder(int userId) {

		int orderId = orderDAO.createOrder(userId);

		return orderId;
	}

	@Override
	@Transactional
	public boolean addProductToOrder(int orderId, int productId, int quantityProduct, String productSize) {

		return orderDAO.addProductToOrder(orderId, productId, quantityProduct, productSize);

	}

	@Override
	@Transactional
	public List<OrderDetail> getProductInOrder(int orderId) {

		List<OrderDetail> groupOrderDetail = orderDAO.getProductInOrder(orderId);

		return groupOrderDetail;

	}

	@Override
	@Transactional
	public int getOrderId(int userId) {

		int orderId = orderDAO.getOrderId(userId);

		return orderId;
	}

	@Override
	@Transactional
	public boolean removeProductFromOrder(int productId, String productSize, int quantityProduct, int orderId) {

		return orderDAO.removeProductFromOrder(productId, productSize, quantityProduct, orderId);

	}

	@Override
	public int addAddressOrder(Address address, int userId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	@Transactional
	public CheckoutResponce checkout(int orderId, Address address, String typePayment, String statusPayment,
			String typeDelivery, int userId) {

		CheckoutResponce cr = orderDAO.checkout(orderId, address, typePayment, statusPayment, typeDelivery, userId);

		return cr;
	}

	@Override
	public void addPaymentOrder(String typePayment, String statusPayment, int orderId) {
		// TODO Auto-generated method stub

	}

	@Override
	public int addDeliveryOrder(Delivery delivery, int addressId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	@Transactional
	public List<Order> getOrderHistory(int userId) {

		List<Order> groupOrder = orderDAO.getOrderHistory(userId);

		return groupOrder;
	}

	@Override
	@Transactional
	public Order getOrderInfo(int orderId) {

		Order orderHistoryInfo = orderDAO.getOrderInfo(orderId);

		Hibernate.initialize(orderHistoryInfo.getPayment());

		return orderHistoryInfo;
	}

}
