package by.project.store.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.Type;

@Entity
@Table(name = "products")
public class ProductInfo implements Serializable {

	private static final long serialVersionUID = -8605672012523574042L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_products")
	private int id;

	@Column(name = "title_products")
	private String title;

	@Column(name = "description_products")
	private String description;

	@Column(name = "image_products")
	private String image;
	
	@Column(name = "color_products")
	private String color;

	@Column(name = "year_products")
	private int year;

	@Column(name = "quantity_products")
	private int quantity;

	@Column(name = "price_products")
	private double price;

	@Column(name = "date_add_products")
	private Date dateAddProduct;
	
	@OneToMany(mappedBy="product" , cascade = {CascadeType.DETACH,CascadeType.PERSIST,CascadeType.MERGE,CascadeType.REFRESH},fetch = FetchType.LAZY)
	private List<Review> review;

	@ManyToOne(cascade = { CascadeType.DETACH, CascadeType.PERSIST, CascadeType.MERGE, CascadeType.REFRESH })
	@JoinColumn(name = "manufacturer_id_manufacturer")
	private Manufacturer manufacturer;

	@ManyToOne(cascade = { CascadeType.DETACH, CascadeType.PERSIST, CascadeType.MERGE, CascadeType.REFRESH })
	@JoinColumn(name = "subcategories_id_subcategories")
	private Subcategory subcategory;

	@OneToMany(mappedBy = "product", cascade = { CascadeType.DETACH, CascadeType.PERSIST, CascadeType.MERGE,
			CascadeType.REFRESH }, fetch = FetchType.LAZY)
	private List<ProductSize> productSize;

	@OneToMany(mappedBy = "product", cascade = { CascadeType.DETACH, CascadeType.PERSIST, CascadeType.MERGE,
			CascadeType.REFRESH }, fetch = FetchType.EAGER)
	private List<ProductImage> productImages;

	public ProductInfo() {

	}

	public ProductInfo(int id, String title, String description,String image, String color, int year, int quantity, double price,
			List<Review> review, Date dateAddProduct, Manufacturer manufacturer, Subcategory subcategory, List<ProductImage> productImages,
			List<ProductSize> productSize) {

		this.id = id;
		this.title = title;
		this.description = description;
		this.image = image;
		this.color = color;
		this.price = price;
		this.quantity = quantity;
		this.year = year;
		this.review = review;
		this.dateAddProduct = dateAddProduct;
		this.manufacturer = manufacturer;
		this.subcategory = subcategory;
		this.productImages = productImages;
		this.productSize = productSize;

	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public List<Review> getReview() {
		return review;
	}

	public void setReview(List<Review> review ) {
		this.review = review;
	}

	public Date getDateAddProduct() {
		return dateAddProduct;
	}

	public void setDateAddProduct(Date dateAddProduct) {
		this.dateAddProduct = dateAddProduct;
	}

	public Manufacturer getManufacturer() {
		return manufacturer;
	}

	public void setManufacturer(Manufacturer manufacturer) {
		this.manufacturer = manufacturer;
	}

	public Subcategory getSubcategory() {
		return subcategory;
	}

	public void setSubcategory(Subcategory subcategory) {
		this.subcategory = subcategory;
	}

	public List<ProductImage> getProductImages() {
		return productImages;
	}

	public void setProductImages(List<ProductImage> productImages) {
		this.productImages = productImages;
	}

	public List<ProductSize> getProductSize() {
		return productSize;
	}

	public void setProductSize(List<ProductSize> productSize) {
		this.productSize = productSize;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((color == null) ? 0 : color.hashCode());
		result = prime * result + ((dateAddProduct == null) ? 0 : dateAddProduct.hashCode());
		result = prime * result + ((description == null) ? 0 : description.hashCode());
		result = prime * result + id;
		result = prime * result + ((image == null) ? 0 : image.hashCode());
		result = prime * result + ((manufacturer == null) ? 0 : manufacturer.hashCode());
		long temp;
		temp = Double.doubleToLongBits(price);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		result = prime * result + ((productImages == null) ? 0 : productImages.hashCode());
		result = prime * result + ((productSize == null) ? 0 : productSize.hashCode());
		result = prime * result + quantity;
		result = prime * result + ((review == null) ? 0 : review.hashCode());
		result = prime * result + ((subcategory == null) ? 0 : subcategory.hashCode());
		result = prime * result + ((title == null) ? 0 : title.hashCode());
		result = prime * result + year;
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ProductInfo other = (ProductInfo) obj;
		if (color == null) {
			if (other.color != null)
				return false;
		} else if (!color.equals(other.color))
			return false;
		if (dateAddProduct == null) {
			if (other.dateAddProduct != null)
				return false;
		} else if (!dateAddProduct.equals(other.dateAddProduct))
			return false;
		if (description == null) {
			if (other.description != null)
				return false;
		} else if (!description.equals(other.description))
			return false;
		if (id != other.id)
			return false;
		if (image == null) {
			if (other.image != null)
				return false;
		} else if (!image.equals(other.image))
			return false;
		if (manufacturer == null) {
			if (other.manufacturer != null)
				return false;
		} else if (!manufacturer.equals(other.manufacturer))
			return false;
		if (Double.doubleToLongBits(price) != Double.doubleToLongBits(other.price))
			return false;
		if (productImages == null) {
			if (other.productImages != null)
				return false;
		} else if (!productImages.equals(other.productImages))
			return false;
		if (productSize == null) {
			if (other.productSize != null)
				return false;
		} else if (!productSize.equals(other.productSize))
			return false;
		if (quantity != other.quantity)
			return false;
		if (review == null) {
			if (other.review != null)
				return false;
		} else if (!review.equals(other.review))
			return false;
		if (subcategory == null) {
			if (other.subcategory != null)
				return false;
		} else if (!subcategory.equals(other.subcategory))
			return false;
		if (title == null) {
			if (other.title != null)
				return false;
		} else if (!title.equals(other.title))
			return false;
		if (year != other.year)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "ProductInfo [id=" + id + ", title=" + title + ", description=" + description + ", image=" + image
				+ ", color=" + color + ", year=" + year + ", quantity=" + quantity + ", price=" + price
				+ ", dateAddProduct=" + dateAddProduct + ", review=" + review + ", manufacturer=" + manufacturer
				+ ", subcategory=" + subcategory + ", productSize=" + productSize + ", productImages=" + productImages
				+ "]";
	}

 

}
