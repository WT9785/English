package group.english.entity;

/*
 *@author Wss8752
 *@date 2021-04-09 14:40
 */
public class Music {
    private String artist;
    private String musicName;
    public final String musicAlbum = "";
    private String musicURL;
    public final String avatarURL = "";
    private String musicTime;

    public Music() {
    }

    public Music(String artist, String musicName, String musicURL, String musicTime) {
        this.artist = artist;
        this.musicName = musicName;
        this.musicURL = musicURL;
        this.musicTime = musicTime;
    }

    public String getArtist() {
        return artist;
    }

    public void setArtist(String artist) {
        this.artist = artist;
    }

    public String getMusicName() {
        return musicName;
    }

    public void setMusicName(String musicName) {
        this.musicName = musicName;
    }

    public String getMusicURL() {
        return musicURL;
    }

    public void setMusicURL(String musicURL) {
        this.musicURL = musicURL;
    }

    public String getMusicTime() {
        return musicTime;
    }

    public void setMusicTime(String musicTime) {
        this.musicTime = musicTime;
    }

    @Override
    public String toString() {
        return "Music{" +
                "artist='" + artist + '\'' +
                ", musicName='" + musicName + '\'' +
                ", musicURL='" + musicURL + '\'' +
                ", musicTime='" + musicTime + '\'' +
                '}';
    }
}
