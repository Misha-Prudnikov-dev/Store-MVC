package by.project.store.controller;

import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import by.project.store.dao.OrderDAO;
import by.project.store.dao.ProductDAO;
import by.project.store.dao.UserDAO;
import by.project.store.dao.impl.ProductDAOImpl;
import by.project.store.dao.util.EmailSending;
import by.project.store.entity.Address;
import by.project.store.entity.CheckoutResponce;
import by.project.store.entity.Delivery;
import by.project.store.entity.DeliveryStatus;
import by.project.store.entity.Favorites;
import by.project.store.entity.Order;
import by.project.store.entity.OrderDetail;
import by.project.store.entity.Product;
import by.project.store.entity.Review;
import by.project.store.entity.UserShort;
import by.project.store.entity.UserInfo;
import by.project.store.service.InvalidInputServiceException;
import by.project.store.service.NoResultServiceException;
import by.project.store.service.OrderService;
import by.project.store.service.PasswordAlreadyExistsServiceException;
import by.project.store.service.ProductService;
import by.project.store.service.ServiceException;
import by.project.store.service.UserService;

import org.apache.log4j.Logger;

@Controller
@RequestMapping("/")
public class MainController {

	private static final String USER_SHORT = "userShort";
	private static final String USER_INFO = "userInfo";
	private static final String ORDER_ID = "id_order";
	private static final String GROUP_PRODUCT_IN_CART = "groupProductCart";
	private static final String GROUP_PRODUCT = "groupProduct";
	private static final String SUBCATEGORY_ID = "subcategory";
	private static final String CATEGORY_ID = "categoryId";
	private static final String GROUP_SUBCATEGORY = "groupSubcategory";
	private static final String PRODUCT_ID = "productId";
	private static final String PRODUCT_INFO = "productInfo";
	private static final String GROUP_CATEGORY = "groupCategory";
	private static final String QUANTITY_PRODUCT = "quantityProduct";
	private static final String LAST_REQUEST = "lastRequest";
	private static final String TEXT_REVIEW = "text";
	private static final String RATING_REVIEW = "rating";

	private static final Logger logger = Logger.getLogger(ProductDAOImpl.class);
	private static final String PRODUCT_SIZE = "productSize";
	private static final String REVIEWS = "reviews";
	private static final String STATUS_REVIEW_ACTIVE = "ACTIVE";
	private static final String DATE_DELIVERY = "dateDelivery";
	private static final String DATE_PATTERN = "yyyy-MM-dd";

	private static final String COUNTRY_DEFULT = "BELARUS";
	private static final String USER_STREET = "street";
	private static final String USER_CITY = "city";
	private static final String USER_NUMBER_HOUSE = "numberHouse";

	private static final String ACTIVE = "ACTIVE";
	private static final String TO_THE_DOOR = "ToTheDoor";
	private static final String TYPE_PAYMENT_USER = "typePayment";
	private static final String STATUS_PAYMENT_USER = "notPayment";

	private static final String STATUS_ORDER_ORDER = "ORDER";
	private static final String NOT_PAID = "notPaid";
	private static final String ORDER_GROUP = "groupOrder";
	private static final String ORDER = "order";
	private static final String SIGN_IN_ATTR = "signIn";
	private static final String FAIL_VALUE = "fail";
	private static final String FAIL_NOT_FOUND_VALUE = "fail";
	private static final String REGISTRATION_ATTR = "registration";
	private static final String FAIL_INVALID_INPUT_VALUE = "invalid_input";
	private static final String FAIL_DUBLICATE_PASSWORD = "duplicate";

	private static final String ADD_REVIEW_ATTR = "add_review";
	private static final String FAIL_VALUE_EMPTY = "v_empty";

	private static final String CHECKOUT_ATTR = "checkout";
	private static final String SUCCESS_CHECKOUT = "success";
	private static final String CHECKOUT_RESPONCE = "checkoutResponce";
	private static final String GROUP_PRODUCT_FAVORITES = "groupProductFavorites";
	private static final String MANUFACTURER_ID = "manufacturerId";
	private static final String GROUP_PRODUCT_MANUFACTURER = "groupProductManufacturer";
	private static final String UPDATE_USER_ATTR = "updateUser";
	private static final String NAME_FILE_EMAIL = "em.html";
	private static final String SUBJECT_EMAIL = "Hey :) ";
	private static final String LOCAL_ATTR = "local";

	private UserService userService;
	private ProductService productService;
	private OrderService orderService;
	private EmailSending emailSending;

	@Autowired
	public MainController(UserService userService, ProductService productService, OrderService orderService,
			EmailSending emailSending) {
		this.userService = userService;
		this.productService = productService;
		this.orderService = orderService;
		this.emailSending = emailSending;

	}

	@RequestMapping("/showMainPage")
	public String showMainPage(HttpSession session, Principal principal) {

		if (session.getAttribute(GROUP_CATEGORY) == null) {

			session.setAttribute(GROUP_CATEGORY, productService.getAllCategory());

		}

		return "main_page";
	}

	@RequestMapping("/showCart")
	public String showCartPage(HttpSession session, Model theModel, Principal principal) {

		if (principal == null) {

			return "redirect:/showSignIn";
		}
		try {

			SimpleDateFormat sdf = new SimpleDateFormat(DATE_PATTERN);
			Calendar calendar = Calendar.getInstance();
			calendar.add(Calendar.DATE, 4);

			theModel.addAttribute(DATE_DELIVERY, (String) (sdf.format(calendar.getTime())));
			session.setAttribute(GROUP_PRODUCT_IN_CART,
					orderService.getProductInOrder((int) session.getAttribute(ORDER_ID)));

		} catch (ServiceException e) {
			logger.error("Error showCartPage");
			throw new ControllerRuntimeException(e);
		}
		return "Cart";
	}

	@RequestMapping("/deleteProductFromCart")
	public String deleteProductFromCart(@RequestParam(PRODUCT_ID) int idProduct,
			@RequestParam(PRODUCT_SIZE) String productSize, HttpSession session, Principal principal) {

		if (principal == null) {

			return "redirect:/showSignIn";
		}

		orderService.removeProductFromOrder(idProduct, productSize, 1, (int) session.getAttribute(ORDER_ID));

		return "redirect:/showCart";
	}

	@RequestMapping("/showSignIn")
	public String showSignIn() {

		return "SignIn";

	}

	@RequestMapping("/login")
	public String login(HttpSession session, RedirectAttributes redirectAttributes, Principal principal) {

		try {
			UserShort userShort = userService.getUserByLogin(principal.getName());
			session.setAttribute(ORDER_ID, orderService.getOrderId(userShort.getId()));
			session.setAttribute(USER_SHORT, userShort);

		} catch (NoResultServiceException e) {
			redirectAttributes.addAttribute(SIGN_IN_ATTR, FAIL_NOT_FOUND_VALUE);
			return "redirect:/showSignIn";
		}

		return "redirect:/showMainPage";
	}

	@RequestMapping("/logout")
	public String signOut(HttpSession session, HttpServletRequest request, HttpServletResponse response) {

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null) {
			new SecurityContextLogoutHandler().logout(request, response, auth);
		}

		return "main_page";
	}

	@RequestMapping("/showRegistration")
	public String showRegistration(Model theModel) {

		UserInfo userInfo = new UserInfo();

		theModel.addAttribute(USER_INFO, userInfo);

		return "Registration";
	}

	@RequestMapping("/registration")
	public String registration(@ModelAttribute(USER_INFO) UserInfo userInfo, Model model,
			RedirectAttributes redirectAttributes) {

		try {

			if (!userService.registration(userInfo)) {

				redirectAttributes.addAttribute(REGISTRATION_ATTR, FAIL_DUBLICATE_PASSWORD);
				return "redirect:/showRegistration";
			}
			orderService.createOrder(userInfo.getId());

		//	emailSending.sendMail(Arrays.asList(userInfo.getEmail()), SUBJECT_EMAIL, NAME_FILE_EMAIL);

		} catch (InvalidInputServiceException e) {
			redirectAttributes.addAttribute(REGISTRATION_ATTR, FAIL_INVALID_INPUT_VALUE);
			return "redirect:/showRegistration";
		}

		return "redirect:/showMainPage";

	}

	@RequestMapping("/subcategory")
	public String subcategory(@RequestParam(CATEGORY_ID) int id, HttpSession session) {

		try {

			session.setAttribute(GROUP_SUBCATEGORY, productService.getSubcategoryByIdCategory(id));
		} catch (ServiceException e) {
			logger.error("Error show subcategory");
			throw new ControllerRuntimeException(e);
		}

		return "Subcategory";
	}

	@RequestMapping("/groupProductBySubcategory")
	public String groupProductBySubcategory(@RequestParam(SUBCATEGORY_ID) int id, HttpSession session) {

		try {
			session.setAttribute(GROUP_PRODUCT, productService.getGroupProductByIdSubcategory(id));
		} catch (ServiceException e) {
			logger.error("Error show group product by subcategory");
			throw new ControllerRuntimeException(e);
		}

		return "GroupProduct";
	}

	@RequestMapping("/showProductInfo")
	public String showProductInfo(@RequestParam(PRODUCT_ID) int id, HttpSession session, Model theModal) {

		try {
			theModal.addAttribute(PRODUCT_INFO, productService.getProductById(id));
			theModal.addAttribute(REVIEWS, productService.getReviewByIdProduct(id));

		} catch (ServiceException e) {
			logger.error("Error show product info");
			throw new ControllerRuntimeException(e);
		}

		return "ProductInfo";
	}

	@RequestMapping("/showUserInfo")
	public String showUserInfo(HttpSession session, Model theModel, Principal principal) {

		if (principal == null) {

			return "redirect:/showSignIn";
		}

		UserShort userShort = (UserShort) session.getAttribute(USER_SHORT);

		theModel.addAttribute(USER_INFO, userService.getUserInfo(userShort.getId()));

		return "UserProfile";
	}

	@RequestMapping("/updateUser")
	public String updateUser(@ModelAttribute(USER_INFO) UserInfo userInfo, HttpSession session,
			RedirectAttributes redirectAttributes) {

		UserShort userShort = (UserShort) session.getAttribute(USER_SHORT);
		userInfo.setId(userShort.getId());

		try {
			userService.changeUserInfo(userInfo);
		} catch (InvalidInputServiceException e) {
			redirectAttributes.addAttribute(UPDATE_USER_ATTR, FAIL_DUBLICATE_PASSWORD);
			return "redirect:/showUserInfo";
		}

		return "redirect:/showUserInfo";
	}

	@RequestMapping("/addToCart")
	public String addToCart(@RequestParam(PRODUCT_ID) int idProduct,
			@RequestParam(QUANTITY_PRODUCT) int quantityProduct, @RequestParam(PRODUCT_SIZE) String productSize,
			HttpSession session, Principal principal) {

		if (principal == null) {

			return "redirect:/showSignIn";
		}

		orderService.addProductToOrder((int) session.getAttribute(ORDER_ID), idProduct, quantityProduct, productSize);

		return "redirect:" + session.getAttribute(LAST_REQUEST).toString();
	}

	@RequestMapping("/addReview")
	public String addReview(@RequestParam(PRODUCT_ID) int idProduct, @RequestParam(TEXT_REVIEW) String text,
			@RequestParam(RATING_REVIEW) byte rating, HttpSession session, RedirectAttributes redirectAttributes,
			Principal principal) {

		if (principal == null) {

			return "redirect:/showSignIn";
		}

		if (rating < 1 || rating > 5 || text == null || text.isEmpty()) {

			redirectAttributes.addAttribute(ADD_REVIEW_ATTR, FAIL_VALUE_EMPTY);
			return "redirect:" + session.getAttribute(LAST_REQUEST).toString();
		}

		UserShort userShort = (UserShort) session.getAttribute(USER_SHORT);

		Product product = new Product();
		product.setId(idProduct);

		Review review = new Review();
		review.setProduct(product);
		review.setRating(rating);
		review.setStatus(STATUS_REVIEW_ACTIVE);
		review.setText(text);
		review.setDateAddReview(new Date());
		review.setUserShort(userShort);

		productService.addReviewProduct(review);

		return "redirect:" + session.getAttribute(LAST_REQUEST).toString();
	}

	@RequestMapping("/checkout")
	public String checkout(@RequestParam(TYPE_PAYMENT_USER) String typePayment, @RequestParam(USER_CITY) String city,
			@RequestParam(USER_STREET) String street, @RequestParam(USER_NUMBER_HOUSE) String numberHouse,
			HttpSession session, RedirectAttributes redirectAttributes, HttpServletRequest request,
			Principal principal) {

		if (principal == null) {

			return "redirect:/showSignIn";
		}

		UserShort userShort = (UserShort) session.getAttribute(USER_SHORT);

		if (typePayment == null || typePayment.isEmpty() || city == null || city.isEmpty() || street == null
				|| street.isEmpty() || numberHouse == null || numberHouse.isEmpty()) {

			redirectAttributes.addAttribute(CHECKOUT_ATTR, FAIL_VALUE_EMPTY);

			return "redirect:/showCart";

		}

		int orderId = (int) session.getAttribute(ORDER_ID);

		Address address = new Address();
		address.setCountry(COUNTRY_DEFULT);
		address.setCity(city);
		address.setStreet(street);
		address.setNumberHouse(numberHouse);

		CheckoutResponce cr = orderService.checkout(orderId, address, typePayment, NOT_PAID, TO_THE_DOOR,
				userShort.getId());

		if (cr.isReady) {
			session.setAttribute(ORDER_ID, orderService.createOrder(userShort.getId()));
		}

		request.setAttribute(CHECKOUT_RESPONCE, cr);
		redirectAttributes.addAttribute(CHECKOUT_ATTR, SUCCESS_CHECKOUT);

		return "redirect:/showCart";
	}

	@RequestMapping("/showOrderHistory")
	public String showOrderHistory(HttpSession session, Model theModel, Principal principal) {

		if (principal == null) {

			return "redirect:/showSignIn";
		}

		UserShort userShort = (UserShort) session.getAttribute(USER_SHORT);
		session.setAttribute(ORDER_GROUP, orderService.getOrderHistory(userShort.getId()));

		return "OrderHistory";
	}

	@RequestMapping("/showOrderHistoryInfo")
	public String showOrderHistoryInfo(@RequestParam(ORDER_ID) int orderId, HttpSession session, Principal principal) {

		if (principal == null) {

			return "redirect:/showSignIn";
		}

		Order order = orderService.getOrderInfo(orderId);

		session.setAttribute(ORDER, order);

		return "OrderInfo";
	}

	@RequestMapping("/addProductFavorites")
	public String addProductFavorites(@RequestParam(PRODUCT_ID) int productId, HttpSession session,
			Principal principal) {

		if (principal == null) {

			return "redirect:/showSignIn";
		}

		UserShort userShort = (UserShort) session.getAttribute(USER_SHORT);

		Product product = new Product();
		product.setId(productId);

		productService.addProductFavorites(new Favorites(userShort, product));

		return "redirect:" + session.getAttribute(LAST_REQUEST).toString();
	}

	@RequestMapping("/deleteProductFavorites")
	public String deleteProductFavorites(@RequestParam(PRODUCT_ID) int productId, HttpSession session,
			Principal principal) {

		if (principal == null) {

			return "redirect:/showSignIn";
		}

		UserShort userShort = (UserShort) session.getAttribute(USER_SHORT);

		productService.deleteProductFavorites(userShort.getId(), productId);

		return "redirect:" + session.getAttribute(LAST_REQUEST).toString();
	}

	@RequestMapping("/showFvorites")
	public String getGroupFavorites(HttpSession session, Principal principal) {

		if (principal == null) {

			return "redirect:/showSignIn";
		}

		UserShort userShort = (UserShort) session.getAttribute(USER_SHORT);

		session.setAttribute(GROUP_PRODUCT_FAVORITES, productService.getProductFavorites(userShort.getId()));

		return "Favorites";
	}

	@RequestMapping("/GroupProductByManufacturer")
	public String getGroupProductByManufacturer(@RequestParam(MANUFACTURER_ID) int manufacturerId,
			HttpSession session) {

		session.setAttribute(GROUP_PRODUCT_MANUFACTURER, productService.getProductByManufacturerId(manufacturerId));

		return "GroupProductManufacturer";
	}

	@RequestMapping(value = "/changeLocale")
	public String changeLocal(HttpSession session, @RequestParam(LOCAL_ATTR) String local) {
		session.setAttribute(LOCAL_ATTR, local);

		if (session.getAttribute(LAST_REQUEST) != null) {
			return "redirect:" + session.getAttribute(LAST_REQUEST).toString();
		} else {
			return "redirect:/showMainPage";
		}
	}

	@RequestMapping("/goToAddProduct")
	public String goToAddProductPage() {

		return "addProduct";
	}

	public String addProduct() {

		return "";
	}

}
