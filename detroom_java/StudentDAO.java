package detroom_java;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;


/**
 * Student DAO provides all the necessary methods related to users in order to connect to the database and store/retrieve users etc.
 * 
 * @author 
 *
 */
public class StudentDAO {
	
		
	/**
	 * This method returns a List with all Users
	 * 
	 * @return List<User>
	 */
	public List<Student> getStudents() throws Exception {

		List<Student> students =  new ArrayList<Student>();
		
		DB db = new DB();
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sqlQuery = "SELECT * FROM student;";
		try {
			con=db.getConnection();
			stmt = con.prepareStatement(sqlQuery);
			rs = stmt.executeQuery();
			while(rs.next()) {

				students.add( new Student(rs.getString("name"), rs.getString("surname"), rs.getString("password"), rs.getString("personalEmail"), rs.getString("imagePath"), rs.getString("idUser"),rs.getString("auebEmail"),rs.getString("phoneNumber"), rs.getString("location"),rs.getString("bio"),rs.getString("facebook"), rs.getString("linkedin"), rs.getDate("birthdate"),rs.getInt("currentSemester"), rs.getInt("entryYear"), rs.getString("favoriteSubject")) );

			}
			rs.close();
			stmt.close();
			db.close();
			return students;

		} catch (Exception e) {
			throw new Exception(e.getMessage());
		} finally {

			try {
				db.close();
			} catch (Exception e) {

			}

		}


	}
		
	 //End of getStudents

	/**
	 * Search user by auebmail
	 * 
	 * @param username, String
	 * @return Student, the Student object
	 * @throws Exception, if user not found
	 */
	public Student findStudent(String auebmail) throws Exception {
		DB db = new DB();
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sqlQuery = "SELECT * FROM student WHERE auebEmail=?;";
		try {
			con = db.getConnection();
			stmt = con.prepareStatement(sqlQuery);
			stmt.setString(1, auebmail);

			rs = stmt.executeQuery();
			if (!rs.next()) {
				throw new Exception("Student with aueb email: " + auebmail + " not found");
			}
			Student student= new Student(rs.getString("name"), rs.getString("surname"), rs.getString("password"), rs.getString("personalEmail"), rs.getString("imagePath"),rs.getString("idUser"),rs.getString("auebEmail"),rs.getString("phoneNumber"), rs.getString("location"),rs.getString("bio"),rs.getString("facebook"), rs.getString("linkedin"), rs.getDate("birthdate"),rs.getInt("currentSemester"), rs.getInt("entryYear"), rs.getString("favoriteSubject"));
			rs.close();
			stmt.close();
			db.close();

			return student;


		} catch (Exception e) {
			throw new Exception(e.getMessage());
		} finally {

			try {
				db.close();
			} catch (Exception e) {

			}

		}

		
		
		
	} //End of findStudent
	public Student findStudentID(String userid) throws Exception {
		DB db = new DB();
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sqlQuery = "SELECT * FROM student WHERE idUser=?;";
		try {
			con = db.getConnection();
			stmt = con.prepareStatement(sqlQuery);
			stmt.setString(1, userid);

			rs = stmt.executeQuery();
			if (!rs.next()) {
				throw new Exception("Student with aueb email: " + userid + " not found");
			}
			Student student= new Student(rs.getString("name"), rs.getString("surname"), rs.getString("password"), rs.getString("personalEmail"), rs.getString("imagePath"),rs.getString("idUser"),rs.getString("auebEmail"),rs.getString("phoneNumber"), rs.getString("location"),rs.getString("bio"),rs.getString("facebook"), rs.getString("linkedin"), rs.getDate("birthdate"),rs.getInt("currentSemester"), rs.getInt("entryYear"), rs.getString("favoriteSubject"));
			rs.close();
			stmt.close();
			db.close();

			return student;


		} catch (Exception e) {
			throw new Exception(e.getMessage());
		} finally {

			try {
				db.close();
			} catch (Exception e) {

			}

		}

		
		
		
	}

	/**
	 * This method is used to authenticate a student.
	 * 
	 * @param username, String
	 * @param password, String
	 * @return Student, the Student object
	 * @throws Exception, if the credentials are not valid
	 */
	public Student authenticateStudent(String auebmail, String password) throws Exception {
		DB db = new DB();
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sqlQuery = "SELECT * FROM student WHERE auebEmail=? AND password=? ;";
		try {
			con = db.getConnection();
			stmt = con.prepareStatement(sqlQuery);
			stmt.setString(1,auebmail);
			stmt.setString(2,password);

			rs = stmt.executeQuery();
			if(!rs.next()){
				rs.close();
                stmt.close();
                throw new Exception("Wrong aueb email or password");
			}
			Student student= new Student(rs.getString("name"), rs.getString("surname"), rs.getString("password"), rs.getString("personalEmail"), rs.getString("imagePath"),rs.getString("idUser"),rs.getString("auebEmail"),rs.getString("phoneNumber"), rs.getString("location"),rs.getString("bio"),rs.getString("facebook"), rs.getString("linkedin"), rs.getDate("birthdate"),rs.getInt("currentSemester"), rs.getInt("entryYear"), rs.getString("favoriteSubject"));

			rs.close();
			stmt.close();
			db.close();

			return student;

		} catch (Exception e) {
            throw new Exception(e.getMessage());
        } finally {

            try {
                db.close();
            } catch (Exception e) {
                
            }

        }
			
		
			
		
	} //End of authenticate
	
	/**
	 * Register/create new Student.
	 * 
	 * @param student, Student
	 * @throws Exception, if encounter any error.
	 */
	public void registerStudent(Student student) throws Exception {
		DB db = new DB();
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sqlQuery = "SELECT * FROM student WHERE auebEmail=?;";
		String sql1 = "INSERT INTO user(idUser) VALUES (?);";
		String sql = "INSERT INTO student(idUser,favoriteSubject,entryYear,currentSemester,name,surname,personalEmail,password,imagePath,phoneNumber,location,auebEmail,facebook,linkedin,birthdate,bio)  VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);";
		try {
			con = db.getConnection();
			stmt = con.prepareStatement(sqlQuery);
			stmt.setString(1,student.getAuebmail());
			rs = stmt.executeQuery();
			if (rs.next()) {
                rs.close();
                stmt.close();
                throw new Exception("Aueb email already registered");
			}
			rs.close();
			stmt = con.prepareStatement(sql1);
			stmt.setString(1,student.getUserid());
			stmt.executeUpdate();
            
			stmt = con.prepareStatement(sql);
			stmt.setString(1, student.getUserid());           
			stmt.setString(2, null);
			stmt.setString(3, null);
			stmt.setString(4, null);
            stmt.setString(5, student.getName());
            stmt.setString(6, student.getSurname());
			stmt.setString(7, null);
			stmt.setString(8, student.getPassword());
			stmt.setString(9, "images/default-avatar.png");
			stmt.setString(10, null);
			stmt.setString(11, null);
			stmt.setString(12, student.getAuebmail());
			stmt.setString(13, null);
			stmt.setString(14, null);
			stmt.setString(15, null);
			stmt.setString(16, null);


            stmt.executeUpdate();
            
			stmt.close();
			db.close();

        } catch (Exception e) {
            throw new Exception(e.getMessage());
        } finally {

            try {
                db.close();
            } catch (Exception e) {
                
            }

        }
		
		
		
	}//end of register

}














	

