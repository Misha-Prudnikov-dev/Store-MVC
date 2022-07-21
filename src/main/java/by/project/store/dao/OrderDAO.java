package by.project.store.dao;

 import java.util.List;

import by.project.store.entity.Address;
import by.project.store.entity.CheckoutResponce;
import by.project.store.entity.Delivery;
import by.project.store.entity.Order;
import by.project.store.entity.OrderDetail;

public interface OrderDAO {

	int createOrder(int userId)  ;

	boolean addProductToOrder(int orderId, int productId, int quantityProduct, String productSize)  ;

	List<OrderDetail> getProductInOrder(int orderId)  ;

	int getOrderId(int userId)  ;

	boolean removeProductFromOrder(int productId, String productSize,int quantityProduct, int orderId)  ;

	int addAddressOrder(Address address, int userId)  ;

	void addPaymentOrder(String typePayment, String statusPayment, int orderId)  ;

	int addDeliveryOrder(Delivery delivery, int addressId)  ;

	CheckoutResponce checkout(int orderId,   Address address,
			String typePayment, String statusPayment, String typeDelivery, int userId);

 
	List<Order> getOrderHistory(int userId);

	Order getOrderInfo(int orderId);

}
