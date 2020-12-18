package detroom_java;

import java.util.List;
import java.util.ArrayList;
import java.sql.*;




public class PublicationDAO {

    public List<Publication> findPublications(int idTeam, String typeUser) throws Exception{
        DB db = new DB();
        Connection con = null;
        PreparedStatement stmt = null;
        String query = "SELECT * FROM publication WHERE idTeam = ? AND type = ? OR type = ? ORDER BY creationDate";
        ResultSet rs = null;
        List<Publication> pubs = new ArrayList<Publication>();
        try{
            con = db.getConnection();
            stmt = con.prepareStatement(query);
            stmt.setInt(1, idTeam);
            stmt.setString(2, typeUser);
            stmt.setString(3, "public");
            rs = stmt.executeQuery();
            if(rs.next()){
                rs.previous();
                while(rs.next()){
                    pubs.add(new Publication(rs.getInt("idPublication"), rs.getString("idUser"),rs.getInt("idTeam"),rs.getString("content"),rs.getTimestamp("creationDate"),rs.getInt("likes"),rs.getString("type")));
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
                return "Succesfull publication!";
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