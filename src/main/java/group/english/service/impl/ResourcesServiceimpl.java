package group.english.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import group.english.dao.ResourceDao;
import group.english.entity.Music;
import group.english.entity.NavPic;
import group.english.entity.Resource;
import group.english.result.ResponseCode;
import group.english.result.ResponseData;
import group.english.service.ResourcesService;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;

/*
 *@author Wss8752
 *@date 2021-03-29 15:02
 */
@Service("ResourceService")
public class ResourcesServiceimpl implements ResourcesService {
    @javax.annotation.Resource
    private ResourceDao resourceDao;

    //                                                              图片
    //查询所有图片信息
    @Override
    public ResponseData queryAllPic(int page, int limit) {
        PageHelper.startPage(page, limit);
        List<Resource> resources = resourceDao.queryAllPic();
        PageInfo<Resource> pageInfo = new PageInfo<>(resources);
        return new ResponseData("0", "查询成功", resources, (int) pageInfo.getTotal());
    }

    @Override
    public ResponseData querypicByLike(String value, Integer page, Integer limit) {
        PageHelper.startPage(page, limit);
        List<Resource> resources = resourceDao.querypicByLike(value);
        PageInfo<Resource> pageInfo = new PageInfo<>(resources);
        return new ResponseData("0", "查询成功", resources, (int) pageInfo.getTotal());
    }

    @Override
    public ResponseData querySideNavPic() {
        List<Resource> resources = resourceDao.querySideNavPic();
        return new ResponseData(ResponseCode.SUCCESS, resources);
    }

    @Override
    public ModelAndView gotoPicture() {
//        获取轮播图
        List<Resource> navPic = resourceDao.queryCenterNavPic();
//        获取轮播缩略图
        List<Resource> thumbnail = resourceDao.queryThumbnail();
//        获取图拍你详情页图片
        List<Resource> resources = resourceDao.querycPic();
//        定义轮播图资源存储实体类
        List<NavPic> navPics = new ArrayList<>();
        ModelAndView modelAndView = new ModelAndView();
        //        将前端需要的资源封装在实体类NavPic中
        for (int i = 0; i < navPic.size(); i++) {
            NavPic nav = new NavPic();
            nav.setName(navPic.get(i).getName());
            nav.setNavUrl(navPic.get(i).getUrl());
            nav.setThumbsUrl(thumbnail.get(i).getUrl());
            nav.setDescription(navPic.get(i).getDescription());
            navPics.add(nav);
        }
//        图片页详情资源
        modelAndView.addObject("resources", resources);
//        添加轮播图资源
        modelAndView.addObject("navPics",navPics);
        modelAndView.setViewName("user/Picture");
        return modelAndView;
    }

    //                                                              音频
    @Override
    public ResponseData queryAllaudio(int page, int limit) {
        PageHelper.startPage(page, limit);
        List<Resource> resources = resourceDao.queryAllaudio();
        PageInfo<Resource> pageInfo = new PageInfo<>(resources);
        return new ResponseData("0", "查询成功", resources, (int) pageInfo.getTotal());
    }

    @Override
    public ResponseData getAllMusic() {
        List<Music> musics = new ArrayList<>();
//        获取所有音频资源
        List<Resource> resources = resourceDao.queryAllaudio();
        for (Resource resource : resources) {
            String note = resource.getNote();
            String[] split = note.split(",");
            String musictime = split[0];
            String artist = split[1];
            musics.add(new Music(artist, resource.getName(), resource.getUrl(), musictime));
//            将资源类型转换为音频资源，返回给前端
        }
        return new ResponseData(ResponseCode.SUCCESS, musics);
    }

    @Override
    public ResponseData queryaudioByLike(String value, Integer page, Integer limit) {
        PageHelper.startPage(page, limit);
        List<Resource> resources = resourceDao.queryaudioByLike(value);
        PageInfo<Resource> pageInfo = new PageInfo<>(resources);
        return new ResponseData("0", "查询成功", resources, (int) pageInfo.getTotal());
    }

    //                                                              视频
    @Override
    public ResponseData queryAllvideo(int page, int limit) {
        PageHelper.startPage(page, limit);
        List<Resource> resources = resourceDao.queryAllvideo();
        PageInfo<Resource> pageInfo = new PageInfo<>(resources);
        return new ResponseData("0", "查询成功", resources, (int) pageInfo.getTotal());
    }

    @Override
    public ResponseData queryvideoByLike(String value, Integer page, Integer limit) {
        PageHelper.startPage(page, limit);
        List<Resource> resources = resourceDao.queryvideoByLike(value);
        PageInfo<Resource> pageInfo = new PageInfo<>(resources);
        return new ResponseData("0", "查询成功", resources, (int) pageInfo.getTotal());
    }

    //                                                              文本
    @Override
    public ResponseData queryAlltxt(int page, int limit) {
        PageHelper.startPage(page, limit);
        List<Resource> resources = resourceDao.queryAlltxt();
        PageInfo<Resource> pageInfo = new PageInfo<>(resources);
        return new ResponseData("0", "查询成功", resources, (int) pageInfo.getTotal());
    }

    @Override
    public ResponseData querytxtByLike(String value, Integer page, Integer limit) {
        PageHelper.startPage(page, limit);
        List<Resource> resources = resourceDao.querytxtByLike(value);
        PageInfo<Resource> pageInfo = new PageInfo<>(resources);
        return new ResponseData("0", "查询成功", resources, (int) pageInfo.getTotal());
    }

    @Override
    public ResponseData updateResource(Resource resource) {
        try {
//            判断field的类型
            if (resource.getField() != null && resource.getField() != "" && resource.getValue() != null) {
                if (resource.getField().equals("type")) {
                    resource.setType(resource.getValue());
                } else if (resource.getField().equals("name")) {
                    resource.setName(resource.getValue());
                } else if (resource.getField().equals("description")) {
                    resource.setDescription(resource.getValue());
                }
            }
            System.out.println(resource);
            int update = this.resourceDao.updateResource(resource);
            if (update > 0) {
                return new ResponseData(ResponseCode.SUCCESS);
            } else {
                return new ResponseData(ResponseCode.FAILED);
            }
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseData(ResponseCode.FAILED);
        }
    }

    //根据id删除资源
    @Override
    public ResponseData delResource(Integer id) {
        boolean b = resourceDao.delResource(id);
        if (b)
            return new ResponseData(ResponseCode.SUCCESS);
        else
            return new ResponseData(ResponseCode.FAILED);
    }

    //批量删除
    @Override
    public ResponseData delResourceBatch(List<Resource> resources) {
        List<Integer> ids = new ArrayList<>();
        for (Resource resource : resources) {
            ids.add(resource.getId());
        }
        boolean b = resourceDao.delResourceBatch(ids);
        if (b)
            return new ResponseData(ResponseCode.SUCCESS);
        else
            return new ResponseData(ResponseCode.FAILED);
    }

    @Override
    public boolean insertResource(Resource resource) {
        return resourceDao.insertResource(resource) > 0;
    }

    @Override
    public Resource queryById(Integer id) {
        return resourceDao.queryById(id);
    }
}
