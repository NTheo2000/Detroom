package detroom_java;
import java.sql.Timestamp;


public class Team {

    private int idTeam;
    private Timestamp creationDate;
    private String name;
    private String imagePath;
    private String description;

    public Team(String name, String description, String imagePath, Timestamp creationDate){
        this.creationDate = creationDate;
        this.name = name;
        this.description = description;
        this.imagePath = imagePath;
    }
    
    public Team(int idTeam, String name, String description, String imagePath, Timestamp creationDate){
        this.idTeam = idTeam;
        this.creationDate = creationDate;
        this.name = name;
        this.description = description;
        this.imagePath = imagePath;
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
	 * @param name the name to set
	 */

    public void setName(String name){
        this.name = name;
    }

    /**
	 * @return the name
	 */

    public String getName(){
        return this.name;
    }
    /**
	 * @param desciprion the description of team 
	 */

    public void setDescription(String description){
        this.description= description;
    }

    /**
	 * @return the description
	 */

    public String getDescription(){
        return this.description;
    }

    /**
	 * @param imagePath the image path to set
	 */

    public void setImagePath(String imagePath){
        this.imagePath = imagePath;
    }

    /**
	 * @return the image path
	 */

    public String getImagePath(){
        return this.imagePath;
    }
}