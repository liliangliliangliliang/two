<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <base href="<%=request.getContextPath()%>/"/>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@include file="layUI.jsp"%>
    <script type="text/javascript" src="jquery-2.1.0.js"></script>
    <script>
        $(function () {
            $("#name").blur(function () {
                var a=$(this).val();
                if(a==""){
                    $("#c").html("不能为空").css("color","red")
                    $("#d").prop("disabled",true)
                }else {
                    $("#c").html("")
                    $("#d").prop("disabled",false)
                }
            });
            $("#age").blur(function () {
                var b=$(this).val();
                if(b==""){
                    $("#c").html("不能为空").css("color","red")
                    $("#d").prop("disabled",true)
                }else {
                    $("#c").html("")
                    $("#d").prop("disabled",false)
                }
            })
        })
    </script>
</head>
<body>
<form action="doMem?action=update" method="post" >
    <label id="c"></label>
    ID<input type="text" value="${Member.id}" name="id" readonly><br>
    会员姓名<input type="text" value="${Member.mname}" name="mname" id="name"><br>
    性别<input type="radio" value="男" name="mgender" ${Member.mgender=='男'?'checked':''}>男
    <input type="radio" value="女" name="mgender" ${Member.mgender=='女'?'checked':''}>女<br>
    年龄<input type="text" value="${Member.mage}" name="mage" id="age"> <br>
    地址<input type="text" value="${Member.maddress}" name="maddress"><br>
    Email<input type="text" value="${Member.memail}" name="memail"><br>
    <input class="layui-btn" type="submit" value="修改"  id="d">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <input class="layui-btn" type="reset" value="重置">
</form>

</body>
</html>
