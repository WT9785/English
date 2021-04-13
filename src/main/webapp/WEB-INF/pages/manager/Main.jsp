<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>管理员首页</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
</head>

<body>
<br><br><br><br>
<h2 style="text-align: center;font-size: 20px">
    当前时间：
    <jsp:useBean id="now" class="java.util.Date" scope="page"/>
    <fmt:formatDate value="${now}" pattern="yyyy年MM月dd日"/>
</h2><br>

<h3 style="text-align: center;font-size: 30px">欢迎您:${sessionScope.user.username}</h3>
<br>

<%--添加日历功能--%>
<div class="site-demo-laydate" style="text-align: center">
    <div class="layui-inline" id="test-n1"></div>
</div>
<script src="${pageContext.request.contextPath}/layui/layui.js" charset="utf-8"></script>
<script>
    layui.use('laydate', function () {
        var laydate = layui.laydate;
        //直接嵌套显示
        laydate.render({
            elem: '#test-n1'
            , position: 'static',
            calendar: true //是否开启公历重要节日
        });
    });
</script>

</body>
</html>