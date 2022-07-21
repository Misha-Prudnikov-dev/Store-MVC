package by.project.store.entity;

import java.io.Serializable;

public class CheckoutResponce implements Serializable{

 
	private static final long serialVersionUID = 8983859843358894247L;
	
	public int productId;
	public String productSize;
	public boolean isReady;
	
	public CheckoutResponce(){
		
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public String getProductSize() {
		return productSize;
	}

	public void setProductSize(String productSize) {
		this.productSize = productSize;
	}

	public boolean isReady() {
		return isReady;
	}

	public void setReady(boolean isReady) {
		this.isReady = isReady;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + (isReady ? 1231 : 1237);
		result = prime * result + productId;
		result = prime * result + ((productSize == null) ? 0 : productSize.hashCode());
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
		CheckoutResponce other = (CheckoutResponce) obj;
		if (isReady != other.isReady)
			return false;
		if (productId != other.productId)
			return false;
		if (productSize == null) {
			if (other.productSize != null)
				return false;
		} else if (!productSize.equals(other.productSize))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "CheckoutResponce [productId=" + productId + ", productSize=" + productSize + ", isReady=" + isReady
				+ "]";
	}
	
}
