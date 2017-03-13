package dong.shopping.pojo;

/**
 * Category entity. @author MyEclipse Persistence Tools
 */

public class Category  implements java.io.Serializable {


    // Fields    

     /**
	 * 
	 */
	private static final long serialVersionUID = -6696475528044664986L;
	private Integer cid;
	private Account account;
     private String ctype;
     private Boolean chot;
    
     public Integer getCid() {
 		return cid;
 	}

 	public void setCid(Integer cid) {
 		this.cid = cid;
 	}
    public Account getAccount() {
        return account;
    }
    
    public void setAccount(Account account) {
        this.account = account;
    }

    public String getCtype() {
        return this.ctype;
    }
    
    public void setCtype(String ctype) {
        this.ctype = ctype;
    }

    public Boolean getChot() {
        return this.chot;
    }
    
    public void setChot(Boolean chot) {
        this.chot = chot;
    }
   








}