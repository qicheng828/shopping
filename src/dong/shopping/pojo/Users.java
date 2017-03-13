package dong.shopping.pojo;

/**
 * Users entity. @author MyEclipse Persistence Tools
 */

public class Users implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = 5402067185786953277L;
	private Integer uid;
	private String ulogin;
	private String uname;
	private String upass;
	private String uphone;
	private String uemail;
	private String upost;
	private String uaddress;

	public Integer getUid() {
		return uid;
	}

	public void setUid(Integer uid) {
		this.uid = uid;
	}

	public String getUlogin() {
		return this.ulogin;
	}

	public void setUlogin(String ulogin) {
		this.ulogin = ulogin;
	}

	public String getUname() {
		return this.uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getUpass() {
		return this.upass;
	}

	public void setUpass(String upass) {
		this.upass = upass;
	}

	public String getUphone() {
		return this.uphone;
	}

	public void setUphone(String uphone) {
		this.uphone = uphone;
	}

	public String getUemail() {
		return this.uemail;
	}

	public void setUemail(String uemail) {
		this.uemail = uemail;
	}

	public String getUpost() {
		return this.upost;
	}

	public void setUpost(String upost) {
		this.upost = upost;
	}

	public String getUaddress() {
		return this.uaddress;
	}

	public void setUaddress(String uaddress) {
		this.uaddress = uaddress;
	}
}