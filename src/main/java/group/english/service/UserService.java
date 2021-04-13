package group.english.service;

/*
 *@author Wss8752
 *@date 2021-03-25 09:36
 */

import group.english.result.ResponseData;

import javax.servlet.http.HttpServletRequest;

public interface UserService {
    //    用户登录验证
    ResponseData login(String username, String password, String code, HttpServletRequest request);
//    判断用户是否存在
    ResponseData isExist(String name);
//    用户注册
    ResponseData regist(String name, String password, String registCode);
}
