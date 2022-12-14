<%@page import="com.gnt.gibu.vo.GibuVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	List<GibuVo> list = (List<GibuVo>)request.getAttribute("gibuvo"); 
	int gibucnt = (Integer)request.getAttribute("gibucnt");
	int regtype = (Integer)request.getAttribute("regtype");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
*{
    box-sizing: border-box;
}

    #group_catelist ul{
    margin: 0 10%;
    height: 100px;
    background-color: #8bdcb1;
    border-radius: 10px;
}

#group_catelist ul li{
    list-style: none;
    float: left;
    width: 11.1%;
    height:100%;
    text-align: center;
}

#group_catelist ul li a span{
    font-size: 12px;
    line-height: 50px;
}
#group_catelist ul li a img{
    margin-top: 5%;
    width: 50px;
    height: 50px;
    object-fit: cover;
}


.container{
    margin: 0 10%;
    margin-top: 30px;
    height: auto;
}
.container>p {
    font-weight: 800;
    font-size: 30px;
}

.card:hover{
    text-decoration: none;
}

.card{
    float: left;
    width: 267px;
    height: 363px;
    border: 1px solid #83DDAD;
    margin: 30px 0 30px 30px;
    border-radius: 10px;
}

.card div{
    height: 50%;
}
.card div p{
    margin-top: 10px;
    font-size: 20px;
    font-weight: 700;
}
.card div pre{
    margin-top: 5px;
    font-size: 15px;
    font-weight: 700;
    text-align: center;
}

progress{
    width: 90%;
    margin-left: 5%;
    margin-right: 5%;
    height: 10px;
    -webkit-appearance: none;
}
progress::-webkit-progress-bar{
    background-color: #8bdcb1;
    border: 1px solid black;
}
progress::-webkit-progress-value{
    background-color: red;
}

.i_date{
        color: red;
        margin-right: 10%;
        font-weight: 500;
        display: block;
        text-align: right;
        margin-top: 5%;
    }
    .i_prog_percent{
        color: red;
        margin-left: 5%;
        font-weight: 500;
        font-size: 30px;
        margin-top: 5px;
    }
    .i_total_money{
        margin-right: 5%;
        float: right;
        margin-top: 5%;
        font-size: 20px;
        font-weight: 600;
    }
    .card img{
        width: 100%;
        height: 100%;
    }
    
    #outer{
	width: 1200px;
	margin: 0 auto;
	
}

#titleNo{
	color: #83DDAD;
}
</style>
</head>
<body>
    <%@ include file="../common/header.jsp" %>

	<%@ include file="gibu_header.jsp" %>
	<div id="outer">
    <div id="group_catelist">
        <ul>
            <li>

                <a href="/gibuAndTakePrj/view/gibu_done?type=0">
                    <img src="../resources/img/select_icon/1all.png" alt="????????????">
                    <br>
                    <span>????????????</span>
                </a>
            </li>

            <li>
                <a href="/gibuAndTakePrj/view/gibu_done?type=1">
                    <img src="../resources/img/select_icon/2kid.png" alt="?????? | ?????????">
                    <br>
                    <span>?????? | ?????????</span>
                </a>
            </li>

            <li>
                <a href="/gibuAndTakePrj/view/gibu_done?type=2">
                    <img src="../resources/img/select_icon/3old.png" alt="?????????">
                    <br>
                    <span>?????????</span>
                </a>
            </li>

            <li>
                <a href="/gibuAndTakePrj/view/gibu_done?type=3">
                    <img src="../resources/img/select_icon/4dis.png" alt="?????????">
                    <br>
                    <span>?????????</span>
                </a>
            </li>

            <li>
                <a href="/gibuAndTakePrj/view/gibu_done?type=4">
                    <img src="../resources/img/select_icon/5multi.png" alt="?????????">
                    <br>
                    <span>?????????</span>
                </a>
            </li>

            <li>
                <a href="/gibuAndTakePrj/view/gibu_done?type=5">
                    <img src="../resources/img/select_icon/6earth.png" alt="?????????">
                    <br>
                    <span>?????????</span>
                </a>
            </li>

            <li>
                <a href="/gibuAndTakePrj/view/gibu_done?type=6">
                    <img src="../resources/img/select_icon/7woman.png" alt="?????? | ??????">
                    <br>
                    <span>?????? | ??????</span>
                </a>
            </li>

            <li>
                <a href="/gibuAndTakePrj/view/gibu_done?type=7">
                    <img src="../resources/img/select_icon/8society.png" alt="????????????">
                    <br>
                    <span>????????????</span>
                </a>
            </li>

            <li>
                <a href="/gibuAndTakePrj/view/gibu_done?type=8">
                    <img src="../resources/img/select_icon/9animal.png" alt="??????">
                    <br>
                    <span>??????</span>
                </a>
            </li>
        </ul>
    </div>


    <div class="container">
      
        <p>????????? ??????????????? <span id="titleNo"><%= gibucnt %></span>???</p>
         
        <%for(GibuVo g : list) {%>
        <a href="/gibuAndTakePrj/view/gibu_detail?type=<%=regtype %>&num=<%=g.getRegno() %>" class="card">
            <div>
            <!-- ../resources/img/select_icon/1all.png -->
                <img src="../resources/upload/<%= g.getImgsrc()%>">
            </div>
            <div>
                <p align="center"><%= g.getRegname() %></p>
                <pre><%= g.getMnick() %></pre>
                <progress id="i_progress" value="<%= g.getMoneypercent() %>" max="100"></progress>
                <span class="i_prog_percent"><%= g.getMoneypercent() %>%</span>
                <span class="i_total_money"><%= g.getDpmoney() %>???</span>
            </div>
        </a>
        	
		<%} %>
 
         
 
     </div>
     <br clear="both">
     
     </div>
     <%@ include file="../common/footer.jsp" %>
</body>
</html>