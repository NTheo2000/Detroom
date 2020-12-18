package detroom_java;


import java.sql.Timestamp;




public class Publication {

    /* Object variables */

    private int idPublication;
    private String idUser;
    private int idTeam;
    private String content;
    private String uploadFilePath;
    private Timestamp creationDate;
    private int likes;
    private String type; // vision
    
    /**
	 * Constructor
	 *
	 * @param name
	 * @param surname
	 * @param email
	 * @param username
	 * @param password
	 */

    public Publication(String idUser, int idTeam, String content, String uploadFilePath,Timestamp creationDate, int likes, String type) {
        this.idUser = idUser;
        this.idTeam = idTeam;
        this.content = content;
        this.uploadFilePath = uploadFilePath;
        this.creationDate = creationDate;
        this.likes = likes;
        this.type = type;
    }

    public Publication(int idPublication, String idUser, int idTeam, String content, Timestamp creationDate, int likes, String type) {
        this.idPublication = idPublication;
        this.idUser = idUser;
        this.idTeam = idTeam;
        this.content = content;
        this.creationDate = creationDate;
        this.likes = likes;
        this.type = type;
    }



    /* Getters & Setters */

	/**
	 * @param idPublication the idpublication to set
	 */

    public void setIdPublication(int idPublication){
        this.idPublication = idPublication;
    }

    /**
	 * @return the idpublication
	 */

    public int getIdPublication(){
        return this.idPublication;
    }

    /**
	 * @param idUser the iduser to set
	 */

    public void setIdUser(String idUser){
        this.idUser = idUser;
    }

    /**
	 * @return the iduser
	 */

    public String getIdUser(){
        return this.idUser;
    }

    /**
	 * @param idTeam the idteam to set
	 */

    public void setIdTeam(int idTeam){
        this.idTeam = idTeam;
    }

    /**
	 * @return the idteam
	 */

    public int getIdTeam(){
        return this.idTeam;
    }

    /**
	 * @param content the content to set
	 */

    public void setContent(String content){
        this.content = content;
    }

    /**
	 * @return the content of publication
	 */

    public String getContent(){
        return this.content;
    }

    /**
	 * @param content the content to set
	 */

    public void setUploadFilePath(String uploadFilePath){
        this.uploadFilePath = uploadFilePath;
    }

    /**
	 * @return the content of publication
	 */

    public String getUploadFilePath(){
        return this.uploadFilePath;
    }

    /**
	 * @param creationDate the creation date to set
	 */

    public void setCreationDate(Timestamp creationDate){
        this.creationDate = creationDate;
    }

    /**
	 * @return the creation date
	 */

    public Timestamp getCreationDate(){
        return this.creationDate;
    }

    /**
	 * @param likes the likes to set
	 */

    public void setLikes(int likes){
        this.likes = likes;
    }

    /**
	 * @return the likes of publication
	 */

    public int getLikes(){
        return this.likes;
    }

    /**
	 * @param type the type to set
	 */

    public void setType(String type){
        this.type = type;
    }

    /**
	 * @return the type of vision
	 */

    public String getType(){
        return this.type;
    }




    






}