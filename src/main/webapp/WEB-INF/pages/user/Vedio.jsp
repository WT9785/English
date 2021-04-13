<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css"/>
</head>

<body>
<!--搜索栏-->
<div class="demoTable">
    <div class="layui-inline">
        <input class="layui-input" name="conditions" id="conditions" autocomplete="off">
    </div>
    <button class="layui-btn" id="search">搜索</button>
</div>
<!--
点击搜索
获取input值
向服务器发送请求
重新渲染table
-->
<table class="layui-hide" id="demo" lay-filter="test"></table>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/layui/layui.js"></script>
<script>
    layui.use(['table', 'form'],
        function () {
            var table = layui.table,
                form = layui.form,
                $ = layui.jquery,
                tableIns = table.render({
                    elem: '#demo',
                    height: 'full-200',
                    cellMinWidth: 80,
                    url: 'http://localhost:8848/English/resource/queryAllvideo' //数据接口
                    ,
                    title: '用户表',
                    page: true, //开启分页
                    cols: [
                        [ //表头
                            {
                            field: 'id', //映射后台的唯一标识
                            title: 'ID',
                            sort: true,
                            fixed: 'left',
                            align: 'center'
                        }, {
                            field: 'name',
                            title: '名称',
                            align: 'center',
                        }, {
                            field: 'description',
                            title: '资源描述',
                            align: 'center',
                            event: 'setSign'
                        }, {
                            field: 'url',
                            title: '视频详情',
                            align: 'center',
                            event: 'gotoPlayer'
                        }, {
                            field: 'type',
                            title: '类型',
                            align: 'center',
                        }
                        ]
                    ]
                });
            //监听单元格事件
            table.on('tool(test)', function (obj) {
                var data = obj.data;
                if (obj.event === 'gotoPlayer') {
                    //    跳转到播放界面
                    json = JSON.stringify(data.url);
                    layui.use('layer', function () {
                        layer.open({
                            title: '播放界面',
                            maxmin: true,
                            skin: 'layui-layer-molv',
                            type: 2,
                            content: 'player',
                            area: ['1100px', '500px'],
                        });
                    });
                }
            });
            //    表格重载
            $("#search").on("click", function () {
                tableIns.reload({
                    url: "http://localhost:8848/English/resource/queryvideoByLike",
                    where: {
                        value: $("#conditions").val()
                    },
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                });

            })
        });
</script>

</html>
