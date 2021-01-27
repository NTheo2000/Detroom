package detroom_java;

import java.util.List;
import java.util.ArrayList;
import java.sql.*;




public class PublicationDAO {

    public List<Publication> findPublications(int idTeam, String typeUser, String idUser) throws Exception{
        DB db = new DB();
        Connection con = null;
        PreparedStatement stmt = null;
        String query = "SELECT * FROM publication WHERE idTeam = ? ORDER BY creationDate DESC";
        ResultSet rs = null;
        List<Publication> pubs = new ArrayList<Publication>();
        try{
            con = db.getConnection();
            stmt = con.prepareStatement(query);
            stmt.setInt(1, idTeam);
            rs = stmt.executeQuery();
            if(rs.next()){
                rs.previous();
                while(rs.next()){
                    if (rs.getString("vision").equals(typeUser) || rs.getString("vision").equals("public")) {
                        pubs.add(new Publication(rs.getInt("idPublication"), rs.getString("idUser"),rs.getInt("idTeam"),rs.getString("content"),rs.getString("uploadFile"),rs.getTimestamp("creationDate"),rs.getInt("likes"),rs.getString("vision")));
                    } else if (rs.getString("idUser").equals(idUser)) {
                        pubs.add(new Publication(rs.getInt("idPublication"), rs.getString("idUser"),rs.getInt("idTeam"),rs.getString("content"),rs.getString("uploadFile"),rs.getTimestamp("creationDate"),rs.getInt("likes"),rs.getString("vision")));           
                    }
                }
                rs.close();
			    stmt.close();
                db.close();
                return pubs;
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
    

    public List<Publication> findUserPublications(int idTeam, String idUser) throws Exception{
        DB db = new DB();
        Connection con = null;
        PreparedStatement stmt = null;
        String query = "SELECT * FROM publication WHERE idTeam = ? AND idUser = ? ORDER BY creationDate DESC";
        ResultSet rs = null;
        List<Publication> pubs = new ArrayList<Publication>();
        try{
            con = db.getConnection();
            stmt = con.prepareStatement(query);
            stmt.setInt(1, idTeam);
            stmt.setString(2, idUser);
            rs = stmt.executeQuery();
            if(rs.next()){
                rs.previous();
                while(rs.next()){
                    pubs.add(new Publication(rs.getInt("idPublication"), rs.getString("idUser"),rs.getInt("idTeam"),rs.getString("content"),rs.getString("uploadFile"),rs.getTimestamp("creationDate"),rs.getInt("likes"),rs.getString("vision")));
                }
                rs.close();
			    stmt.close();
                db.close();
                return pubs;
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
    
 
    public String post(Publication pub) throws Exception{
        DB db = new DB();
        Connection con = null;
        PreparedStatement stmt = null;
        int rs;
        String query = "INSERT INTO publication (idUser,idTeam,content,uploadFile,creationDate,likes,vision) VALUES (?,?,?,?,?,?,?);";
        try{
            con = db.getConnection();
            stmt = con.prepareStatement(query);
            stmt.setString(1,pub.getIdUser());
            stmt.setInt(2,pub.getIdTeam());
            stmt.setString(3,pub.getContent());
            stmt.setString(4, pub.getUploadFilePath());
            stmt.setTimestamp(5, pub.getCreationDate());
            stmt.setInt(6,pub.getLikes());
            stmt.setString(7,pub.getType());
            rs = stmt.executeUpdate();
            stmt.close();
            db.close();
            if (rs > 0) {
                return "Suc";
            } else{
                return "Unsuccesfull publication!";
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


}