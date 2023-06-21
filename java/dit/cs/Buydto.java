package dit.cs;

public class Buydto {
	private String ProductName;
	private int counts;
	private String  id;
	
	public String getProductName() {
		return ProductName;
	}
	
	public void setProductName(String productName) {
		ProductName = productName;
	}
	
	public int getCounts() {
		return counts;
	}
	
	public void setCounts(int counts) {
		this.counts = counts;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Buydto(String ProductName, int counts, String id) {
		this.ProductName = ProductName;
		this.counts = counts;
		this.id = id;
		
	}
	
	public Buydto(String ProductName, int counts) {
		this.ProductName = ProductName;
		this.counts = counts;
		
	}
	
	
	
	
	
	
	
	
	
	
	
}
