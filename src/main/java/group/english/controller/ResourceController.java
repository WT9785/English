package group.english.controller;

import group.english.entity.Resource;
import group.english.result.ResponseCode;
import group.english.result.ResponseData;
import group.english.service.ResourcesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/*
 *@author Wss8752
 *@date 2021-03-29 15:01
 */
@RequestMapping("resource")
@RestController//默认返回json数据
public class ResourceController {
    @Autowired
    private ResourcesService resourcesService;
//                                                      图片

    //    获取所有图片信息
    @RequestMapping("queryAllPic")
    @ResponseBody
    public ResponseData queryAllPic(Integer page, Integer limit) {
        return resourcesService.queryAllPic(page, limit);
    }
    //    图片模糊查询
    @GetMapping("querypicByLike")
    public ResponseData querypicByLike(String value, Integer page, Integer limit) {
        return resourcesService.querypicByLike(value, page, limit);
    }
//    获取首页侧边轮播图
    @RequestMapping("querySideNavPic")
    public ResponseData querySideNavPic(){
        return resourcesService.querySideNavPic();
    }
//    获取轮播图
//                                                      音频

    //    获取所有音频信息
    @RequestMapping("queryAllaudio")
    @ResponseBody
    public ResponseData queryAllaudio(Integer page, Integer limit) {
        return resourcesService.queryAllaudio(page, limit);
    }
    //    音频模糊查询
    @GetMapping("queryaudioByLike")
    public ResponseData queryaudioByLike(String value, Integer page, Integer limit) {
        return resourcesService.queryaudioByLike(value, page, limit);
    }
//    用户获取音频
    @RequestMapping("getAllMusic")
    public ResponseData getAllMusic(){
        return resourcesService.getAllMusic();
    }

    //                                                  视频
    //    获取所有视频信息
    @RequestMapping("queryAllvideo")
    @ResponseBody
    public ResponseData queryAllvideo(Integer page, Integer limit) {
        return resourcesService.queryAllvideo(page, limit);
    }
    //   视频模糊查询
    @GetMapping("queryvideoByLike")
    public ResponseData queryvideoByLike(String value, Integer page, Integer limit) {
        return resourcesService.queryvideoByLike(value, page, limit);
    }
    //                                                      文本
    //    获取所有文本信息
    @RequestMapping("queryAlltxt")
    @ResponseBody
    public ResponseData queryAlltxt(Integer page, Integer limit) {
        return resourcesService.queryAlltxt(page, limit);
    }
    //   文本模糊查询
    @GetMapping("querytxtByLike")
    public ResponseData querytxtByLike(String value, Integer page, Integer limit) {
        return resourcesService.querytxtByLike(value, page, limit);
    }

    //    更新资源信息
    @RequestMapping("updateResource")

    public ResponseData updatePic(@RequestBody Resource resource) {
        return resourcesService.updateResource(resource);
    }

    //    删除资源
    @DeleteMapping("delResource/{id}")
    public ResponseData delResource(@PathVariable("id") Integer id) {
        System.out.println(id);
        return resourcesService.delResource(id);
    }

    //    批量删除资源
    @RequestMapping("delResourceBatch")
    public ResponseData delResourceBatch(@RequestBody List<Resource> resources) {
        System.out.println(resources);
        return resourcesService.delResourceBatch(resources);
    }

    //    添加资源
    @PostMapping("insertResource")
    public ResponseData insertPic(@RequestBody Resource resource) {
        boolean b = resourcesService.insertResource(resource);
        if (b) {
            return new ResponseData(ResponseCode.SUCCESS);
        } else {
            return new ResponseData(ResponseCode.FAILED);
        }
    }


}
