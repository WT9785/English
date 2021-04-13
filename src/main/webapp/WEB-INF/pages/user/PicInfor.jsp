<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>图片详情页</title>
    <style>
        body {
            background-image: url(${pageContext.request.contextPath}/images/user/pictures/bac.png);
        }
    </style>
</head>
<body>
<div style="text-align: center;">
    <h1 style="text-align: center;color:#8B008B;">${resource.name}</h1>
    <div style="width: 50%;height: 300px;margin:0 auto ;float: right;">
        <img src="${resource.url}" style="width:100%;heigth:100%;"/>
    </div>
    <div style="width: 40%;float: left;color:#000000;font-size: 20px;">
        ${resource.description}
    </div>
</div>
</body>
</html>