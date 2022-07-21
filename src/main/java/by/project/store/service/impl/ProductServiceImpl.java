package by.project.store.service.impl;

import java.util.List;

import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import by.project.store.dao.ProductDAO;
import by.project.store.entity.Category;
import by.project.store.entity.Favorites;
import by.project.store.entity.Manufacturer;
import by.project.store.entity.Product;
import by.project.store.entity.ProductInfo;
import by.project.store.entity.ProductImage;
import by.project.store.entity.ProductSize;
import by.project.store.entity.Review;
import by.project.store.entity.Subcategory;
import by.project.store.service.ProductService;
import by.project.store.service.ServiceException;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductDAO productDAO;

	@Override
	@Transactional
	public List<Category> getAllCategory() {

		List<Category> categories = productDAO.getAllCategory();

		return categories;
	}

	@Override
	@Transactional
	public List<Subcategory> getSubcategoryByIdCategory(int idCategory) {

		List<Subcategory> subcategories = productDAO.getSubcategoryByIdCategory(idCategory);

		return subcategories;
	}

	@Override
	@Transactional
	public List<Product> getGroupProductByIdSubcategory(int idSubcategory) {

		List<Product> products = productDAO.getGroupProductByIdSubcategory(idSubcategory);

		return products;
	}

	@Override
	@Transactional
	public ProductInfo getProductById(int idProduct) {

		ProductInfo product = productDAO.getProductById(idProduct);

		Hibernate.initialize(product.getProductSize());

		return product;
	}

	@Override
	@Transactional
	public List<ProductImage> getGroupProductImageByIdProduct(int idProduct) {

		List<ProductImage> productImages = productDAO.getGroupProductImageByIdProduct(idProduct);

		return productImages;
	}

	@Override
	@Transactional
	public List<ProductSize> getGroupProductSize(int idProduct) {

		List<ProductSize> productSizes = productDAO.getGroupProductSize(idProduct);

		return productSizes;
	}

	@Override
	@Transactional
	public List<Review> getReviewByIdProduct(int idProduct) {

		return productDAO.getReviewByIdProduct(idProduct);
	}

	@Override
	@Transactional
	public boolean addReviewProduct(Review review) {

		productDAO.addReviewProduct(review);

		return true;
	}

	@Override
	@Transactional
	public void addProductFavorites(Favorites favorites) {

		productDAO.addProductFavorites(favorites);

	}

	@Override
	@Transactional
	public boolean checkProductFavorites(int userId, int productId) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	@Transactional
	public void deleteProductFavorites(int userId, int productId) {

		productDAO.deleteProductFavorites(userId, productId);

	}

	@Override
	@Transactional
	public List<Favorites> getProductFavorites(int userId) {

		return productDAO.getProductFavorites(userId);
	}

	@Override
	@Transactional
	public List<ProductInfo> getProductByManufacturerId(int manufacturerId) {

		return productDAO.getProductByManufacturerId(manufacturerId);
	}

	@Override
	@Transactional
	public Manufacturer getManufacturerById(int manufacturerId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	@Transactional
	public int checkProductQuantiyInStock(int productId, String productSize) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	@Transactional
	public void updateProductQuantity(int productId, int quantityProduct, String productSize) {
		// TODO Auto-generated method stub

	}

	@Override
	@Transactional
	public void deleteReviewProduct(int userId, int productId, String statusReview) {
		// TODO Auto-generated method stub

	}

	@Override
	@Transactional
	public List<Product> searchProduct(String searchLine) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	@Transactional
	public void addProduct(Product product) {

		productDAO.addProduct(product);

	}

}
