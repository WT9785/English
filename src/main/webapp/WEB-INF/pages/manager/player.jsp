<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/layui/layui.js"></script>
</head>
<body>
<div class="layui-container">
    <div class="layui-row layui-col-space15 margin15">
        <section class="layui-card">
            <div class="layui-card-body">
                <div class="video" id="video" data-url="http://img.ksbbs.com/asset/Mon_1703/05cacb4e02f9d9e.mp4"
                     style="width: 100%;"></div>
            </div>
        </section>
    </div>
    <h1>hqhwioqhtqiptop</h1>
</div>
<script type="text/javascript">
    layui.config({
        base: '${pageContext.request.contextPath}/layui/layui_exts/'
    }).extend({
        ckplayer: 'ckplayer/ckplayer'
    }).use(['jquery', 'ckplayer'], function () {
        var $ = layui.$,
            ckplayer = layui.ckplayer;
        var parent_json = eval("(" + parent.json + ")");
        console.log(parent_json)
        $("#video").attr("data-url", parent_json);
        var vUrl = $('#video').data('url'),
            videoObject = {
                container: '#video',
                loop: true,
                autoplay: true,
                video: [
                    [vUrl, 'video/mp4']
                ]
            };
        var player = new ckplayer(videoObject);
    });
</script>
</body>
</html>
