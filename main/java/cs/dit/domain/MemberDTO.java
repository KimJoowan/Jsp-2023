package cs.dit.domain;

import lombok.Data;

@Data
public class MemberDTO {
	private String id,pwd,newpwd,email,name,address,phonenumber;
	private int number;
	
}
