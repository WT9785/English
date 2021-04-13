package group.english.controller;

//import cn.dsna.util.images.ValidateCode;

import com.google.code.kaptcha.Constants;
import com.google.code.kaptcha.Producer;
import group.english.entity.Resource;
import group.english.result.ResponseCode;
import group.english.result.ResponseData;
import group.english.service.ResourcesService;
import group.english.service.UserService;
import group.english.utils.UpUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.IOException;

/*
 *@author Wss8752
 *@date 2021-03-24 16:54
 */
@Controller
@RequestMapping("home")
public class HomeController {
    @Autowired
    private ResourcesService resourcesService;
    //    生成验证码的变量
    @Autowired
    private Producer captchaProducer;
    //    登录逻辑处理变量
    @Autowired
    private UserService UserService;
    @Autowired
    private HttpServletRequest request;

    //    跳转到登陆页面
    @RequestMapping("login")
    public String login() {
        return "login";
    }

    //登录处理逻辑
    @RequestMapping(value = "CheckLogin", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
    @ResponseBody
    public ResponseData login(String name, String password, String code, HttpServletRequest request) {
        ResponseData dataL = UserService.login(name, password, code, request);
        return dataL;
    }

    //    注销登录
    @RequestMapping(value = "logout", method = RequestMethod.GET)
    public void logout() {
        request.getSession().removeAttribute("user");
    }

    //    判断用户是否存在
    @RequestMapping("isExist")
    @ResponseBody
    public ResponseData isExist(String name) {
        return UserService.isExist(name);
    }

    //用户注册
    @RequestMapping("regist")
    @ResponseBody
    public ResponseData regist(String name, String password, String registCode) {
        return UserService.regist(name, password, registCode);
    }

    /**
     * 获取验证码图片
     *
     * @param request
     * @param response
     * @return
     * @throws IOException Created        2017年1月17日 下午5:07:28
     * @author ccg
     */
    @RequestMapping("getCaptchaCode")
    public ModelAndView getCaptchaCode(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();

        response.setDateHeader("Expires", 0);
        response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");
        response.addHeader("Cache-Control", "post-check=0, pre-check=0");
        response.setHeader("Pragma", "no-cache");
        response.setContentType("image/jpeg");

        //生成验证码文本
        String ValiadCode = captchaProducer.createText();
        session.setAttribute(Constants.KAPTCHA_SESSION_KEY, ValiadCode);
        //利用生成的字符串构建图片
        BufferedImage bi = captchaProducer.createImage(ValiadCode);
        ServletOutputStream out = response.getOutputStream();
        ImageIO.write(bi, "jpg", out);

        try {
            out.flush();
        } finally {
            out.close();
        }
        return null;
    }

    //    上传文件
    @RequestMapping("uploadFile")
    @ResponseBody
    public ResponseData uploadFile(MultipartFile file, HttpServletRequest request) {
//        实现文件上传，成功以后返回一个地址
        String upfile = UpUtils.upfile(file, request);
        if (upfile == null) {
            return new ResponseData(ResponseCode.FAILED);
        } else {
            return new ResponseData(ResponseCode.SUCCESS, upfile);
        }
    }

    //    欢迎界面
    @RequestMapping("getMain")
    public String getMain() {
        return "manager/Main";
    }

    //                                                    管理员
    //    跳转到管理员界面
    @RequestMapping("managerIndex")
    public String gotoManager() {
        return "manager/managerIndex";
    }

    //    跳转到图片管理页面
    @RequestMapping("PicDetails")
    public String gotoPicDetails() {
        return "manager/PicDetails";
    }

    //    跳转到音频管理界面
    @RequestMapping("AudioDetails")
    public String gotoAudioDetails() {
        return "manager/AudioDetails";
    }

    //    跳转到视频管理界面
    @RequestMapping("VideoDetails")
    public String gotoVedioDetails() {
        return "manager/VideoDetails";
    }

    //跳转到视频播放界面
    @RequestMapping("player")
    public String gotoplayer() {
        return "manager/player";
    }

    //    跳转到上传图片界面
    @RequestMapping("uploadPic")
    public String gotUploadPic() {
        return "manager/upLoadPic";
    }

    //                                                  普通用户
    //    跳转到普通用户界面
    @RequestMapping("UserIndex")
    public String gotoUser() {
        return "user/UserIndex";
    }

    //    跳转到音乐播放界面
    @RequestMapping("musicPlayer")
    public String gotomusicPlayer() {
        return "user/musicPlayer";
    }

    //      跳转到图片浏览界面
    @RequestMapping("Picture")
    public ModelAndView gotoPicture() {
        return resourcesService.gotoPicture();
    }

    //    跳转到图片详情界面
    @RequestMapping("PicInfor/{rid}")
    public ModelAndView gotoPicInfor(@PathVariable("rid") @RequestBody Integer rid) {
        Resource resource = resourcesService.queryById(rid);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("resource", resource);
        modelAndView.setViewName("user/PicInfor");
        return modelAndView;
    }

    //    跳转到问题反馈界面
    @RequestMapping("ConnectUs")
    public String gotoConnectUs() {
        return "user/ConnectUs";
    }

    //    跳转到视频界面
    @RequestMapping("Vedio")
    public String gotoVedio() {
        return "user/Vedio";
    }
}
