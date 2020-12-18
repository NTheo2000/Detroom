package detroom_java;

import java.util.Date;

public class Professor extends User {
	private String subject;

	public Professor(String name, String surname, String password, String email, String photo, String userid,
			String auebmail, String mobile, String location, String bio, String facebook, String linkedin,
			Date dateofbirth, String subject) {
		super(name, surname, password, email, photo, userid, auebmail, mobile, location, bio, facebook,linkedin, dateofbirth);
		this.subject = subject;
		// TODO Auto-generated constructor stub
	}
	public Professor(String name, String surname,String auebmail,String password, String userid) {
		super(name,surname,auebmail,password,userid);
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

}
