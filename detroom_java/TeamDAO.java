package detroom_java;

import java.util.ArrayList;
import java.util.List;
import java.sql.*;

public class TeamDAO {
    
    public String createTeam(Team team, String idUser) throws Exception {
        DB db = new DB();
        Connection con = null;
        PreparedStatement stmt = null;
        PreparedStatement stmt2 = null;
        PreparedStatement stmt3 = null;
        int rs;
        ResultSet rs2 = null;
        int rs3;
        String query = "INSERT INTO team (creationDate, name, imagePath, description) VALUES (?,?,?,?);";
        String query2 = "SELECT idTeam FROM team WHERE description = ?";
        String query3 = "INSERT INTO referuserteam (idUser, idTeam) VALUES (?,?);";
        try{
            con = db.getConnection();
            stmt = con.prepareStatement(query);
            stmt.setTimestamp(1, team.getCreationDate());
            stmt.setString(2, team.getName());
            stmt.setString(3, team.getImagePath());
            stmt.setString(4, team.getDescription());
            rs = stmt.executeUpdate();       
            stmt.close();    
            if (rs > 0) {
                stmt2 = con.prepareStatement(query2);
                stmt2.setString(1, team.getDescription());
                rs2 = stmt2.executeQuery();    
                if(rs2.next()){
                    stmt3 = con.prepareStatement(query3);
                    stmt3.setString(1, idUser);
                    stmt3.setInt(2, rs2.getInt("idTeam"));
                    rs3 = stmt3.executeUpdate();
                    rs2.close();
                    stmt2.close(); 
                    stmt3.close();
                    if (rs3 > 0){
                        db.close();
                        return "Suc";
                    } else {
                        db.close();
                        return "Unsuccessfull creation!";
                    }
                } else {
                    rs2.close();
                    db.close();
                    return "Unsuccessfull creation!";
                }   
            } else{
                db.close();
                return "Unsuccessfull creation!";
            }
        } catch(Exception e) {
            throw new Exception(e.getMessage());
        } finally{
            try{
                db.close();
            } catch (Exception e) {

            }
        }
    }

    public List<Team> findTeams(String idUser) throws Exception{
        DB db = new DB();
        Connection con = null;
        PreparedStatement stmt = null;
        PreparedStatement stmt2 = null;
        String query = "SELECT idTeam FROM referuserteam WHERE idUser = ?";
        String query2 = "SELECT * FROM team WHERE idTeam = ?";
        ResultSet rs = null;
        ResultSet rs2 = null;
        List<Team> teams = new ArrayList<Team>();
        try{
            con = db.getConnection();
            stmt = con.prepareStatement(query);
            stmt.setString(1, idUser);
            rs = stmt.executeQuery();
            if(rs.next()){
                rs.previous();
                while(rs.next()){
                    stmt2 = con.prepareStatement(query2);
                    stmt2.setInt(1, rs.getInt("idTeam"));
                    rs2 = stmt2.executeQuery();
                    if (rs2.next()){
                        teams.add(new Team(rs2.getInt("idTeam"), rs2.getString("name"), rs2.getString("description"), rs2.getString("imagePath"), rs2.getTimestamp("creationDate")));
                    }
                }
                rs2.close();
                stmt2.close();
                rs.close();
                stmt.close();
                db.close();
                return teams;
            } else {
                rs.close();
			    stmt.close();
                db.close();
                return null;
            }
        } catch(Exception e){
            throw new Exception(e.getMessage());
        } finally{
            try{
                db.close();
            }catch(Exception e){

            }
        }
    }
   
    public Team findTeam(int idteam) throws Exception{
        DB db = new DB();
        Connection con = null;
        PreparedStatement stmt = null;
        String query = "SELECT * FROM team WHERE idTeam = ?";
        ResultSet rs = null;
        try{
            con = db.getConnection();
            stmt = con.prepareStatement(query);
            stmt.setInt(1, idteam);
            rs = stmt.executeQuery();
            if(rs.next()){
                Team team = new Team(rs.getInt("idTeam"), rs.getString("name"), rs.getString("description"), rs.getString("imagePath"), rs.getTimestamp("creationDate"));
                rs.close();
			    stmt.close();
                db.close();
                return team;
            } else {
                rs.close();
			    stmt.close();
                db.close();
                return null;
            }
        } catch(Exception e){
            throw new Exception(e.getMessage());
        } finally{
            try{
                db.close();
            }catch(Exception e){

            }
        }
    }

    public List<User> findMembers(int teamid) throws Exception {
        StudentDAO sdt = new StudentDAO();
        ProfessorDAO prof = new ProfessorDAO();
        List<User> teamusers =  new ArrayList<User>();
        DB db = new DB();
        Connection con = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String sqlQuery = "SELECT * FROM referuserteam WHERE idTeam=?;";
        try {
            con=db.getConnection();
            stmt = con.prepareStatement(sqlQuery);
            stmt.setInt(1,teamid);
            rs = stmt.executeQuery();
            while(rs.next()) {
                if (prof.findProfessorID(rs.getString("idUser"))!=null) {
                    teamusers.add(prof.findProfessorID(rs.getString("idUser")));
                }
                if (sdt.findStudentID(rs.getString("idUser"))!=null) {
                    teamusers.add(sdt.findStudentID(rs.getString("idUser")));
                }
            }
            rs.close();
            stmt.close();
            db.close();
            return teamusers;
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        } finally {

            try {
                db.close();
            } catch (Exception e) {

            }
        }
    }

    public String addMember(int teamid, String iduser) throws Exception {
        DB db = new DB();
        Connection con = null;
        PreparedStatement stmt = null;
        int rs;
        String query = "INSERT INTO referuserteam (idUser, idTeam) VALUES (?,?);";
        try {
            con=db.getConnection();
            stmt = con.prepareStatement(query);
            stmt.setString(1, iduser);
            stmt.setInt(2, teamid);
            rs = stmt.executeUpdate();
            stmt.close();
            if (rs > 0){ 
                db.close();
                return "Success";
            } else{
                db.close();
                return "Unsuccess";
            }
        } catch (Exception e) {
            throw new Exception();
        } finally {
            try {
                db.close();
            } catch (Exception e) {

            }
        }
    }

    public boolean findMember(int teamid, String iduser) throws Exception {
        DB db = new DB();
        Connection con = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String query = "SELECT * FROM referuserteam WHERE idTeam=? and idUser=?;";
        try {
            con=db.getConnection();
            stmt = con.prepareStatement(query);
            stmt.setInt(1,teamid);
            stmt.setString(2, iduser);
            rs = stmt.executeQuery();
            if (rs.next()){
                rs.close();
                stmt.close();
                return true;
            } else {
                rs.close();
                stmt.close();
                return false;
            }
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        } finally {
            try {
                db.close();
            } catch (Exception e) {

            }
        }
    }


    public void editTeam(Team team) throws Exception {
		DB db = new DB();
		Connection con = null;
		PreparedStatement stmt = null;
		String sql = "UPDATE team SET name = ? , imagePath = ?, description = ? WHERE (idTeam=?);";
		try {
			con = db.getConnection();
			stmt = con.prepareStatement(sql);
			stmt.setString(1, team.getName());           
			stmt.setString(2, team.getImagePath());
            stmt.setString(3, team.getDescription());
            stmt.setInt(4, team.getIdTeam());
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
	} 


}