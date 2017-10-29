package utils;
import java.util.Date;
import java.util.Properties;

import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 * 发送邮件的简易工具类
 * @author 胡炜财
 *
 */
public class SendMailUtil {
	private static String  myMailAccount="hallio@163.com";
	private static String myMailPassword="123456a";
	private static String myName="LONERS团队";
	private static String mailServer="smtp.163.com";
	/**
	 * 
	 * @param session 会话
	 * @param toAccount 收件人
	 * @param content 内容
	 * @param title 标题
	 * @return
	 * @throws Exception
	 */
	public static MimeMessage createMessage(Session session,String toAccount,String content,String title) throws Exception{
		MimeMessage message = new MimeMessage(session);
        message.setFrom(new InternetAddress(myMailAccount, myName , "UTF-8"));
        message.setRecipient(MimeMessage.RecipientType.TO, new InternetAddress(toAccount, null, "UTF-8"));
        message.setSubject(title, "UTF-8");
        message.setContent(content, "text/html;charset=UTF-8");
        message.setSentDate(new Date());
        message.saveChanges();
        return message;
	}
	/**
	 * 发送邮件
	 * @param toAccount 收件人
	 * @param content	内容
	 * @param title	标题
	 */
	public static void sendMail(String toAccount,String content,String title) {
		 //用于连接邮件服务器的参数配置
        Properties props = new Properties();                   
        props.setProperty("mail.transport.protocol", "smtp");   // 使用的协议
        props.setProperty("mail.smtp.host", mailServer);   //  SMTP 服务器地址
        props.setProperty("mail.smtp.auth", "true");  
        Session session = Session.getDefaultInstance(props);
        session.setDebug(false);
        try (Transport transport = session.getTransport()){
        	//创建邮件
			MimeMessage mail = createMessage(session, toAccount, content, title);
			//连接服务器并发送
	        transport.connect(myMailAccount, myMailPassword);
	        transport.sendMessage(mail, mail.getAllRecipients());
	        System.out.println(content);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
	}
	public static void main(String[] args) {
		sendMail("1792663772@qq.com", "Hello", "我自横刀向天笑");
	}
}
