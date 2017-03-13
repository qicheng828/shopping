package dong.shopping.service;
import java.util.List;

import dong.shopping.pojo.Users;;
public interface IUsers {

	public String saveUsers(Users user);
    public Users getUsers(Users user);
    public List<Users> queryUsers(String ulogin,String uphone,String uemail,int currentPage);
    public int tatalPag(String ulogin,String uphone,String uemail);
    public int talPage(String ulogin,String uphone,String uemail);
    public void deleteUser(int uid);
    public Integer upuser(Users users);
    public Users LookPassword(String password);
    public Integer UpPassword(String password,Integer uid);
}
