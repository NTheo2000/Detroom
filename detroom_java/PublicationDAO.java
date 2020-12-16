package detroom_java;

import java.util.List;
import java.util.ArrayList;
import java.sql.*;
import java.io.InputStream;



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
            stmt.setString(3, "Public");
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

    public void post(Publication pub) throws Exception{
        DB db = new DB();
        Connection con = null;
        PreparedStatement stmt = null;
        PreparedStatement stmt2 = null;
        ResultSet rs = null;
        String query = "SELECT * FROM publication;";
        int rs2;
        String query2 = "INSERT INTO publication (idPublication,idUser,idTeam,content,uploadFile,creationDate,likes,vision) VALUES (?,?,?,?,?,?,?,?);";
        try{
            con = db.getConnection();
            stmt = con.prepareStatement(query);
            rs = stmt.executeQuery();
            int idPublication = 0;
            if (rs != null) { 
                rs.last();
                idPublication = rs.getRow() + 1;
            }
            stmt2 = con.prepareStatement(query2);
            stmt2.setInt(1, idPublication);
            stmt2.setString(2,pub.getIdUser());
            stmt2.setInt(3,pub.getIdTeam());
            stmt2.setString(4,pub.getContent());
            stmt2.setBlob(5, pub.getUploadFile());
            stmt2.setTimestamp(6, pub.getCreationDate());
            stmt2.setInt(7,pub.getLikes());
            stmt2.setString(8,pub.getType());
            rs2 = stmt2.executeUpdate();
            if (rs2 > 0) {
                stmt.close();
                db.close();
                throw new Exception("Succesfull publication!");
            } else{
                stmt.close();
                db.close();
                throw new Exception("Unsuccesfull publication!");
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