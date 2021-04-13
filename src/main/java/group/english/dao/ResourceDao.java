package group.english.dao;

import group.english.entity.Resource;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/*
 *@author Wss8752
 *@date 2021-03-29 15:01
 */

public interface ResourceDao {
    //                                                                                  图片
    //    查询所有图片信息
    List<Resource> queryAllPic();

    List<Resource> querypicByLike(@Param("value") String value);

    //    获取首页侧边导航栏图片
    List<Resource> querySideNavPic();

    //    获取图片详情页轮播图
    List<Resource> queryCenterNavPic();

    //    获取首页路没播图缩略图
    List<Resource> queryThumbnail();

    //获取图片详情页图片
    List<Resource> querycPic();

    //                                                                              音频
    //    查询所有音频信息
    List<Resource> queryAllaudio();

    List<Resource> queryaudioByLike(@Param("value") String value);

    //                                                                              视频
    //    查询所有视频信息
    List<Resource> queryAllvideo();

    List<Resource> queryvideoByLike(@Param("value") String value);

    //                                                                               文本

    //    查询所有文本信息
    List<Resource> queryAlltxt();

    List<Resource> querytxtByLike(@Param("value") String value);

    //    修改资源信息
    int updateResource(Resource resource);

    //    删除资源
    boolean delResource(Integer id);

    //    批量删除
    boolean delResourceBatch(@Param("ids") List<Integer> ids);

    //    添加资源
    int insertResource(Resource resource);
    //    根据id获取资源
    Resource queryById(Integer id);
}
