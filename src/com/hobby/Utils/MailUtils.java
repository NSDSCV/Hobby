package com.hobby.Utils;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

public class MailUtils {

	//针对25端口的邮件发送
	
	//email:邮件发给谁    subject:主题     emailMsg：邮件内容
	public static void sendMail(String email,String subject ,String emailMsg) throws AddressException, MessagingException {
		// 1.创建一个程序与邮件服务器会话对象 Session

		Properties props = new Properties();
		props.setProperty("mail.transport.protocol", "SMTP");  //发邮件的协议
		props.setProperty("mail.host", "smtp.163.com");   //发邮件的服务器地址
		props.setProperty("mail.smtp.auth", "true");// 指定验证为true 

		// 创建验证器
		Authenticator auth = new Authenticator() {
			public PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication("xxxxxxxx", "xxxxxxxx");
			}
		};

		Session session = Session.getInstance(props, auth);

		// 2.创建一个Message，它相当于是邮件内容
		Message message = new MimeMessage(session);

		message.setFrom(new InternetAddress("hobby_admin@163.com")); // 设置发送者
		message.setRecipient(RecipientType.TO, new InternetAddress(email)); // 设置收件人
		//message.setRecipient(RecipientType.CC, new InternetAddress("hobby_admin@163.com")); // 设置抄送人
		message.setSubject(subject);//邮件主题
		message.setContent(emailMsg, "text/html;charset=utf-8");//邮件正文
		Transport.send(message);// 3.创建 Transport用于将邮件发送
	}
}
