/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author
 */
public class SendEmail {

    public void sendEmail(String userMail, String userNames, String code, String id) {
        final String username = "cateringonline.g5@gmail.com";
        final String password = "123456Catering";

        String link = "http://localhost:8080/CateringOnline/Active.jsp?code=" + id + code;
       
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        Session session = Session.getInstance(props,
                new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(username, password);
                    }
                });
        try {

            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress("cateringonline.g5@gmail.com"));
            message.setRecipients(Message.RecipientType.TO,
                    InternetAddress.parse(userMail));
            message.setSubject("CateringOnline Notification");
            message.setText("Dear " + userNames + ","
                    + "\n\n Cảm ơn bạn đã đăng ký tài khoản ở CateringOnline, bạn hãy click vào đường link bên dưới để kích hoạt tài khoản ! " + "\n"
                    + link
            );

            Transport.send(message);

            System.out.println("Done");

        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }

   
}
