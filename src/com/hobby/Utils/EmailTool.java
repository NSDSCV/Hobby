package com.hobby.Utils;

import javax.mail.*;
import javax.mail.internet.*;
import java.util.Properties;

public class EmailTool {
	
	//针对465端口的邮件发送
	
	// 创建pro用于保存所需的数据
	public static Properties pro;
	static {
		pro = new Properties();
		pro.setProperty("from", "hobby_admin@163.com");
		pro.setProperty("password", "admin12345");
		pro.setProperty("mail.smtp.ssl.enable", "true");
		pro.setProperty("mail.smtp.host", "smtp.163.com");
		pro.setProperty("mail.smtp.port", "465");
		pro.setProperty("mail.smtp.auth", "true");
		pro.setProperty("mail.debug", "true");

	}

	// 发送普通的文本文件，一般用于网站向用户发送验证码。第一个参数为收件人地址，第二个参数为文本信息，第三个参数为邮件主题
	public static void sendTextMessage(String toEmailAddress, String content, String subject) {
		// 创建session对象，第一个参数为连接邮件服务器的连接信息，第二个为身份验证的接口，重写抽象方法，参数为登陆邮件服务器的代理账号密码。
		Session session = Session.getDefaultInstance(pro, new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(pro.getProperty("from"), pro.getProperty("password"));
			}
		});
		try {
			// 创建消息对象
			MimeMessage message = new MimeMessage(session);
			// 设置发件人
			message.setFrom(new InternetAddress(pro.getProperty("from")));
			// 设置收件人
			message.addRecipients(Message.RecipientType.TO,
					new InternetAddress[] { new InternetAddress(toEmailAddress) });
			// 设置文本主题
			message.setSubject(subject);
			// 设置文本内容
			message.setText(content);
			// 使用静态方法发送邮件，此静态方法包装了保存内容，连接服务器等方法。
			Transport.send(message);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
