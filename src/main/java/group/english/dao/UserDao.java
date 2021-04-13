package group.english.dao;

import group.english.entity.User;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

public interface UserDao {
    //根据用户名查询用户
    @Select("<script>select\n" +
            "          id, username, password,r_id\n" +
            "        from user\n" +
            "        <where>\n" +
            "            <if test=\"username != '' || username != null\">\n" +
            "                username=#{username}\n" +
            "            </if>\n" +
            "        </where></script>")
    User queryByName(String name);

    //    用户注册
    @Insert("insert into user(username,password,r_id)values(#{username},#{password},#{r_id}) ")
    void addUser(User user);
}
