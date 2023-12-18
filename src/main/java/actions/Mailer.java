package actions;

import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import utils.ProjectConfiguration;
import utils.Settings;

/**
 * Mailer class has auto mail sender utility
 * 
 * @author dhanush
 *
 */
public class Mailer {

	private static final Logger log = LogManager.getLogger(Mailer.class);

	/**
	 * sendMailReport will send automatic automation run status mail with attaching
	 * test report.
	 * 
	 * @param recipients_To
	 * @param recipients_cc
	 */
	public void sendMailReport(String recipients_To, String recipients_cc) {

		final String username = Settings.MAIL_ID;
		final String password = Settings.MAIL_PASSWORD;

		Properties props = new Properties();
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.protocols", "TLSv1.2");
		props.put("mail.smtp.starttls.enable", "true");

		Session session = Session.getInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		});

		try {
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(username));
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipients_To));
			InternetAddress[] iAdressArray = InternetAddress.parse(recipients_cc);
			message.setRecipients(Message.RecipientType.CC, iAdressArray);

			// MAIL BODY CONTENT
			message.setSubject("Automation Report - Auto Generated");
			BodyPart content = new MimeBodyPart();
			String body = "Hello Team,\n\tAutomation Test run completed on " + Settings.PATCH_INFO + ".\n" + "Media -"
					+ Settings.BUILD_NO + "\n" + "Please find the attached Report.\n";
			String signature = "\nThanks and Regards,\nDhanush";
			content.setText(body + signature);

			// ATTCHMENTS
			MimeBodyPart reportAttchment = new MimeBodyPart();
			String reportPath = ProjectConfiguration.reportPath;
			DataSource source = new FileDataSource(reportPath);
			reportAttchment.setDataHandler(new DataHandler(source));
			reportAttchment.setFileName(reportPath);

			// BODY CONTENT + ATTACHMENT
			Multipart fullMail = new MimeMultipart();
			fullMail.addBodyPart(content);
			fullMail.addBodyPart(reportAttchment);
			message.setContent(fullMail);

			Transport.send(message);

			System.out.println("Mail sent");

		} catch (MessagingException e) {
			log.error("Exception in sendMailReport :- " + e.getMessage());
		}
	}

}
