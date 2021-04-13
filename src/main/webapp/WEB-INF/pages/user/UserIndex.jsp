<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/user.css" media="all">
    <script src="${pageContext.request.contextPath}/layui/layui.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/user/canvas-particle.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script type="text/javascript">

        var lbc = $("#lbc")
        $.ajax({
            url: "http://localhost:8848/English/resource/querySideNavPic",
            type: "GET",
            dataType: "json",
            success: function (data) {
                $.each(data.data, function (index, obj) {
                    lbc.append("<div><img src='" + obj.url + "'></div>")
                })
            }
        });
        $(function () {
            var config = {
                vx: 4,
                vy: 4,
                height: 2,
                width: 2,
                count: 100,
                color: "121, 162, 185",
                stroke: "100,200,180",
                dist: 6000,
                e_dist: 20000,
                max_conn: 10
            }
            CanvasParticle(config);
        })
    </script>
</head>

<body>
<!--Logo-->
<div class="logo">
    <a href="#">
        <img src="${pageContext.request.contextPath}/images/user/logo.png" class="right"/>
        <img src="${pageContext.request.contextPath}/images/user/logo_txt.png" class="left"/>
    </a>
</div>
<!--导航栏-->
<ul class="layui-nav " style="text-align: center;">
    <li class="layui-nav-item layui-this"><a href="getMain" target="ifr">首页</a></li>
    <li class="layui-nav-item"><a href="musicPlayer" target="ifr">英语歌曲</a></li>
    <li class="layui-nav-item"><a href="Vedio" target="ifr">英语视频</a></li>
    <li class="layui-nav-item"><a href="Picture" target="ifr">英语图片</a></li>
    <li class="layui-nav-item"><a href="ConnectUs" target="ifr">联系我们</a></li>
    <li class="layui-nav-item" style="float: right;">
        <a href="javascript:;"><img src="//t.cn/RCzsdCq" class="layui-nav-img">我</a>
        <dl class="layui-nav-child">
            <dd><a href="/home/logout">退了</a></dd>
        </dl>
    </li>
</ul>
<!--侧边轮播图-->
<div class="lbPic">
    <div class="layui-carousel" id="test10">
        <div carousel-item id="lbc">

        </div>
    </div>
</div>
<div class="middleContainer">
    <!--主内容展示区-->
    <div class="mainContent">
        <!--实现页面的局部跳转-->
        <iframe src="getMain" width="100%" height="100%" name="ifr"></iframe>
    </div>

</div>
<br><br><br><br>
<!--底部信息展示-->
<div class="aboutUs">
    <a href="#">
        本站内容均为网友分享，严禁商用。本站不制作不储存相关资料，对内容不承担任何责任和义务。如有侵犯，请及时通知我们予以删除。<br>
        Copyright ©2021 英语资源网 投诉Email:Wss8752@qq.com
    </a>
</div>
<script>
    layui.use('element', function () {
        var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块
        //监听导航点击
        element.on('nav(demo)', function (elem) {
            //console.log(elem)
            layer.msg(elem.text());
        });
    });
    layui.use('carousel', function () {
        var carousel = layui.carousel;
        //建造实例
        carousel.render({
            elem: '#test10',
            width: '100%', //设置容器宽度
            height: '490px',
            arrow: 'always' //始终显示箭头
            //,anim: 'updown' //切换动画方式
            ,
            anim: 'fade',
        });
    });
</script>

</body>

</html>