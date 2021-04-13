package group.english.entity;

/*
 *@author Wss8752
 *@date 2021-03-29 13:50
 */
//资源实体类
public class Resource {
    //    资源id
    private int id;
    //    资源的名字
    private String name;
    //    资源路径
    private String url;
    //    资源详情
    private String description;
    //    资源类型
    private String type;
    //    资源备注
    private String note;
    //    前端修改映射字段
    private String field;
    private String value;

    public Resource() {
    }

    public Resource(int id, String name, String url, String description, String type, String note, String field, String value) {
        this.id = id;
        this.name = name;
        this.url = url;
        this.description = description;
        this.type = type;
        this.note = note;
        this.field = field;
        this.value = value;
    }

    public String getField() {
        return field;
    }

    public void setField(String field) {
        this.field = field;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    @Override
    public String toString() {
        return "Resource{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", url='" + url + '\'' +
                ", description='" + description + '\'' +
                ", type='" + type + '\'' +
                ", note='" + note + '\'' +
                ", field='" + field + '\'' +
                ", value='" + value + '\'' +
                '}';
    }
}
