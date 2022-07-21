package by.project.store.dao.impl;


import java.util.List;

import javax.persistence.ParameterMode;
import javax.persistence.StoredProcedureQuery;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import by.project.store.dao.OrderDAO;
import by.project.store.entity.Address;
import by.project.store.entity.CheckoutResponce;
import by.project.store.entity.Delivery;
import by.project.store.entity.Order;
import by.project.store.entity.OrderDetail;
import by.project.store.entity.UserInfo;

@Repository
public class OrderDAOImpl implements OrderDAO {

 
	private static final String STATUS_ORDER_CART = "CART";

	private static final String PRODUCT_QUANTITY_PARAM = "quantityProduct";
	private static final String ORDER_ID_PARAM = "orderId";
	private static final String USER_ID_PARAM = "userId";
	private static final String PRODUCT_ID_PARAM = "productId";
	private static final String PRODUCT_SIZE_PARAM = "productSize";
	private static final String IS_ADD_PRODUCT = "isAddProduct";
	private static final String IS_DELETE_PRODUCT = "isDeleteProduct";

	private static final String CHECKOUT = "checkout";
	private static final String COUNTRY_ADDRESS_PARAM = "country";
	private static final String CITY_ADDRESS_PARAM = "city";
	private static final String STREET_ADDRESS_PARAM = "street";
	private static final String NUMBER_HOUSE_ADDRESS_PARAM = "numberHouse";
	private static final String TYPE_PAYMENT_PARAM = "typePayment";
	private static final String STATUS_PAYMENT_PARAM = "statusPayment";
	private static final String TYPE_DELIVERY_PARAM = "typeDelivery";

 
	private static final String ADD_PRODUCT_TO_CART = "add_product_to_cart";
	private static final String DELETE_PRODUCT_FROM_CART = "delete_product_from_cart";

	private static final String GET_ORDER_HISTORY = "from Order where userInfo.id = :userId and status != 'CART'";

	@Autowired
	private SessionFactory sessionFactory;

	private static final String ORDER_ID = "orderId";
	private static final String USER_ID_P = "userId";

	private static final String IS_READY = "isReady";

	private static final String GET_ORDER_ID = "from Order where users_id_users = :userId and status_order =  'CART'";
	private static final String GET_PRODUCT_IN_ORDER = " from OrderDetail where order.id = :orderId";

	private static final String GET_ORDER_HISTORY_INFO = "from Order where id = :orderId ";
	private static final String PRODUCT_ID_NO_STOCK = "productIdNoStock";
	private static final String PRODUCT_SIZE_NO_STOCK = "productSizeNoStock";

	
	@Override
	public int createOrder(int userId)  {

		Session currentSession = sessionFactory.getCurrentSession();

		UserInfo userInfo = currentSession.get(UserInfo.class, userId);

		Order order = new Order();

		order.setStatus(STATUS_ORDER_CART);
		order.setUserInfo(userInfo);

		currentSession.save(order);
		
		Order ord = (Order) currentSession.createQuery(GET_ORDER_ID, Order.class).setParameter(USER_ID_P, userId)
				.getSingleResult();

		return ord.getId();
	}

	@Override
	public boolean addProductToOrder(int orderId, int productId, int quantityProduct, String productSize)
			 {

		Session currentSession = sessionFactory.getCurrentSession();

		StoredProcedureQuery query = currentSession.createStoredProcedureQuery(ADD_PRODUCT_TO_CART);

		query.registerStoredProcedureParameter(ORDER_ID_PARAM, Integer.class, ParameterMode.IN);
		query.registerStoredProcedureParameter(PRODUCT_ID_PARAM, Integer.class, ParameterMode.IN);
		query.registerStoredProcedureParameter(PRODUCT_QUANTITY_PARAM, Integer.class, ParameterMode.IN);
		query.registerStoredProcedureParameter(PRODUCT_SIZE_PARAM, String.class, ParameterMode.IN);

		query.registerStoredProcedureParameter(IS_ADD_PRODUCT, Boolean.class, ParameterMode.OUT);

		query.setParameter(ORDER_ID_PARAM, orderId);
		query.setParameter(PRODUCT_ID_PARAM, productId);
		query.setParameter(PRODUCT_QUANTITY_PARAM, quantityProduct);
		query.setParameter(PRODUCT_SIZE_PARAM, productSize);

		query.execute();

		return (boolean) query.getOutputParameterValue(IS_ADD_PRODUCT);

	}

	@Override
	public List<OrderDetail> getProductInOrder(int orderId)  {

		Session currentSession = sessionFactory.getCurrentSession();

		Query<OrderDetail> theQuery = currentSession.createQuery(GET_PRODUCT_IN_ORDER, OrderDetail.class);

		List<OrderDetail> orderDetails = theQuery.setParameter(ORDER_ID, orderId).getResultList();

		return orderDetails;

	}

	@Override
	public int getOrderId(int userId)   {

		Session currentSession = sessionFactory.getCurrentSession();

		Order order = (Order) currentSession.createQuery(GET_ORDER_ID, Order.class).setParameter(USER_ID_P, userId)
				.getSingleResult();

		return order.getId();
	}

	@Override
	public boolean removeProductFromOrder(int productId, String productSize, int quantityProduct, int orderId){

		Session currentSession = sessionFactory.getCurrentSession();

		StoredProcedureQuery query = currentSession.createStoredProcedureQuery(DELETE_PRODUCT_FROM_CART);

		query.registerStoredProcedureParameter(PRODUCT_ID_PARAM, Integer.class, ParameterMode.IN);
		query.registerStoredProcedureParameter(PRODUCT_SIZE_PARAM, String.class, ParameterMode.IN);
		query.registerStoredProcedureParameter(PRODUCT_QUANTITY_PARAM, Integer.class, ParameterMode.IN);
		query.registerStoredProcedureParameter(ORDER_ID_PARAM, Integer.class, ParameterMode.IN);

		query.registerStoredProcedureParameter(IS_DELETE_PRODUCT, Boolean.class, ParameterMode.OUT);

		query.setParameter(PRODUCT_ID_PARAM, productId);
		query.setParameter(PRODUCT_SIZE_PARAM, productSize);
		query.setParameter(PRODUCT_QUANTITY_PARAM, quantityProduct);
		query.setParameter(ORDER_ID_PARAM, orderId);

		query.execute();

		return (boolean) query.getOutputParameterValue(IS_DELETE_PRODUCT);

	}

	@Override
	public int addAddressOrder(Address address, int userId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void addPaymentOrder(String typePayment, String statusPayment, int orderId)  {
		// TODO Auto-generated method stub

	}

	@Override
	public int addDeliveryOrder(Delivery delivery, int addressId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public   CheckoutResponce checkout(int orderId, Address address, String typePayment, String statusPayment, String typeDelivery,
			int userId)   {

		Session currentSession = sessionFactory.getCurrentSession();

		StoredProcedureQuery query = currentSession.createStoredProcedureQuery(CHECKOUT);

		query.registerStoredProcedureParameter(ORDER_ID_PARAM, Integer.class, ParameterMode.IN);

		query.registerStoredProcedureParameter(COUNTRY_ADDRESS_PARAM, String.class, ParameterMode.IN);
		query.registerStoredProcedureParameter(CITY_ADDRESS_PARAM, String.class, ParameterMode.IN);
		query.registerStoredProcedureParameter(STREET_ADDRESS_PARAM, String.class, ParameterMode.IN);
		query.registerStoredProcedureParameter(NUMBER_HOUSE_ADDRESS_PARAM, String.class, ParameterMode.IN);

		query.registerStoredProcedureParameter(TYPE_PAYMENT_PARAM, String.class, ParameterMode.IN);
		query.registerStoredProcedureParameter(STATUS_PAYMENT_PARAM, String.class, ParameterMode.IN);
		query.registerStoredProcedureParameter(TYPE_DELIVERY_PARAM, String.class, ParameterMode.IN);

		query.registerStoredProcedureParameter(USER_ID_PARAM, Integer.class, ParameterMode.IN);

		query.registerStoredProcedureParameter(IS_READY, boolean.class, ParameterMode.OUT);
		query.registerStoredProcedureParameter(PRODUCT_ID_NO_STOCK, Integer.class, ParameterMode.OUT);
		query.registerStoredProcedureParameter(PRODUCT_SIZE_NO_STOCK, String.class, ParameterMode.OUT);


		query.setParameter(ORDER_ID_PARAM, orderId);
		query.setParameter(COUNTRY_ADDRESS_PARAM, address.getCountry());
		query.setParameter(CITY_ADDRESS_PARAM, address.getCity());
		query.setParameter(STREET_ADDRESS_PARAM, address.getStreet());
		query.setParameter(NUMBER_HOUSE_ADDRESS_PARAM, address.getNumberHouse());
		query.setParameter(TYPE_PAYMENT_PARAM, typePayment);
		query.setParameter(STATUS_PAYMENT_PARAM, statusPayment);
		query.setParameter(TYPE_DELIVERY_PARAM, typeDelivery);
		query.setParameter(USER_ID_PARAM, userId);

		query.execute();
		
		CheckoutResponce cr = new CheckoutResponce();
		
		cr.setReady((boolean) query.getOutputParameterValue(IS_READY));
		cr.setProductId((int) query.getOutputParameterValue(PRODUCT_ID_NO_STOCK));
		cr.setProductSize((String) query.getOutputParameterValue(PRODUCT_SIZE_NO_STOCK));

	
    return cr;	
	}

	@Override
	public List<Order> getOrderHistory(int userId)   {

		Session currentSession = sessionFactory.getCurrentSession();

		Query<Order> theQuery = currentSession.createQuery(GET_ORDER_HISTORY, Order.class);

		List<Order> groupOrderHistory = theQuery.setParameter(USER_ID_PARAM, userId).getResultList();

		return groupOrderHistory;
	}

	@Override
	public Order getOrderInfo(int orderId)  {
 
		Session currentSession = sessionFactory.getCurrentSession();

		Order orderHistoryInfo  =   currentSession.createQuery(GET_ORDER_HISTORY_INFO, Order.class)
			 .setParameter(ORDER_ID_PARAM, orderId).getSingleResult();
		
		return orderHistoryInfo ;
	}

}
