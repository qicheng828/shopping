package dong.shopping.service;

import java.util.Date;
import java.util.List;

import dong.shopping.pojo.Forder;
import dong.shopping.pojo.Sorder;

public interface IForder {

	public Forder addforder(Forder forder,Sorder sorder);
	
	public Forder deleteSorder(Forder forder,int gid);

    public Double cluMoney(Forder forder);
   
    public Forder updateSorder(Forder forder,Sorder sorder);
   
    public Forder saveForder(Forder forder);
   
    public int countGoodNum(Forder forder);
    
    public String[] getBeans(String path);
    
    public List<Object> queryForder(String uname,Integer fid,Date fdate,int currentPage);
   
	public void deleteForder(Forder fid);
   
   public int tatalPag(String uname,Integer fid,Date fdate);

   public int talPage(String uname,Integer fid,Date fdate);
   
   public List<Object> queryForderBysid(int fid);
   
   public void updateForder( int fid, int sid);
}
