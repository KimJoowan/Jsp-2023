/**===================================================
* 작성자 DIT
* 작성일 2023. 5. 23.
* 파일명 Boarddto.java
* 파일명 프로그램설명
 =============================================================**/
package dit.cs;

import java.sql.Date;

import javax.naming.Context;

/**
 * @author DIT
 *
 */
public class Boarddto {
    private int BCODE;
    private String SUBJECT;
    private String CONTENT;
    private String WRITER;
    private Date REGDATE;
    
    // Default constructor
    public Boarddto() {}
    
    // Getters and Setters
    public int getBCODE() {
        return BCODE;
    }
    
    public void setBCODE(int BCODE) {
        this.BCODE = BCODE;
    }
    
    public String getSUBJECT() {
        return SUBJECT;
    }
    
    public void setSUBJECT(String SUBJECT) {
        this.SUBJECT = SUBJECT;
    }
    
    public String getCONTENT() {
        return CONTENT;
    }
    
    public void setCONTENT(String CONTENT) {
        this.CONTENT = CONTENT;
    }
    
    public String getWRITER() {
        return WRITER;
    }
    
    public void setWRITER(String WRITER) {
        this.WRITER = WRITER;
    }
    
    public Date getREGDATE() {
        return REGDATE;
    }

    public void setREGDATE(Date REGDATE) {
        this.REGDATE = REGDATE;
    }

    public Boarddto(int BCODE, String SUBJECT, String CONTENT ,String WRITER,Date REGDATE) {
    	this.BCODE = BCODE;
        this.SUBJECT = SUBJECT;
        this.CONTENT = CONTENT;
        this.WRITER = WRITER;
        this.REGDATE = REGDATE;
    }
    
    // 등록
    public Boarddto(String SUBJECT, String CONTENT, String WRITER, Date REGDATE) {
        this.SUBJECT = SUBJECT;
        this.CONTENT = CONTENT;
        this.WRITER = WRITER;
        this.REGDATE = REGDATE;
    }

    
    //수정
    public Boarddto(String SUBJECT,String CONTENT,Date REGDATE,int BCODE) {
    	this.SUBJECT = SUBJECT;
        this.CONTENT = CONTENT;
        this.REGDATE = REGDATE;
        this.BCODE = BCODE;
    }
    
    public Boarddto(int Bcode,String SUBJECT,String WRITER,Date REGDATE) {
    	this.BCODE = Bcode;
        this.SUBJECT = SUBJECT;
        this.WRITER = WRITER;
        this.REGDATE = REGDATE;
    	
    	
    	
    }
   
}

