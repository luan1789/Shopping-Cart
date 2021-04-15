package dtos;

import java.io.Serializable;

/**
 *
 * @author User
 */
public class UserDTO implements Serializable {

    private String userID="";
    private String fullname="";
    private String password="";
    private String roleID="";
    private String gmail="";

    public UserDTO() {
    }


    public UserDTO(String userID, String fullname, String password, String roleID, String gmail) {
        this.userID = userID;
        this.fullname = fullname;
        this.password = password;
        this.roleID = roleID;
        this.gmail = gmail;
    }
 



    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRoleID() {
        return roleID;
    }

    public void setRoleID(String roleID) {
        this.roleID = roleID;
    }

    public String getGmail() {
        return gmail;
    }

    public void setGmail(String gmail) {
        this.gmail = gmail;
    }

}
