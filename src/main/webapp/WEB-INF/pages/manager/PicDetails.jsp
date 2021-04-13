<%--
  Created by Wss8752.
  User: WSSTJJ
  Date: 2021/3/29
  Time: 16:06
--%>
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
<table class="layui-hide" id="test" lay-filter="test"></table>
<!--自定义头工具栏-->
<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn-sm" lay-event="delSelect">删除选中行</button>
    </div>
</script>
<!--自定义行工具栏-->
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/layui/layui.js"></script>
<script>
    layui.use(['table', 'form'],
        function () {
            var table = layui.table,
                form = layui.form,
                $ = layui.jquery,
                tableIns = table.render({
                    height: 'full-200',
                    elem: '#test',
                    url: 'http://localhost:8848/English/resource/queryAllPic' //数据接口
                    ,
                    title: '用户表',
                    page: true, //开启分页

                    toolbar: '#toolbarDemo', //开启工具栏，此处显示默认图标，可以自定义模板，详见文档

                    cols: [
                        [ //表头
                            {
                                type: 'checkbox',
                                fixed: 'left'
                            }, {
                            field: 'id', //映射后台的唯一标识
                            title: 'ID',
                            sort: true,
                            fixed: 'left',
                            align: 'center'
                        }, {
                            field: 'name',
                            title: '名称',
                            align: 'center',
                            edit: 'text'
                        }, {
                            field: 'description',
                            title: '资源描述',
                            align: 'center',
                            event: 'setSign'
                        }, {
                            field: 'url',
                            title: '图片详情',
                            align: 'center',
                            templet: function (res) {
                                return "<img src='" + res.url + "' width='100px' height='100px'/>"
                            },
                            width: 100
                        }, {
                            field: 'type',
                            title: '类型',
                            align: 'center'
                        }, {
                            field: 'note',
                            title: '资源备注',
                            align: 'center'
                        }
                        ]
                    ]
                });

            //监听单元格编辑
            table.on('edit(test)', function (obj) {
                var value = obj.value //得到修改后的值
                    , data = obj.data //得到所在行所有键值
                    , field = obj.field; //得到字段
                $.ajax({
                    type: "PATCH",
                    url: "http://localhost:8848/English/resource/updateResource",
                    dataType: "json",
                    contentType: "application/json",
                    data: JSON.stringify({
                        'field': field,
                        'id': data.id,
                        'value': value
                    }),
                    success: function (res) {
                        if (res.code == 200) {
                            layer.msg(res.msg, {icon: 1})
                        } else {
                            layer.msg(res.msg, {icon: 2})
                        }
                    }
                });
            });
            //头工具栏事件
            table.on('toolbar(test)', function (obj) {
                var checkStatus = table.checkStatus(obj.config.id);
                if (obj.event == 'delSelect') {
                    if (checkStatus.data.length == 0)
                        layer.msg("您尚未选择任何数据");
                    else {
                        // layer.msg("您选择了数据:" + checkStatus.data.length);
                        layer.confirm('真的删除行么', function (index) {
                            //向服务端发送删除指令
                            $.ajax({
                                type: "POST",
                                data: JSON.stringify(checkStatus.data),
                                url: "http://localhost:8848/English/resource/delResourceBatch",
                                datatype: "json",
                                contentType: "application/json",
                                success: function (res) {
                                    if (res.code == 200) {
                                        $(".layui-form-checked").not('.header ').parents('tr ').remove();
                                        layer.msg(res.msg, {icon: 1});
                                        layer.close(index);
                                    } else {
                                        layer.msg(res.msg, {icon: 2})
                                    }
                                }
                            });
                        });
                    }
                }
            });
            //监听单元格事件
            table.on('tool(test)', function (obj) {
                var data = obj.data;
                if (obj.event === 'setSign') {
                    layer.prompt({
                        formType: 2
                        , title: '修改 ID 为 [' + data.id + '] 的资源描述'
                        , value: data.description
                    }, function (value, index) {
                        layer.close(index);
                        //这里一般是发送修改的Ajax请求
                        $.ajax({
                            type: "PATCH",
                            url: "http://localhost:8848/English/resource/updateResource",
                            dataType: "json",
                            contentType: "application/json",
                            data: JSON.stringify({
                                'field': "description",
                                'id': data.id,
                                'value': value
                            }),
                            success: function (res) {
                                if (res.code == 200) {
                                    layer.msg(res.msg, {icon: 1})
                                } else {
                                    layer.msg(res.msg, {icon: 2})
                                }
                            }
                        });
                        //同步更新表格和缓存对应的值
                        obj.update({
                            description: value
                        });
                    });
                }
            });
            //    表格重载
            $("#search").on("click", function () {
                tableIns.reload({
                    url: "http://localhost:8848/English/resource/querypicByLike",
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
