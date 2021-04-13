<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <!-- CSS
  ================================================== -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/Picture/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/Picture/responsive.css">
    <link rel='stylesheet' href="${pageContext.request.contextPath}/css/user/Picture/camera.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css" media="all">
    <!--Js-->
    <script src="${pageContext.request.contextPath}/layui/layui.js"></script>
    <script type='text/javascript' src='${pageContext.request.contextPath}/js/jquery.min.js'></script>
    <script type='text/javascript'
            src='${pageContext.request.contextPath}/js/user/Picture/jquery.easing.1.3.js'></script>
    <script type='text/javascript' src='${pageContext.request.contextPath}/js/user/Picture/camera.min.js'></script>
    <script>
        jQuery(function () {
            jQuery('#camera_wrap').camera({
                height: '400px',
                loader: 'bar',
                pagination: false,
                thumbnails: true
            });
        });
    </script>

</head>
<body>
<!--------------Header--------------->

<div class="copyrights">Collect from <a href="#">Website Template</a></div>

<!--------------Content--------------->
<section id="content">
    <%--<div class="feature">
        <div class="camera_wrap camera_magenta_skin" id="camera_wrap">
            <c:forEach items="${navPics}" var="j">
                <div data-thumb="${j.thumbsUrl}" data-src="${j.navUrl}">
                    <div class="camera_caption fadeFromBottom">
                        ${j.name}<em>Try to resize the browser window</em>
                    </div>
                </div>
            </c:forEach>
        </div>
        <div style="clear:both; display:block; height:10px"></div>
    </div>--%>
    <div class="layui-carousel" id="test10">
        <div carousel-item="">
            <c:forEach items="${navPics}" var="j">
                <div><img src="${j.navUrl}"></div>
            </c:forEach>
        </div>
    </div>
    <div class="welcome">
        <p>All picture resources on this website are reprinted online. <a href="#" style="color: #da251d;">EnglishResources</a>.
            If some of these resources infringe your rights, please contact the
            administrator to delete them. At the same time, users are also welcome to download all kinds of
            resources you like and share this website with those around you. friend</p>
    </div>
    <div class="zerogrid">
        <div class="row block01">
            <c:forEach items="${resources}" var="i">
                <div class="col-1-3">
                    <article>
                        <a href="http://localhost:8848/English/home/PicInfor/${i.id}"><img src="${i.url}" class="grayscale"/>
                            <h2>${i.name}</h2></a>
                    </article>
                </div>
            </c:forEach>
        </div>
    </div>
</section>
<!--------------Footer--------------->
<footer>
    <div class="zerogrid">
        <div class="row block02">
            <section class="col-1-3">
                <div class="heading"><h2>About us</h2></div>
                <div class="content">
                    <p>All picture resources on this website are reprinted online. <a href="#" style="color: #da251d;">EnglishResources</a>.
                        If some of these resources infringe your rights, please contact the
                        administrator to delete them. At the same time, users are also welcome to download all kinds of
                        resources you like and share this website with those around you. friend</p>
                </div>
            </section>
            <section class="col-1-3">
                <div class="heading"><h2>链接推荐</h2></div>
                <div class="content">
                    <ul>
                        <li><a href="http://www.java1234.com/" target="_blank">Java知识分享网-免费Java资源下载</a></li>
                        <li><a href="https://www.javaxxbj.com/" target="_blank">Java学习笔记网</a></li>
                        <li><a href="http://www.js-css.cn/" target="_blank">JS代码网 - 专注JS代码和CSS样式</a></li>
                    </ul>
                </div>
            </section>
            <section class="col-1-3">
                <div class="heading"><h2>Popular Post</h2></div>
                <div class="content">
                    <div class="post">
                        <img src="${pageContext.request.contextPath}/images/user/pictures/port1.jpg"/>
                        <h4><a href="#">Lorem ipsum dolor sit amet</a></h4>
                        <p>April 06 ,2021</p>
                    </div>
                    <div class="post">
                        <img src="${pageContext.request.contextPath}/images/user/pictures/port2.jpg"/>
                        <h4><a href="#">Lorem ipsum dolor sit amet</a></h4>
                        <p>March 07 ,2021</p>
                    </div>
                    <div class="post">
                        <img src="${pageContext.request.contextPath}/images/user/pictures/port3.jpg"/>
                        <h4><a href="#">Lorem ipsum dolor sit amet</a></h4>
                        <p>February 08 ,2021</p>
                    </div>
                </div>
            </section>
        </div>
    </div>
</footer>
<script>
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
