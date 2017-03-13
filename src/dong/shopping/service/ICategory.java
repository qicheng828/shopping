package dong.shopping.service;

import java.util.List;

import dong.shopping.pojo.Category;

public interface ICategory {

	public String saveCategory(Category category);
	public List<Category> queryCategory(boolean chot);
	public boolean CheckCtype(String ctype);
	public String updateCategory(Category category);
	public String updateChot(Category category);
	public List<Category> queryCategory(String ctype);
	public String deleteCategory(int cid);
}
