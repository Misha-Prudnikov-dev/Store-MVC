package by.project.store.dao;

import java.util.List;

import by.project.store.entity.Category;
import by.project.store.entity.Favorites;
import by.project.store.entity.Manufacturer;
import by.project.store.entity.Product;
import by.project.store.entity.ProductInfo;
import by.project.store.entity.ProductImage;
import by.project.store.entity.ProductSize;
import by.project.store.entity.Review;
import by.project.store.entity.Subcategory;

public interface ProductDAO {

	List<Category> getAllCategory() ;

	List<Subcategory> getSubcategoryByIdCategory(int idCategory) ;

	List<Product> getGroupProductByIdSubcategory(int idSubcategory) ;

	ProductInfo getProductById(int idProduct)  ;

	boolean checkProductFavorites(int userId, int productId)  ;

	List<Review> getReviewByIdProduct(int idProduct) ;

	List<ProductImage> getGroupProductImageByIdProduct(int idProduct)  ;

	List<ProductSize> getGroupProductSize(int idProduct) ;

	void addReviewProduct(Review review) ;

	void addProductFavorites(Favorites favorites)  ;

	void deleteProductFavorites(int userId, int productId)  ;

	List<Favorites> getProductFavorites(int userId)  ;

	List<ProductInfo> getProductByManufacturerId(int manufacturerId) ;

	Manufacturer getManufacturerById(int manufacturerId)  ;

	void deleteReviewProduct(int userId, int productId, String statusReview) ;

	List<Product> searchProduct(String searchLine)  ;

	List<Product> recommendBuyWithProduct() ;
	
	void addProduct(Product product);
}
