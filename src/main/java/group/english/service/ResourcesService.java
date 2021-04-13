package group.english.service;

import group.english.entity.Resource;
import group.english.result.ResponseData;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

public interface ResourcesService {
    //                                                  图片
    //    查询所有图片资源
    ResponseData queryAllPic(int page, int limit);

    //模糊查询图片信息
    ResponseData querypicByLike(String value, Integer page, Integer limit);

    //    获取首页侧边轮播图
    ResponseData querySideNavPic();

    //    查询所有图片信息并返回给前端
    ModelAndView gotoPicture();

    //                                                  音频
    //    查询所有音频资源
    ResponseData queryAllaudio(int page, int limit);

    //用户获取音频资源
    ResponseData getAllMusic();

    //模糊音频图片信息
    ResponseData queryaudioByLike(String value, Integer page, Integer limit);
//                                                      视频

    //  查询所有视频资源
    ResponseData queryAllvideo(int page, int limit);

    //模糊查询视频信息
    ResponseData queryvideoByLike(String value, Integer page, Integer limit);
//                                                      文本

    //  查询所有文本资源
    ResponseData queryAlltxt(int page, int limit);

    //模糊查询文本信息
    ResponseData querytxtByLike(String value, Integer page, Integer limit);

    //    根据id修改资源信息
    ResponseData updateResource(Resource resource);

    //    删除资源
    ResponseData delResource(Integer id);

    //    批量删除
    ResponseData delResourceBatch(List<Resource> resources);

    //添加资源
    boolean insertResource(Resource resource);

    //    根据id查询资源
    Resource queryById(Integer id);
}
