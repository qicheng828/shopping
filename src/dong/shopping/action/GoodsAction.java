package dong.shopping.action;

import java.io.File;
import java.util.List;
import javax.servlet.http.HttpSession;

import org.apache.derby.tools.sysinfo;
import org.apache.struts2.ServletActionContext;

import dong.shopping.impl.GoodImpl;
import dong.shopping.pojo.Good;
import dong.shopping.service.IGoods;

public class GoodsAction {

	private IGoods goodsImpl;

	private Good good;

	private File image;

	private String imageFileName;

	private int currentPage;

	private String gotoUrl;

	// 查询分页
	public String queryGoods() {
		List<Object> goods = goodsImpl.queryGood(good.getGname(),
				(Integer) good.getGid(), good.getCategory().getCid(), 1);
		HttpSession session = ServletActionContext.getRequest().getSession();
		session.setAttribute("gname", good.getGname());
		session.setAttribute("gid", good.getGid());
		session.setAttribute("cid", good.getCategory().getCid());
		session.setAttribute("currentPage", 1);
		session.setAttribute("page", goodsImpl.tatalPag(good.getGname(), good
				.getGid(), good.getCategory().getCid()));
		session.setAttribute("pages", goodsImpl.talPage(good.getGname(), good
				.getGid(), good.getCategory().getCid()));
		ServletActionContext.getRequest().setAttribute("goods", goods);
		return "query";
	}

	public String querybyGoodid() {
		ServletActionContext.getRequest().setAttribute("goods",
				goodsImpl.queryByGoodid(good.getGid()));
		return "detail";
	}

	public String querybyGoodname() {
		ServletActionContext.getRequest().setAttribute("goods",
				goodsImpl.querybyGoodname(good.getGname()));
		return "more";
	}

	// 查询分页的页数
	public String splitPage() {
		HttpSession session = ServletActionContext.getRequest().getSession();
		session.setAttribute("currentPage", currentPage);
		List<Object> goods = goodsImpl.queryGood(session.getAttribute("gname")
				.toString(), (Integer) session.getAttribute("gid"),
				(Integer) session.getAttribute("cid"), currentPage);
		ServletActionContext.getRequest().setAttribute("goods", goods);
		return "query";
	}

	// 插入商品信息和图片
	public String saveGoods() throws Exception {
		String newName = goodsImpl.newName(imageFileName);
		String path = null;
		if (good.getCategory().getCid() == 4) {
			path = ServletActionContext.getServletContext().getRealPath(
					"\\upfile\\yifu\\" + newName);
		}
		if (good.getCategory().getCid() == 5) {
			path = ServletActionContext.getServletContext().getRealPath(
					"\\upfile\\xiezi\\" + newName);

		}
		if (good.getCategory().getCid() == 6) {
			path = ServletActionContext.getServletContext().getRealPath(
					"\\upfile\\shipin\\" + newName);

		}
		if (good.getCategory().getCid() == 7) {
			path = ServletActionContext.getServletContext().getRealPath(
					"\\upfile\\huazhuang\\" + newName);

		}
		if (good.getCategory().getCid() == 8) {
			path = ServletActionContext.getServletContext().getRealPath(
					"\\upfile\\maorong\\" + newName);
		}
		System.out.println(good.getCategory().getCid());

		System.out.println(path);
		goodsImpl.upfile(image, path);
		good.setGpic(newName);
		goodsImpl.saveGoods(good);
		return "query";
	}

	// 删除商品
	public String deleteGoods() {
		goodsImpl.deleteGoods(good);
		return "query";
	}

	// 修改商品
	public String updateGoods() throws Exception {
		if (image != null) {
			String path = ServletActionContext.getServletContext().getRealPath(
					"\\upfile\\" + good.getGpic());
			new File(path).delete();
			String newn = goodsImpl.newName(imageFileName);
			String path2 = ServletActionContext.getServletContext()
					.getRealPath("\\upfile\\" + newn);
			goodsImpl.upfile(image, path2);
			good.setGpic(newn);
		}
		goodsImpl.updateGoods(good);
		return "query";
	}

	// 修改商品是否有效
	public void updateGisopen() {
		goodsImpl.updateGisopen(good);
	}

	// 修改商品是否上架
	public void updateGiscommend() {
		goodsImpl.updateGiscommend(good);
	}

	// 在被强制登陆的时候保存前个页面的地址
	public String getUrl() {
		String s = ServletActionContext.getRequest().getRequestURI();
		String e = ServletActionContext.getRequest().getQueryString();
		HttpSession session = ServletActionContext.getRequest().getSession();
		String gotoUrl = s + "?" + e;
		session.setAttribute("gotoUrl", gotoUrl);
		return "clothes";
	}

	public String getImageFileName() {
		return imageFileName;
	}

	public void setImageFileName(String imageFileName) {
		this.imageFileName = imageFileName;
	}

	public void setGoodsImpl(IGoods goodsImpl) {
		this.goodsImpl = goodsImpl;
	}

	public Good getGood() {
		return good;
	}

	public void setGood(Good good) {
		this.good = good;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public String getGotoUrl() {
		return gotoUrl;
	}

	public void setGotoUrl(String gotoUrl) {
		this.gotoUrl = gotoUrl;
	}

	public File getImage() {
		return image;
	}

	public void setImage(File image) {
		this.image = image;
	}
}
