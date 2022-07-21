package by.project.store.service;

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

public interface ProductService {

	List<Category> getAllCategory();
	
	List<Subcategory> getSubcategoryByIdCategory(int idCategory)throws ServiceException;
	
	List<Product> getGroupProductByIdSubcategory(int idSubcategory)throws ServiceException;
	
	ProductInfo getProductById(int idProduct)throws ServiceException;
		
	List<ProductImage> getGroupProductImageByIdProduct(int idProduct);
	
	List<ProductSize> getGroupProductSize(int idProduct);
	
	List<Review> getReviewByIdProduct(int idProduct);

	boolean addReviewProduct(Review review);
	
	void addProductFavorites(Favorites favorites);
	
	boolean checkProductFavorites(int userId,int productId);
	
	void deleteProductFavorites(int userId,int productId);
	
	List<Favorites> getProductFavorites(int userId);
	
	List<ProductInfo> getProductByManufacturerId(int manufacturerId);

	Manufacturer getManufacturerById(int manufacturerId);
	
	int checkProductQuantiyInStock(int productId,String productSize);
	
	void updateProductQuantity(int productId, int quantityProduct,String productSize);
	
	void deleteReviewProduct(int userId,int productId,String statusReview);

	List<Product> searchProduct(String searchLine);

	void addProduct(Product product);

}
