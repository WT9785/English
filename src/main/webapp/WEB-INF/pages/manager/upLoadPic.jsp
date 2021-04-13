<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css"/>
    <style type="text/css">
        .uploadPic {
            margin-left: 33%;
        }

        #test10 {
            margin-left: 5%;
        }
    </style>
</head>

<body>
<div class="uploadPic">
    <form class="layui-form" action="">
        <div class="layui-form-item">
            <label class="layui-form-label">标题</label>
            <div class="layui-input-inline">
                <input type="text" name="title" lay-verify="title" autocomplete="off" placeholder="请输入标题"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">类型</label>
            <div class="layui-input-inline">
                <input type="text" name="type" autocomplete="off" placeholder="请输入类型" class="layui-input">
            </div>
        </div>
        <div class="layui-upload-drag" id="test10">
            <i class="layui-icon"></i>
            <p>点击上传，或将文件拖拽到此处</p>
            <div class="layui-hide" id="uploadDemoView">
                <hr>
                <%--                <img src="" alt="上传成功后渲染" style="max-width: 196px">--%>
                <i class="layui-icon" style="font-size: 30px; color: #1E9FFF;">&#xe605;</i>
                <input type="text" name="url" class="layui-input layui-hide">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button type="submit" class="layui-btn" lay-submit="" lay-filter="sub">立即提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/layui/layui.js"></script>
<script>
    layui.use(['upload', 'form'], function () {
        var $ = layui.jquery,
            upload = layui.upload,
            form = layui.form;
        upload.render({
            elem: '#test10',
            accept: 'file',
            url: 'http://localhost:8848/English/home/uploadFile'
            ,
            done: function (res) {
                layer.msg(res.msg);
                layui.$('#uploadDemoView').removeClass('layui-hide').find('img').attr('src', res.data);
                layui.$('#uploadDemoView').find('input').attr('value', res.data);
                console.log(res.data);

            }
        });
        form.on('submit(sub)', function (data) {
            console.log(data.field) //当前容器的全部表单字段，键值对形式：{name: value}
            $.ajax({
                type: 'POST',
                url: "http://localhost:8848/English/resource/insertResource",
                contentType: "application/json",
                data: JSON.stringify(data.field),
                dataType: "json",
                success: function (res) {
                    layer.msg(res.msg);
                }
            })
            return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
        });
    });
</script>
</body>
</html>
