package group.english.entity;

/*
 *@author Wss8752
 *@date 2021-03-25 09:54
 */
public class User {
    private static final long serialVersionUID = -66438386512418674L;

    private Integer id;

    private String username;

    private String password;
    private int r_id;

    public User() {
    }

    public User(Integer id, String username, String password, int r_id) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.r_id = r_id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getR_id() {
        return r_id;
    }

    public void setR_id(int r_id) {
        this.r_id = r_id;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", r_id=" + r_id +
                '}';
    }
}
