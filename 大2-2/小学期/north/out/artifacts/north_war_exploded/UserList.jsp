<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="Service.userService" %>
<%@ page import="north.utils.Userinfo" %>
<jsp:useBean id="a" class="Service.userService"></jsp:useBean>
<%
    userService user=new userService();
    List<Userinfo> users=a.getUser();
%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>无标题文档</title>
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $(".click").click(function () {
                $(".tip").fadeIn(200);
            });

            $(".tiptop a").click(function () {
                $(".tip").fadeOut(200);
            });

            $(".sure").click(function () {
                $(".tip").fadeOut(100);
            });

            $(".cancel").click(function () {
                $(".tip").fadeOut(100);
            });

        });
    </script>
    <script>
        <%--//非法登录校验--%>
        if (<%=session.getAttribute("uname")==null%>){
            alert("非法登录" )
            window.location.href="login.html"
        }

    </script>
</head>


<body>

<div class="place">
    <span>位置：</span>
    <ul class="placeul">
        <li><a href="#">首页</a></li>
        <li><a href="#">数据表</a></li>
        <li><a href="#">用户列表</a></li>
    </ul>
</div>

<div class="rightinfo">

    <div class="tools">

        <ul class="toolbar">
            <li class="click"><span><img src="images/t01.png" /></span>添加</li>
            <li class="click"><span><img src="images/t02.png" /></span>修改</li>
            <li><span><img src="images/t03.png" /></span>删除</li>
            <li><span><img src="images/t04.png" /></span>统计</li>
        </ul>
        <ul class="toolbar1">
            <li><span><img src="images/t05.png" /></span>设置</li>
        </ul>

    </div>


    <table class="tablelist" style="text-align: center; width: 100%">
        <thead>
        <tr>
            <th><input name="" type="checkbox" value="" checked="checked" /></th>
            <th>编号<i class="sort"><img src="images/px.gif" /></i></th>
            <th>用户名</th>
            <th>密码</th>
            <th>权限</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <% for (int i=0;i<users.size();i++){%>
        <tr>
            <td><input name="" type="checkbox" value="<%=users.get(i).getUid()%>" /></td>
            <td><%=users.get(i).getUid()%></td>
            <td><%=users.get(i).getUname()%></td>
            <td><input readonly="readonly" type="password" value="<%=users.get(i).getUpass()%>"></td>
            <td><%=users.get(i).getUroot()%></td>
            <td>
                <a href="javaScript:deleteUser('<%=users.get(i).getUid()%>');" class="tablelink"> 删除</a>
                <a href="javaScript:updateUser('<%=users.get(i).getUid()%>','<%=users.get(i).getUname()%>',
                '<%=users.get(i).getUpass()%>','<%=users.get(i).getUroot()%>');" class="tablelink" id="remove"> 修改</a>
            </td>
        </tr>

        <%}%>

        <form action="/updateUser" method="post">

        <thead>
        <tr id="showtr"
            style=" display:none; text-align: center;border:2px; solid: #378888; ">
            <td><input name="" type="checkbox" value="" /></td>
            <td><input readonly name="userid" id="userid"></td>
            <td><input type="text" name="username" id="username"
                       style="width: 90%;height:30px;border:0.5px; solid: #378888;"></td>
            <td><input type="text" name="password" id="password"
                       style="width:90%;height:30px;border:0.5px ;solid :#378888;"></td>
            <td>
<%--                <input type="hidden" name="userid" id="userid">--%>
                <select name="uroot" id="uroot">
                    <option value="0">管理员</option>
                    <option value="1">老师</option>
                    <option value="2">学生</option>
                </select>
            </td>
            <td>
                <input type="submit" value="确定">
            </td>
        </tr>
        </thead>
        </form>
        </tbody>
    </table>


    <div class="pagin">
        <div class="message">共<i class="blue">1256</i>条记录，当前显示第&nbsp;<i class="blue">2&nbsp;</i>页</div>
        <ul class="paginList">
            <li class="paginItem"><a href="javascript:;"><span class="pagepre"></span></a></li>
            <li class="paginItem"><a href="javascript:;">1</a></li>
            <li class="paginItem current"><a href="javascript:;">2</a></li>
            <li class="paginItem"><a href="javascript:;">3</a></li>
            <li class="paginItem"><a href="javascript:;">4</a></li>
            <li class="paginItem"><a href="javascript:;">5</a></li>
            <li class="paginItem more"><a href="javascript:;">...</a></li>
            <li class="paginItem"><a href="javascript:;">10</a></li>
            <li class="paginItem"><a href="javascript:;"><span class="pagenxt"></span></a></li>
        </ul>
    </div>


    <div class="tip">
        <div class="tiptop"><span>提示信息</span><a></a></div>

        <div class="tipinfo">
            <span><img src="images/ticon.png" /></span>
            <div class="tipright">
                <p>是否确认对信息的修改 ？</p>
                <cite>如果是请点击确定按钮 ，否则请点取消。</cite>
            </div>
        </div>
        <div class="tipbtn">
            <input name="" type="button" class="sure" value="确定" />&nbsp;
            <input name="" type="button" class="cancel" value="取消" />
        </div>

    </div>

</div>

<script type="text/javascript">
    $('.tablelist tbody tr:odd').addClass('odd');

    //删除用户
    function deleteUser(uid){
        $.get("deleteUser",{userid:uid},function (data){
            if (data=="1"){
                alert("删除成功")
                window.location.reload();
            }else {
                alert("删除失败")
            }
        })
    }
</script>

<script type="text/javascript">
    $('.tablelist tbody tr:odd').addClass('odd');
    //修改用户
    function updateUser(uid,uname,upass,uroot){
        //控制table行的显行隐藏
        //获取对应的tr的display属性
        let dis=document.getElementById("showtr").style.display;
        if (dis=='none'){
            document.getElementById("showtr").style.display='table-row';
            document.getElementById("username").value=uname;
            document.getElementById("password").value=upass;
            document.getElementById("uroot").value=uroot;
            document.getElementById("userid").value=uid;
            //非标单元素赋值
            document.getElementById("showids").innerHTML=uid;
        }else {
            document.getElementById("showtr").style.display='none';
            window.location.reload();
        }
    }



</script>
</body>

</html>