package by.project.store.service;

import java.util.List;

import by.project.store.entity.Address;
import by.project.store.entity.CheckoutResponce;
import by.project.store.entity.Delivery;
import by.project.store.entity.Order;
import by.project.store.entity.OrderDetail;

public interface OrderService {

	int createOrder(int userId);

	boolean addProductToOrder(int orderId, int productId, int quantityProduct, String productSize);

	List<OrderDetail> getProductInOrder(int orderId)throws ServiceException;

	int getOrderId(int userId);

	boolean removeProductFromOrder(int productId, String productSize, int quantityProduct, int orderId);

	int addAddressOrder(Address address, int userId);

	CheckoutResponce checkout(int orderId, Address address, String typePayment, String statusPayment,
			String typeDelivery, int userId);

	void addPaymentOrder(String typePayment, String statusPayment, int orderId);

	int addDeliveryOrder(Delivery delivery, int addressId);

	List<Order> getOrderHistory(int userId);

	Order getOrderInfo(int orderId);

}
