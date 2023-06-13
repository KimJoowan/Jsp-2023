/**===================================================
* 작성자 DIT
* 작성일 2023. 5. 10.
* 파일명 Logindto.java
* 프로그램설명 : 
* 		- DB의 로그인 테이블에 테이터을 처리하기위한 클래스
* 		- 데이터베이스 에서 검색해온 대이터를 넣어	 전달	한다.
 =============================================================**/
package dit.cs;

public class Logindto{
	private String id;
	private String name;
	private String pwd;
	private String gender;
	private String phone;
	private String email;
	
	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getId() {
		return id;
	}
	
	public void setId(String id) {
		this.id = id;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getPwd() {
		return pwd;
	}
	
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	
	public Logindto() {}
	
	public Logindto(String id, String pwd){
		this.id = id;
		this.pwd = pwd;
	}
	
	public Logindto(String id, String name, String pwd, String phone, String email){
		this.id = id;
		this.name = name;
		this.pwd = pwd;
		this.phone = phone;
		this.email = email;
	}
	
	public Logindto(String id, String name, String pwd, String gender, String phone, String email){
		this.id = id;
		this.name = name;
		this.pwd = pwd;
		this.gender = gender;
		this.phone = phone;
		this.email = email;
	}

	
	
	

}
