package dong.shopping.service;

import java.io.File;
import java.util.List;
import dong.shopping.pojo.Good;

public interface IGoods {

	public List<Object> queryGood(String gname,int gid,Integer cid,int currentPage);
	public int tatalPag(String gname,int gid,Integer cid);
	public String deleteGoods(Good good);
	public void updateGisopen(Good good);
	public void updateGiscommend( Good good);
	@SuppressWarnings("unchecked")
	public List queryGiscommend(int cid);
	public void updateGoods(Good good);
	public String newName(String fileName);
	public String saveGoods(Good good);
	public int talPage(String gname,int gid,Integer cid);
	public void upfile(File file, String path)  throws Exception;
	public List<Good> querybyGoodname(String name);
	public Good queryByGoodid(int id);
 }
