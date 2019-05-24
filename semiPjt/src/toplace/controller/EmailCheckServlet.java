package controller;

import java.io.IOException;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.Session;



/**
 * Servlet implementation class EmailCheckServlet
 */
@WebServlet(name = "EmailCheck", urlPatterns = { "/emailCheck" })
public class EmailCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public EmailCheckServlet() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String user="dmmn1156@naver.com";
		String password ="dlckdwlr!@";
		
		Properties prop = new Properties();
		prop.put("mail.smtp.host", "smtp.naver.com");
		prop.put("mail.smtp.port", 587);
		prop.put("mail.smtp.auth", "true");
		
		String buffer = new String();
		for( int i = 0; i<=6; i++) {
			int n =(int)(Math.random() * 10);
			buffer += n;
		}
		
		javax.mail.Session session = javax.mail.Session.getDefaultInstance(prop, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, password);
			}
		});
		
		
		try {
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(user));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(request.getParameter("email")));
			
			message.setSubject("이메일 인증번호 ");
			message.setText(" 인증번호 :" + buffer);
			
			Transport.send(message);
			System.out.println("이메일 전송 성공");
			System.out.println(buffer);
			request.setAttribute("buffer", buffer);
			RequestDispatcher rd = request.getRequestDispatcher("/emailCheck.jsp");
			rd.forward(request, response);
		} catch (AddressException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
