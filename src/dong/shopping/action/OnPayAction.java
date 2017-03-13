package dong.shopping.action;

import java.io.UnsupportedEncodingException;
import java.util.ResourceBundle;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import dong.shopping.pojo.Onpay;
import dong.shopping.service.IForder;
import dong.shopping.util.DigestUtil;

public class OnPayAction {
	private Onpay onpay;
	private IForder forderImpl = null;

	public String onpays() {
		StringBuffer buffer = new StringBuffer();
		String url="https://www.yeepay.com/app-merchant-proxy/node";
		buffer.append(onpay.getP0_Cmd());
		buffer.append(onpay.getP1_MerId());
		buffer.append(onpay.getP2_Order());
		buffer.append(onpay.getP3_Amt());
		buffer.append(onpay.getP4_Cur());
		buffer.append(formatString(onpay.getP5_Pid()));
		buffer.append(formatString(onpay.getP6_Pcat()));
		buffer.append(formatString(onpay.getP7_Pdesc()));
		buffer.append(onpay.getP8_Url());
		buffer.append(onpay.getP9_SAF());
		buffer.append(formatString(onpay.getPa_MP()));
		buffer.append(onpay.getPd_FrpId());
		buffer.append(onpay.getPr_NeedResponse());
		String hmac = DigestUtil.hmacSign(buffer.toString(), ResourceBundle.getBundle("tool").getString("keyvalue"));
		ServletActionContext.getRequest().setAttribute("nodeAuthorizationURL", url);
		ServletActionContext.getRequest().setAttribute("onpay", onpay);
		ServletActionContext.getRequest().setAttribute("hmac", hmac);
		return "showorder";
	}

	public String success() throws UnsupportedEncodingException{
		HttpServletRequest rq= ServletActionContext.getRequest();
		String r0_Cmd = formatString(rq.getParameter("r0_Cmd")); 
		String p1_MerId = "10000940764"; 
		String r1_Code = formatString(rq.getParameter("r1_Code"));
		String r2_TrxId = formatString(rq.getParameter("r2_TrxId"));
		String r3_Amt = formatString(rq.getParameter("r3_Amt"));
		String r4_Cur = formatString(rq.getParameter("r4_Cur"));
		String r5_Pid = new String(formatString(rq.getParameter("r5_Pid")).getBytes("iso-8859-1"),"UTF-8");
		String r6_Order = formatString(rq.getParameter("r6_Order"));
		String r7_Uid = formatString(rq.getParameter("r7_Uid"));
		String r8_MP = new String(formatString(rq.getParameter("r8_MP")).getBytes("iso-8859-1"),"UTF-8");
		String r9_BType = formatString(rq.getParameter("r9_BType"));
		String hmac = formatString(rq.getParameter("hmac"));
		StringBuffer infoBuffer = new StringBuffer();
		infoBuffer.append(p1_MerId);
		infoBuffer.append(r0_Cmd);
		infoBuffer.append(r1_Code);
		infoBuffer.append(r2_TrxId);
		infoBuffer.append(r3_Amt);
		infoBuffer.append(r4_Cur);
		infoBuffer.append(r5_Pid);
		infoBuffer.append(r6_Order);
		infoBuffer.append(r7_Uid);
		infoBuffer.append(r8_MP);
		infoBuffer.append(r9_BType);
		String md5=DigestUtil.hmacSign(infoBuffer.toString(), ResourceBundle.getBundle("tool").getString("keyvalue"));
		boolean isok=md5.equals(hmac);
		if(isok){
			 r1_Code="1";
			 forderImpl.updateForder(Integer.parseInt(r6_Order), 2);
			 System.out.println("ok");
			 return "main";
		}
		return "500";
	}

	String formatString(String test) {
		if (test == null) {
			return "";
		}
		return test;
	}

	public Onpay getOnpay() {
		return onpay;
	}

	public void setOnpay(Onpay onpay) {
		this.onpay = onpay;
	}

	public void setForderImpl(IForder forderImpl) {
		this.forderImpl = forderImpl;
	}

}
