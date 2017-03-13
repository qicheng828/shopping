package dong.shopping.pojo;



/**
 * Account entity. @author MyEclipse Persistence Tools
 */

public class Account  implements java.io.Serializable {


    // Fields    

     /**
	 * 
	 */
	private static final long serialVersionUID = -8818284513085596460L;
	private Integer aid;
     private String alogin;
     private String aname;
     private String apass;
     private Integer agrade;
    
    

	public Integer getAgrade() {
		return agrade;
	}

	public void setAgrade(Integer agrade) {
		this.agrade = agrade;
	}

	public Integer getAid() {
        return this.aid;
    }
    
    public void setAid(Integer aid) {
        this.aid = aid;
    }

    public String getAlogin() {
        return this.alogin;
    }
    
    public void setAlogin(String alogin) {
        this.alogin = alogin;
    }

    public String getAname() {
        return this.aname;
    }
    
    public void setAname(String aname) {
        this.aname = aname;
    }

    public String getApass() {
        return this.apass;
    }
    
    public void setApass(String apass) {
        this.apass = apass;
    }

   
}