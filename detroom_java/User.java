package detroom_java;

import java.sql.Time;

public abstract class User {
	private String name;
	private String surname;
	private String password;
	private String email;
	private String photo;
	private String userid;
	private String auebmail;
	private String mobile;
	private String location;
	private String bio;
	private String facebook;
	private String linkedin;
	private String dateofbirth;
	@Override
	public String toString() {
		return "User [name=" + name + ", surname=" + surname + ", password=" + password + ", email=" + email + ", photo=" + photo + ", userid=" + userid + ", auebmail=" + auebmail + ", mobile=" + mobile
				+ ", location=" + location + ", bio=" + bio + ", facebook=" + facebook + ", linkedin=" + linkedin
				+ ", dateofbirth=" + dateofbirth + "]";
	}
	public User(String name, String surname,String auebmail,String password, String userid) {
		this.name = name;
		this.surname = surname;
		this.password = password;
		this.userid = userid;
		this.auebmail = auebmail;
	}
	
	
	public User(String name, String surname, String password, String email, String photo, String userid,
			String auebmail, String mobile, String location, String bio, String facebook, String linkedin,
			String dateofbirth) {
		this.name = name;
		this.surname = surname;
		this.password = password;
		this.email = email;
		this.photo = photo;
		this.userid = userid;
		this.auebmail = auebmail;
		this.mobile = mobile;
		this.location = location;
		this.bio = bio;
		this.facebook = facebook;
		this.linkedin = linkedin;
		this.dateofbirth = dateofbirth;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSurname() {
		return surname;
	}
	public void setSurname(String surname) {
		this.surname = surname;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getAuebmail() {
		return auebmail;
	}
	public void setAuebmail(String auebmail) {
		this.auebmail = auebmail;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getBio() {
		return bio;
	}
	public void setBio(String bio) {
		this.bio = bio;
	}
	public String getFacebook() {
		return facebook;
	}
	public void setFacebook(String facebook) {
		this.facebook = facebook;
	}
	public String getLinkedin() {
		return linkedin;
	}
	public void setLinkedin(String linkedin) {
		this.linkedin = linkedin;
	}
	public String getDateofbirth() {
		return dateofbirth;
	}
	public void setDateofbirth(String dateofbirth) {
		this.dateofbirth = dateofbirth;
	}
	
	
}
