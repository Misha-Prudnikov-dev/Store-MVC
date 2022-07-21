package by.project.store.entity;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "favorites")
public class Favorites implements Serializable {

	private static final long serialVersionUID = 8125320956949264116L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_favorites")
	private int id;

	@ManyToOne(cascade = { CascadeType.DETACH, CascadeType.PERSIST, CascadeType.MERGE, CascadeType.REFRESH })
	@JoinColumn(name = "users_id_users")
	private UserShort userShort;

	@ManyToOne(cascade = { CascadeType.DETACH, CascadeType.PERSIST, CascadeType.MERGE, CascadeType.REFRESH })
	@JoinColumn(name = "products_id_products")
	private Product product;

	public Favorites() {

	}

	public Favorites(UserShort userShort, Product  product) {
		this.userShort = userShort;
		this.product = product;

	}

	public Favorites(int id, UserShort userShort, Product product) {
		this.id = id;
		this.userShort = userShort;
		this.product = product;

	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public UserShort getUserShort() {
		return userShort;
	}

	public void setUserShort(UserShort userShort) {
		this.userShort = userShort;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + id;
		result = prime * result + ((product == null) ? 0 : product.hashCode());
		result = prime * result + ((userShort == null) ? 0 : userShort.hashCode());
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
		Favorites other = (Favorites) obj;
		if (id != other.id)
			return false;
		if (product == null) {
			if (other.product != null)
				return false;
		} else if (!product.equals(other.product))
			return false;
		if (userShort == null) {
			if (other.userShort != null)
				return false;
		} else if (!userShort.equals(other.userShort))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Favorites [id=" + id + ", userShort=" + userShort + ", product=" + product + "]";
	}

 

}
