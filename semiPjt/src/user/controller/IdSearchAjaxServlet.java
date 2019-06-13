package user.controller;

import java.io.IOException;
import java.sql.SQLException;
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

import user.model.service.UserService;
import user.model.vo.User;

/**
 * Servlet implementation class IdSearchAjaxServlet
 */
@WebServlet(name = "IdSearchAjax", urlPatterns = { "/idSearchAjax" })
public class IdSearchAjaxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IdSearchAjaxServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String user="joubabo@naver.com";
		String password ="dhgkfk1324!";
		String email = request.getParameter("email");
		String name = request.getParameter("name");
		
		
		
		Properties prop = new Properties();
		prop.put("mail.smtp.host", "smtp.naver.com");
		prop.put("mail.smtp.port", 587);
		prop.put("mail.smtp.auth", "true");
		
		
		javax.mail.Session session = javax.mail.Session.getDefaultInstance(prop, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, password);
			}
		});
		
		
		try {
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(user));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
			
			message.setSubject("TOPlace 요청하신 아이디 찾기 메일입니다  ");
			
			User u = null;
			try {
				u = new UserService().idSearch(name,email);
				if(u != null) {
				message.setContent("<!DOCTYPE html>\r\n" + 
							"<html>\r\n" + 
							"<head>\r\n" + 
							"<meta charset=\"UTF-8\">\r\n" + 
							"<title>Insert title here</title>\r\n" + 
							"</head>\r\n" + 
							"<body >\r\n" + 
							"    <table>\r\n" + 
							"        <tbody>\r\n" + 
							"            <tr>\r\n" + 
							"                <td><img src=\"http://localhost/img/logo.png\" style=\"width: 150px; height: 70px; padding: 0 800px 0 0;\"></td>\r\n" + 
							"            </tr>\r\n" + 
							"            <tr>\r\n" + 
							"                <td>\r\n" + 
							"                    <div class=\"mailContainer\" style=\"width:100%; text-align:center; border: 1px solid gray; background-color: #183058; \">\r\n" + 
							"                        <center>\r\n" + 
							"                            <div class=\"mailheader\">\r\n" + 
							"                                <p style=\"padding:15px; font-size: 30px; font-weight: 900; color:white;\"><span style=\"color:#f69b02;\">TOPlace</span> 아이디 찾기 </p>\r\n" + 
							"                                <div class=\"mailContent\" style=\"background: white; border : 1px solid gray; width:85%\">\r\n" + 
							"                                    <p style=\"padding:30px 0 0 0; font-weight: 700;\">안녕하세요 <span style=\"color:#f69b02;\">고객님</span><br>TOPlace 아이디 찾기 위한  메일입니다.</p>\r\n" + 
							"                                    <p style=\"padding:20px 0 30px 0;\">입력해주신 이름과 이메일로 조회한 아이디 결과 입니다.</p>\r\n" + 
							"                                    <div class=\"number\" style=\"width:90%; border-top:1px solid gray; height:100px; line-height:100px;\">\r\n" + 
							"                                        <p style=\"font-size:16px; font-weight:700;\">아이디 :"+ u.getUserId()+" 가입날짜 :"+u.getEnrollDate() +" </p>\r\n" + 
							"                                    </div>\r\n" + 
							"                                </div>\r\n" + 
							"                                <div class=\"mailfooter\" style=\"padding:10px; width:85%; font-size:12px; text-align:left;\">\r\n" + 
							"                                    <p style=\"color:white;\">* 이 메일은 발신전용 메일입니다. 타인이 고객님의 이메일 정보를 수집하여 입력 할 경우 메일이 발송될 수 있습니다.<br>잘못 수신된 메일이라면 TOPlace 고객센터로 연락 주시기 바랍니다.</p>\r\n" + 
							"                                </div>\r\n" + 
							"                            </div>\r\n" + 
							"                        </center>\r\n" + 
							"                    </div>\r\n" + 
							"                </td>\r\n" + 
							"            </tr>\r\n" + 
							"        </tbody>\r\n" + 
							"    </table>\r\n" + 
							"</body>\r\n" + 
							"</html>","text/html;charset=euc-kr");
				Transport.send(message);
				System.out.println("이메일 전송 성공 아이디 있음");
				}else {
					message.setContent("<!DOCTYPE html>\r\n" + 
							"<html>\r\n" + 
							"<head>\r\n" + 
							"<meta charset=\"UTF-8\">\r\n" + 
							"<title>Insert title here</title>\r\n" + 
							"</head>\r\n" + 
							"<body >\r\n" + 
							"    <table>\r\n" + 
							"        <tbody>\r\n" + 
							"            <tr>\r\n" + 
							"                <td><img src=\"http://localhost/img/logo.png\" style=\"width: 150px; height: 70px; padding: 0 800px 0 0;\"></td>\r\n" + 
							"            </tr>\r\n" + 
							"            <tr>\r\n" + 
							"                <td>\r\n" + 
							"                    <div class=\"mailContainer\" style=\"width:100%; text-align:center; border: 1px solid gray; background-color: #183058; \">\r\n" + 
							"                        <center>\r\n" + 
							"                            <div class=\"mailheader\">\r\n" + 
							"                                <p style=\"padding:15px; font-size: 30px; font-weight: 900; color:white;\"><span style=\"color:#f69b02;\">TOPlace</span> 아이디 찾기 </p>\r\n" + 
							"                                <div class=\"mailContent\" style=\"background: white; border : 1px solid gray; width:85%\">\r\n" + 
							"                                    <p style=\"padding:30px 0 0 0; font-weight: 700;\">안녕하세요 <span style=\"color:#f69b02;\">고객님</span><br>TOPlace 아이디 찾기 위한  메일입니다.</p>\r\n" + 
							"                                    <p style=\"padding:20px 0 30px 0;\">입력해주신 이름과 이메일로 조회한 아이디 결과 입니다.</p>\r\n" + 
							"                                    <div class=\"number\" style=\"width:90%; border-top:1px solid gray; height:100px; line-height:100px;\">\r\n" + 
							"                                        <p style=\"font-size:16px; font-weight:700;\"> 조회된 아이디가 존재하지 않습니다.  </p>\r\n" + 
							"                                    </div>\r\n" + 
							"                                </div>\r\n" + 
							"                                <div class=\"mailfooter\" style=\"padding:10px; width:85%; font-size:12px; text-align:left;\">\r\n" + 
							"                                    <p style=\"color:white;\">* 이 메일은 발신전용 메일입니다. 타인이 고객님의 이메일 정보를 수집하여 입력 할 경우 메일이 발송될 수 있습니다.<br>잘못 수신된 메일이라면 TOPlace 고객센터로 연락 주시기 바랍니다.</p>\r\n" + 
							"                                </div>\r\n" + 
							"                            </div>\r\n" + 
							"                        </center>\r\n" + 
							"                    </div>\r\n" + 
							"                </td>\r\n" + 
							"            </tr>\r\n" + 
							"        </tbody>\r\n" + 
							"    </table>\r\n" + 
							"</body>\r\n" + 
							"</html>","text/html;charset=euc-kr");
					Transport.send(message);
					System.out.println("이메일 전송 성공 아이디 없음");
				}
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			
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
