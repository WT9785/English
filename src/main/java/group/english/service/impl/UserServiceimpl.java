package group.english.service.impl;

import com.google.code.kaptcha.Constants;
import group.english.dao.UserDao;
import group.english.entity.User;
import group.english.result.ResponseData;
import group.english.service.UserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/*
 *@author Wss8752
 *@date 2021-03-25 09:35
 */
@Service("UserService")
public class UserServiceimpl implements UserService {
    @Resource
    private UserDao userDao;

    @Override
    public ResponseData login(String username, String password, String code, HttpServletRequest request) {
        //        验证验证码
        HttpSession session = request.getSession();
        String code1 = (String) session.getAttribute(Constants.KAPTCHA_SESSION_KEY);
        if (code1.equalsIgnoreCase(code)) {
//            执行用户名密码验证
            User sysUser = userDao.queryByName(username);
            if (sysUser != null && sysUser.getPassword().equals(password)) {
                session.setAttribute("user", sysUser);
                return new ResponseData("200", "登录成功", sysUser);
            } else {
                return new ResponseData("202", "用户名或密码错误");
            }
        } else {
            return new ResponseData("201", "验证码错误");
        }
    }

    @Override
    public ResponseData isExist(String name) {
        User user = userDao.queryByName(name);
        if (user != null)
            return new ResponseData("203", "用户已存在");
        else
            return new ResponseData("204", "用户名合法");

    }

    @Override
    public ResponseData regist(String name, String password, String registCode) {
        User user = new User();
        user.setUsername(name);
        user.setPassword(password);
        if ("666".equals(registCode))
            user.setR_id(1);
        else
            user.setR_id(0);
        System.out.println(user);
        userDao.addUser(user);
        return new ResponseData("205", "添加用户成功");
    }
}
