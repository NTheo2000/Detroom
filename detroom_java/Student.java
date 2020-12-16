package detroom_java;

import java.util.Date;

public class Student extends User{
	private int semester;
	private int entry_year;
	private String favorite_subject;

	public Student(String name, String surname, String password, String email, String photo, String userid,
			String auebmail, String mobile, String location, String bio, String facebook, String linkedin,
			Date dateofbirth, int semester,int entry_year,String favorite_subject) {
		super(name, surname, password, email, photo, userid, auebmail, mobile, location, bio, facebook,linkedin, dateofbirth);
		this.semester = semester;
		this.entry_year = entry_year;
		this.favorite_subject = favorite_subject;
		// TODO Auto-generated constructor stub
	}
	public Student(String name, String surname,String auebmail,String password, String userid) {
		super(name,surname,auebmail,password,userid);
	}

	public int getSemester() {
		return semester;
	}

	public void setSemester(int semester) {
		this.semester = semester;
	}

	public int getEntry_year() {
		return entry_year;
	}

	public void setEntry_year(int entry_year) {
		this.entry_year = entry_year;
	}

	public String getFavorite_subject() {
		return favorite_subject;
	}

	public void setFavorite_subject(String favorite_subject) {
		this.favorite_subject = favorite_subject;
	}

}
