package dong.shopping.pojo;



/**
 * Sorder entity. @author MyEclipse Persistence Tools
 */

public class Sorder  implements java.io.Serializable {


    // Fields    

     /**
	 * 
	 */
	private static final long serialVersionUID = -9068615225667732371L;
	private Integer sid;
	private Good good;
    private Forder forder;
    private String gname;
    private Double gprice;
    private Integer gnumber;
	public Integer getSid() {
 		return sid;
 	}

 	public void setSid(Integer sid) {
 		this.sid = sid;
 	}

   

    public Good getGood() {
        return this.good;
    }
    
    public void setGood(Good good) {
        this.good = good;
    }

    public Forder getForder() {
        return this.forder;
    }
    
    public void setForder(Forder forder) {
        this.forder = forder;
    }

    public String getGname() {
        return this.gname;
    }
    
    public void setGname(String gname) {
        this.gname = gname;
    }

    public Double getGprice() {
        return this.gprice;
    }
    
    public void setGprice(Double gprice) {
        this.gprice = gprice;
    }

    public Integer getGnumber() {
        return this.gnumber;
    }
    
    public void setGnumber(Integer gnumber) {
        this.gnumber = gnumber;
    }

}