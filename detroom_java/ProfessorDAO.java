package detroom_java;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;


/**
 * UserDAO provides all the necessary methods related to users in order to connect to the database and store/retrieve users etc.
 * 
 * @author 
 *
 */
public class ProfessorDAO {
	
		
	/**
	 * This method returns a List with all Professors
	 * 
	 * @return List<Professor>
	 */
	public List<Professor> getProfessors() throws Exception {

		List<Professor> professors =  new ArrayList<Professor>();
		
		DB db = new DB();
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sqlQuery = "SELECT * FROM professor;";
		try {
			con=db.getConnection();
			stmt = con.prepareStatement(sqlQuery);
			rs = stmt.executeQuery();
			while(rs.next()) {

				professors.add( new Professor(rs.getString("name"), rs.getString("surname"), rs.getString("password"), rs.getString("personalEmail"), rs.getString("imagePath"), rs.getString("idUser"),rs.getString("auebEmail"),rs.getString("phoneNumber"), rs.getString("location"),rs.getString("bio"),rs.getString("facebook"), rs.getString("linkedin"), rs.getString("birthdate"),rs.getString("subject")) );

			}
			rs.close();
			stmt.close();
			db.close();
			return professors;

		} catch (Exception e) {
			throw new Exception(e.getMessage());
		} finally {

			try {
				db.close();
			} catch (Exception e) {

			}

		}


	}
		
	 //End of getProfessors

	/**
	 * Search user by auebmail
	 * 
	 * @param username, String
	 * @return Professor, the Professor object
	 * @throws Exception, if professor not found
	 */
	public Professor findProfessor(String auebmail) throws Exception {
		DB db = new DB();
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sqlQuery = "SELECT * FROM professor WHERE auebEmail=?;";
		try {
			con = db.getConnection();
			stmt = con.prepareStatement(sqlQuery);
			stmt.setString(1, auebmail);

			rs = stmt.executeQuery();
			if (!rs.next()) {
				throw new Exception("Professor with aueb email: " + auebmail + " not found");
			}
			Professor professor = new Professor(rs.getString("name"), rs.getString("surname"), rs.getString("password"), rs.getString("personalEmail"), rs.getString("imagePath"), rs.getString("idUser"),rs.getString("auebEmail"),rs.getString("phoneNumber"), rs.getString("location"),rs.getString("bio"),rs.getString("facebook"), rs.getString("linkedin"), rs.getString("birthdate"),rs.getString("subject"));

			rs.close();
			stmt.close();
			db.close();

			return professor;


		} catch (Exception e) {
			throw new Exception(e.getMessage());
		} finally {

			try {
				db.close();
			} catch (Exception e) {

			}

		}

		
		
		
	} //End of findUser
	public Professor findProfessorID(String userid) throws Exception {
		DB db = new DB();
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sqlQuery = "SELECT * FROM professor WHERE idUser=?;";
		try {
			con = db.getConnection();
			stmt = con.prepareStatement(sqlQuery);
			stmt.setString(1, userid);

			rs = stmt.executeQuery();
			if (!rs.next()) {
				return null;
			}
			Professor professor = new Professor(rs.getString("name"), rs.getString("surname"), rs.getString("password"), rs.getString("personalEmail"), rs.getString("imagePath"), rs.getString("idUser"),rs.getString("auebEmail"),rs.getString("phoneNumber"), rs.getString("location"),rs.getString("bio"),rs.getString("facebook"), rs.getString("linkedin"), rs.getString("birthdate"),rs.getString("subject"));

			rs.close();
			stmt.close();
			db.close();

			return professor;


		} catch (Exception e) {
			throw new Exception(e.getMessage());
		} finally {

			try {
				db.close();
			} catch (Exception e) {

			}

		}

		
		
		
	}
	
	public Professor findProfessorName(String surname) throws Exception {
		DB db = new DB();
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sqlQuery = "SELECT * FROM professor WHERE surname=?;";
		try {
			con = db.getConnection();
			stmt = con.prepareStatement(sqlQuery);
			stmt.setString(1, surname);

			rs = stmt.executeQuery();
			if (!rs.next()) {
				return null;
			}
			Professor professor = new Professor(rs.getString("name"), rs.getString("surname"), rs.getString("password"), rs.getString("personalEmail"), rs.getString("imagePath"), rs.getString("idUser"),rs.getString("auebEmail"),rs.getString("phoneNumber"), rs.getString("location"),rs.getString("bio"),rs.getString("facebook"), rs.getString("linkedin"), rs.getString("birthdate"),rs.getString("subject"));

			rs.close();
			stmt.close();
			db.close();

			return professor;


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
	 * This method is used to authenticate a professor.
	 * 
	 * @param username, String
	 * @param password, String
	 * @return professor, the Professor object
	 * @throws Exception, if the credentials are not valid
	 */
	public Professor authenticateProfessor(String auebmail, String password) throws Exception {
		DB db = new DB();
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sqlQuery = "SELECT * FROM professor WHERE auebEmail=? AND password=? ;";
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
			Professor professor = new Professor(rs.getString("name"), rs.getString("surname"), rs.getString("password"), rs.getString("personalEmail"), rs.getString("imagePath"), rs.getString("idUser"),rs.getString("auebEmail"),rs.getString("phoneNumber"), rs.getString("location"),rs.getString("bio"),rs.getString("facebook"), rs.getString("linkedin"), rs.getString("birthdate"),rs.getString("subject"));

			rs.close();
			stmt.close();
			db.close();

			return professor;

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
	 * Register/create new Professor.
	 * 
	 * @param professro, Professor
	 * @throws Exception, if encounter any error.
	 */
	public void registerProfessor(Professor professor) throws Exception {
		DB db = new DB();
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sqlQuery = "SELECT * FROM user WHERE idUser=?;";
		String sql = "INSERT INTO professor(idUser,subject,name,surname,personalEmail,password,imagePath,phoneNumber,location,auebEmail,facebook,linkedin,birthdate,bio) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?);";
		String sql1 = "INSERT INTO user(idUser) VALUES (?);";
		try {
			con = db.getConnection();
			stmt = con.prepareStatement(sqlQuery);
			stmt.setString(1,professor.getUserid());
			rs = stmt.executeQuery();
			if (rs.next()) {
                rs.close();
                stmt.close();
                throw new Exception("Aueb email already registered");
			}
			rs.close();
			stmt = con.prepareStatement(sql1);
			stmt.setString(1,professor.getUserid());
			stmt.executeUpdate();
            stmt = con.prepareStatement(sql);

            stmt.setString(1, professor.getUserid());           
            stmt.setString(2, null);
            stmt.setString(3, professor.getName());
            stmt.setString(4, professor.getSurname());
			stmt.setString(5, null);
			stmt.setString(6, professor.getPassword());
			stmt.setString(7, "images/default-avatar.png");
			stmt.setString(8, null);
			stmt.setString(9, null);
			stmt.setString(10, professor.getAuebmail());
			stmt.setString(11, null);
			stmt.setString(12, null);
			stmt.setString(13, null);
			stmt.setString(14, null);




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
	public void editProfessor(Professor professor) throws Exception {
		DB db = new DB();
		Connection con = null;
		PreparedStatement stmt = null;
		PreparedStatement stmt2 = null;
		String deletesql = "DELETE FROM professor WHERE(idUser=?);";
		String sql = "INSERT INTO professor(idUser,subject,name,surname,personalEmail,password,imagePath,phoneNumber,location,auebEmail,facebook,linkedin,birthdate,bio) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?);";
		try {
			con = db.getConnection();
			stmt2 = con.prepareStatement(deletesql);
			stmt2.setString(1,professor.getUserid());
			stmt2.executeUpdate();
			stmt2.close();
			stmt = con.prepareStatement(sql);
			stmt.setString(1, professor.getUserid());           
			stmt.setString(2, professor.getSubject());
            stmt.setString(3, professor.getName());
            stmt.setString(4, professor.getSurname());
			stmt.setString(5, professor.getEmail());
			stmt.setString(6, professor.getPassword());
			stmt.setString(7, professor.getPhoto());
			stmt.setString(8, professor.getMobile());
			stmt.setString(9, professor.getLocation());
			stmt.setString(10, professor.getAuebmail());
			stmt.setString(11, professor.getFacebook());
			stmt.setString(12, professor.getLinkedin());
			stmt.setString(13, professor.getDateofbirth());
			stmt.setString(14,professor.getBio());
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
			
		
			
		
	} //End of authenticate

} //End of class
