<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="Service.userService" %>
<%@ page import="north.utils.Cardinfo" %>
<%@ page import="Service.cardService" %>
<jsp:useBean id="a" class="Service.cardService"></jsp:useBean>
<%
    cardService user=new cardService();
    List<Cardinfo> users=user.getCard();
%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>校园卡列表</title>
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
        <li><a href="#">校园IC卡管理</a></li>
        <li><a href="#">校园卡列表</a></li>
    </ul>
</div>

<div class="rightinfo">
    <%if((Integer) session.getAttribute("uroot")!=2){%>
    <div class="tools">

        <ul class="toolbar">
            <li class="click"><span><img src="images/t01.png" /></span>添加</li>

        </ul>
        <ul class="toolbar1">
            <span>
                卡号：<input type="search" id="cardid-search" name="q" class="scinput" placeholder="请输入要查询的卡号">
                持有人编号：<input type="search" id="uid-search" name="q" class="scinput" placeholder="请输入要查询的持有人编号">
                持有人姓名：<input type="search" id="uname-search" name="q" class="scinput" placeholder="请输入要查询的持有人姓名">
                <button class="scbtn" onclick="search()">搜索</button>
            </span>
        </ul>

    </div>


    <table class="tablelist" style="text-align: center; width: 100%">
        <thead>
        <tr>
            <th></th>
            <th>持有人编号<i class="sort"><img src="images/px.gif" /></i></th>
            <th>持有人姓名</th>
            <th>卡号</th>
            <th>卡余额</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <% for (int i=0;i<users.size();i++){%>
        <tr id=<%="table"+i%>>
            <td><input name="" type="checkbox" value="<%=users.get(i).getUid()%>" /></td>
            <td><%=users.get(i).getUid()%></td>
            <td><%=users.get(i).getUname()%></td>
            <td><%=users.get(i).getCardid()%></td>
            <td><%=(float) users.get(i).getBalance()/100%></td>
            <td>
                <a href="javaScript:deleteCard('<%=users.get(i).getCardid()%>');" class="tablelink"> 删除</a>
                <a href="javaScript:updateCard('<%=users.get(i).getUid()%>','<%=users.get(i).getUname()%>',
                '<%=users.get(i).getCardid()%>','<%=(float) users.get(i).getBalance()/100%>');" class="tablelink" id="update"> 修改</a>
                <a href="javaScript:chargeCard('<%=users.get(i).getUid()%>','<%=users.get(i).getUname()%>',
                '<%=users.get(i).getCardid()%>','<%=(float) users.get(i).getBalance()/100%>');" class="tablelink" id="charge"> 充值</a>
                <a href="javaScript:payCard('<%=users.get(i).getUid()%>','<%=users.get(i).getUname()%>',
                '<%=users.get(i).getCardid()%>','<%=(float) users.get(i).getBalance()/100%>');" class="tablelink" id="pay"> 消费</a>

            </td>
        </tr>

        <%}%>

        <form action="/updateCard" method="post">

        <tr id="showtr"
            style=" display:none; text-align: center;border:2px; solid: #378888; ">
            <td></td>
            <td><input name="userid" id="uid" class="textinput"
                       style="width: 90%;height:30px;border:0.5px; solid: #378888;"></td>
            <td><input type="text" name="username" id="uname"
                       style="width: 90%;height:30px;border:0.5px; solid: #378888;"></td>
            <td><input readonly type="text" name="cardid" id="cardid"
                       style="width:90%;height:30px;border:0.5px ;solid :#378888;"></td>
            <td><input type="text" name="balance" id="balance"
                       style="width:90%;height:30px;border:0.5px ;solid :#378888;"></td>
            <td>
                <input type="submit" value="确定">
            </td>
        </tr>
        </form>

        <form action="/payCard" method="post">

            <tr id="showpay"
                style=" display:none; text-align: center;border:2px; solid: #378888; ">
                <td><input readonly name="type" id="typepay" class="textinput"
                           style="width: 90%;height:30px;border:0.5px; solid: #378888;"></td>
                <td><input readonly name="userid" id="uidpay" class="textinput"
                           style="width: 90%;height:30px;border:0.5px; solid: #378888;"></td>
                <td><input readonly type="text" name="username" id="unamepay"
                           style="width: 90%;height:30px;border:0.5px; solid: #378888;"></td>
                <td><input readonly type="text" name="cardid" id="cardidpay"
                           style="width:90%;height:30px;border:0.5px ;solid :#378888;"></td>
                <td><input type="text" name="amount" id="amountpay" placeholder="请输入金额"
                           style="width:90%;height:30px;border:0.5px ;solid :#378888;"></td>
                <td><input readonly type="text" name="balance" id="balancepay"
                           style="display:none">
                    <input type="submit" value="确定">
                </td>

            </tr>
        </form>
        </tbody>
    </table>


    <div class="pagin">
        <div class="message">共<i class="blue"> <%=users.size()%> </i>条记录，当前显示第&nbsp;<i class="blue">1&nbsp;</i>页</div>
        <ul class="paginList">
            <li class="paginItem"><a href="javascript:;"><span class="pagepre"></span></a></li>
            <li class="paginItem" current><a href="javascript:;">1</a></li>
            <li class="paginItem"><a href="javascript:;"><span class="pagenxt"></span></a></li>
        </ul>
    </div>


    <div class="tip">
        <div class="tiptop"><span>转到添加页面？</span><a></a></div>

        <div class="tipinfo">
            <span><img src="images/ticon.png" /></span>
            <div class="tipright">
                <p>是否转到校园卡添加页面？</p>
                <cite>如果是请点击确定按钮，否则请点取消。</cite>
            </div>
        </div>
        <div class="tipbtn">
            <input name="" type="button" class="sure" onclick="window.location.href='cardform.jsp'" value="确定" />&nbsp;
            <input name="" type="button" class="cancel" value="取消" />
        </div>

    </div>
    <%}%>
    <%if((Integer) session.getAttribute("uroot")==2){%>

    <div style="font-size: large"><%="您好，学生"+session.getAttribute("uname")+"，您的校园卡信息如下："%></div>
    <%
        List<Cardinfo> temp=new ArrayList<>();
        for(Cardinfo cardinfo:users){
            if(cardinfo.getUname().equals(session.getAttribute("uname"))){
                temp.add(cardinfo);
            }
        }
        users=temp;
    %>
    <table class="tablelist" style="text-align: center; width: 100%">
        <thead>
        <tr>
            <th>编号<i class="sort"><img src="images/px.gif" /></i></th>
            <th>姓名</th>
            <th>卡号</th>
            <th>卡余额</th>
        </tr>
        </thead>
        <tbody>
            <% for (int i=0;i<users.size();i++){%>
        <tr id=<%="table"+i%>>
            <td><%=users.get(i).getUid()%></td>
            <td><%=users.get(i).getUname()%></td>
            <td><%=users.get(i).getCardid()%></td>
            <td><%=(float) users.get(i).getBalance()/100%></td>
        </tr>

            <%}%>
    </table>

    <%}%>

</div>

<script type="text/javascript">
    $('.tablelist tbody tr:odd').addClass('odd');

    //删除用户
    function deleteCard(cardid){
        $.get("deleteCard",{cardid:cardid},function (data){
            if (data=="0"){
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
    function updateCard(uid,uname,cardid,balance){
        //控制table行的显行隐藏
        //获取对应的tr的display属性
        let dis=document.getElementById("showtr").style.display;
        if (dis=='none'){
            document.getElementById("showtr").style.display='table-row';
            document.getElementById("uname").value=uname;
            document.getElementById("cardid").value=cardid;
            document.getElementById("balance").value=balance;
            document.getElementById("uid").value=uid;
            //非标单元素赋值
            document.getElementById("showids").innerHTML=uid;
        }else {
            document.getElementById("showtr").style.display='none';
            window.location.reload();
        }
    }
    function search(){
        suid=document.getElementById("uid-search").value;
        suname=document.getElementById("uname-search").value;
        scardid=document.getElementById("cardid-search").value;
        <%for (int i=0;i<users.size();i++){ %>
            if(suid==null||suid==""||suid==<%=users.get(i).getUid()%>){
                if(suname==null||suname==""||suname==<%=users.get(i).getUname()%>){
                    if(scardid==null||scardid==""||scardid==<%=users.get(i).getCardid()%>){
                        document.getElementById("table".concat(<%=+i%>)).style=""
                    }
                    else{
                        document.getElementById("table".concat(<%=+i%>)).style="display : none"
                    }
                }
                else{
                    document.getElementById("table".concat(<%=+i%>)).style="display : none"
                }
            }
            else{
                document.getElementById("table".concat(<%=+i%>)).style="display : none"
            }
        <%}%>
    }
    function chargeCard(uid,uname,cardid,balance){
        let dis=document.getElementById("showpay").style.display;
        if (dis=='none'){
            document.getElementById("showpay").style.display='table-row';
            document.getElementById("typepay").value="您正在进行充值操作";
            document.getElementById("uidpay").value=uid;
            document.getElementById("unamepay").value=uname;
            document.getElementById("cardidpay").value=cardid;
            document.getElementById("balancepay").value=balance;
        }else {
            document.getElementById("showtr").style.display='none';
            document.location.reload();
        }
    }
    function payCard(uid,uname,cardid,balance){
        let dis=document.getElementById("showpay").style.display;
        if (dis=='none'){
            document.getElementById("showpay").style.display='table-row';
            document.getElementById("typepay").value="您正在进行消费操作";
            document.getElementById("uidpay").value=uid;
            document.getElementById("unamepay").value=uname;
            document.getElementById("cardidpay").value=cardid;
            document.getElementById("balancepay").value=balance;
        }else {
            document.getElementById("showtr").style.display='none';
            document.location.reload();
        }
    }



</script>
</body>

</html>