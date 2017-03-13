package dong.shopping.pojo;

/**
 * Status entity. @author MyEclipse Persistence Tools
 */

public class Status  implements java.io.Serializable {


    // Fields    

     /**
	 * 
	 */
	private static final long serialVersionUID = 6894503198005228142L;
	private Integer sid;
     private String status;

    public Integer getSid() {
        return this.sid;
    }
    
    public void setSid(Integer sid) {
        this.sid = sid;
    }

    public String getStatus() {
        return this.status;
    }
    
    public void setStatus(String status) {
        this.status = status;
    }
}