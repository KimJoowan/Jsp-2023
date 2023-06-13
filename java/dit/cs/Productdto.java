/**===================================================
* 작성자 DIT
* 작성일 2023. 6. 13.
* 파일명 Productdto.java
* 파일명 프로그램설명
 =============================================================**/
package dit.cs;

/**
 * @author DIT
 *
 */
public class Productdto{
	private String ProductName;
	private String price;
	
	public String getProductName() {
		return ProductName;
	}
	
	public void setProductName(String productName) {
		ProductName = productName;
	}
	
	public String getPrice() {
		return price;
	}
	
	
	
	public void setPrice(String price) {
		this.price = price;
	}
	
	public  Productdto(){}
	
	
	public Productdto(String ProductName,String price){
		this.ProductName = ProductName;
		this.price = price;
	}
	
	

}
