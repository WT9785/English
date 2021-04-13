package group.english.entity;

/*
 *@author Wss8752
 *@date 2021-04-10 19:13
 */
public class NavPic {
    private String name;
    private String navUrl;
    private String thumbsUrl;
    private String description;

    public NavPic() {
    }

    public NavPic(String name, String navUrl, String thumbsUrl, String description) {
        this.name = name;
        this.navUrl = navUrl;
        this.thumbsUrl = thumbsUrl;
        this.description = description;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getNavUrl() {
        return navUrl;
    }

    public void setNavUrl(String navUrl) {
        this.navUrl = navUrl;
    }

    public String getThumbsUrl() {
        return thumbsUrl;
    }

    public void setThumbsUrl(String thumbsUrl) {
        this.thumbsUrl = thumbsUrl;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
