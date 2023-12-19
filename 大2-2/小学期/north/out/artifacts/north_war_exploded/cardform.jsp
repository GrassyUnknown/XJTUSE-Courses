<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<html>

<script>
    <%--//非法登录校验--%>
    if (<%=session.getAttribute("uname")==null%>){
        alert("您尚未登录，请登录")
        window.location.href="login.html"
    }
    if (<%=(Integer) session.getAttribute("uroot")==2%>){
        alert("您没有访问此功能的权限！")
        window.location.href="CardList.jsp"
    }

</script>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>添加校园卡</title>
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <script language="JavaScript" src="js/jquery.js"></script>
</head>

<body>

<div class="place">
    <span>位置：</span>
    <ul class="placeul">
        <li><a href="#">校园IC卡管理</a></li>
        <li><a href="#">添加卡片</a></li>
    </ul>
</div>

<div class="formbody">

    <div class="formtitle">
        <span id="ftitle">第一步：填写持有人信息</span>
    </div>

    <ul class="forminfo">
        <form action="" method="post" id="user" name="addUserform">
            <li id="uid"><label>持有人编号</label><input name="uid" type="text" class="dfinput" id="uidinput" /></li>
            <li id="uname"><label>持有人姓名</label><input name="uname" type="text" class="dfinput" id="unameinput" /></li>

            <li style="display: none" id="cardid"><label>校园卡编号</label><input name="cardid" type="text" class="dfinput" /></li>
            <li style="display: none" id="cardbalance"><label>校园卡余额</label><input name="cardbalance" type="text" class="dfinput" /></li>
        </form>

            <li id="next"><label>&nbsp;</label><input name="" type="button" onclick="next()" class="btn" value="下一步" /></li>
            <li style="display: none" id="submit">
            <input name="" type="button" onclick="location.reload()" class="btn" value="上一步" />
            <input name="" type="button" onclick="submit()" class="btn" value="提交" /></li>

    </ul>





</div>


</body>
<script type="text/javascript">
    function next(){
        $.get("addCard", $('#user').serialize(), function(data){
            if(data == 1){
                subForm();
            }
            else{
                alert("您输入的持有人信息不正确！")
            }
        })
    }
    function subForm(){
        //移除按钮“下一步”，将其他信息调整为可见
        document.getElementById("next").remove();

        document.getElementById("cardid").style="";
        document.getElementById("cardbalance").style="";
        document.getElementById("submit").style="";

        document.getElementById("uid").style="display : none";
        document.getElementById("uname").style="display : none";

        document.getElementById("ftitle").innerHTML="第二步：填写卡片信息";
    }
    //按钮提交表单
    function submit() {
        //参数1，路径，参数2数据，参数3：方法回调函数。参数，返回值类型
        $.post("addCard",$('#user').serialize(),function (data){
            if (data=="0"){
                alert("添加校园卡成功！")
            }
            else if(data=="1") {
                alert("您输入的卡号已被占用！")
            }
            else if(data=="2"){
                alert("该用户名下的校园卡数量已达上限！")
            }
        })
    }


</script>

</html>