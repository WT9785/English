<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>英语资源网</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
    <script>
        //注销时确认
        function isLogoff() {
            layui.use(['layer', 'jquery'], function () {
                var layer = layui.layer,
                    $ = layui.$;
                layer.confirm('确认注销', function (index) {
                    layer.close(index);
                    //向服务端发送注销指令
                    $.ajax({
                        url: "logout",
                        type: "GET",
                        dataType: "json",
                        success: function (data) {
                            window.location.href = "login";
                        }
                    });
                })
            });
        }
    </script>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">英语资源网管理系统</div>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
                    ${sessionScope.user.username}
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="">基本资料</a></dd>
                    <dd><a href="">安全设置</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a href="javascript:isLogoff()">退了</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree" lay-filter="test">
                <li class="layui-nav-item layui-nav-itemed">
                    <a class="" href="javascript:;">图片管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="PicDetails" target="ifr">图片信息</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item ">
                    <a class="" href="javascript:;">音频管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="AudioDetails" target="ifr">音频信息</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item ">
                    <a class="" href="javascript:;">视频管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="VideoDetails;" target="ifr">视频详情</a></dd>
                    </dl>
                </li>
<%--                文本管理--%>
                <%--<li class="layui-nav-item ">
                    <a class="" href="javascript:;">文本管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;" target="ifr">文本信息</a></dd>
                    </dl>
                </li>--%>
                </li>
                <li class="layui-nav-item layui-nav-itemed">
                    <a class="" href="javascript:;">资源管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="uploadPic" target="ifr">上传资源</a></dd>
                    </dl>
                </li>
            </ul>
        </div>
    </div>

    <div class="layui-body">
        <!--实现页面的局部跳转-->
        <iframe src="getMain" width="100%" height="100%" name="ifr"></iframe>
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        © wss8752@qq.com 链接地址
    </div>
</div>
<script src="${pageContext.request.contextPath}/layui/layui.js"></script>
<script>
    //JavaScript代码区域
    layui.use('element', function () {
        var element = layui.element;

    });
</script>
</body>
</html>