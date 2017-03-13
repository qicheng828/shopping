package dong.shopping.pojo;

import java.sql.Timestamp;


/**
 * Good entity. @author MyEclipse Persistence Tools
 */

public class Good  implements java.io.Serializable {


    // Fields    

     /**
	 * 
	 */
	private static final long serialVersionUID = -859453909188223052L;
	private Integer gid;
	private Category category;
	private String gname;
    private Double gprice;
    private String gpic;
    private String gremark;
    private String gxremark;
    private Timestamp gdate;
    private Boolean giscommend;
    private Boolean gisopen;

   
    // Property accessors

    
   
   
    public Category getCategory() {
        return this.category;
    }
    
    public Integer getGid() {
		return gid;
	}

	public void setGid(Integer gid) {
		this.gid = gid;
	}

	public void setCategory(Category category) {
        this.category = category;
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

    public String getGpic() {
        return this.gpic;
    }
    
    public void setGpic(String gpic) {
        this.gpic = gpic;
    }

    public String getGremark() {
        return this.gremark;
    }
    
    public void setGremark(String gremark) {
        this.gremark = gremark;
    }

    public String getGxremark() {
        return this.gxremark;
    }
    
    public void setGxremark(String gxremark) {
        this.gxremark = gxremark;
    }

    public Timestamp getGdate() {
        return this.gdate;
    }
    
    public void setGdate(Timestamp gdate) {
        this.gdate = gdate;
    }

    public Boolean getGiscommend() {
        return this.giscommend;
    }
    
    public void setGiscommend(Boolean giscommend) {
        this.giscommend = giscommend;
    }

    public Boolean getGisopen() {
        return this.gisopen;
    }
    
    public void setGisopen(Boolean gisopen) {
        this.gisopen = gisopen;
    }






}