<%@page import="com.gnt.managercategory.vo.CategoryVo"%>
<%@page import="java.util.List"%>
<%@page import="com.gnt.manager.vo.ManagerVo"%>
<%@page import="com.gnt.notice.vo.NoticeVo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	ManagerVo loginMember = (ManagerVo)session.getAttribute("loginMember");
	ArrayList<NoticeVo> voList = (ArrayList<NoticeVo>)request.getAttribute("voList");
	
	String alertMsg = (String)session.getAttribute("alertMsg");
	session.removeAttribute("alertMsg");
	
	String contextPath = request.getContextPath();
	String path = request.getContextPath();
	
	List<CategoryVo> list = (List<CategoryVo>)request.getAttribute("list");
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" type="image/x-icon" href="resources/img/free-icon-giving-5017478.png" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap" rel="stylesheet">
<style>
	*{
        font-family: 'IBM Plex Sans KR', sans-serif;
        box-sizing: border-box;
    }

    #header {
        background-color: #8bdcb1;
        width: 1905px;
        text-align: left;
        font-weight: bold;
        font-size: 36px;
        padding: 30px 0px 30px 380px;
    }
    
    #gap{
    	padding-bottom: 50px;
    }
    
    #cate{
    		color: #15462b;
            margin: 0px 55px 0px 415px;
            font-weight: bold;
            text-align: center;
    }
    
    
    #title{
    		color: #15462b;
            margin: 0px 70px 0px 430px;
            font-weight: bold;
            text-align: center;
    }

    #content{
    		color: #15462b;
            margin: 0px 70px 0px 430px;
            font-weight: bold;
    }
    
    #select{
    		border: 2px solid #acdac2;
			border-radius: 10px;
            height: 40px;
            color: black;
    }
    
    #input1{
    		border: 2px solid #acdac2;
			border-radius: 10px;
            width: 760px;
            height: 40px;
            color: black;
            margin: 2px;
    }

    #input2{
    		border: 2px solid #acdac2;
			border-radius: 10px;
            width: 760px;
            height: 500px;
            color: black;                      
            margin: 2px;
            vertical-align: middle;
    }

    #btn{
        background-color: #b3e0c9;
    	border: 2px solid #acdac2;
        margin: 0px 850px;
        margin-top: 30px;
        padding: 10px;
        font-weight: bold;
        border-radius: 15px;
        padding: 5px 20px 5px 20px;
    }

    #btn:hover{
    	background-color: #93e1b7;
        cursor: pointer;
    }
    
    #last {    
        padding: 40px;
    }
    
    #site_header{
        width: 100%;
        vertical-align: middle;
        padding-top: 15px;
        padding-bottom: 15px;
        border-bottom: 1px solid #14AE5C;
        display : flex;
        align-items: center;
    	justify-content: space-evenly;
    }

    #site_header>div{
        vertical-align: middle;
    }

    

    #siteName{
        font-size: 30px;
        vertical-align: bottom;
    }
    
    #logo_name>*{
        text-decoration: none;
    }

    
    
    #site_header a{
    	text-decoration: none;
    	color: black;
    }

    #logo_name>a>*{
        vertical-align: middle;
        height: 45px;
    }

    #siteName_small{
        font-size: 15px;
        
        
    }

    

    #serch_icon{
        width: 35px;
        height: 35px;
    }

    #login{
        font-size: 20px;
        margin-right: 15px;
    }

    #login_serch>a{
        vertical-align: middle;
    }

    .selected_bg{
        background-color: #EBF5E0;
    }

    .greenBold{
        color: #086C37;
        font-weight: bold;
    }

    .top_menu_click{
        margin-left: 5px;
        margin-right: 5px;
        padding-left : 4px;
        padding-right : 4px; 
        font-size: 30px;
        border-radius: 15px
    }
    
    .top_menu_click:hover{
        background-color: #EBF5E0;
        color : #086C37;
        font-weight: 900;
    }

    .float_right{
        float: right;
    }
    .float_right::after{
        clear: both;
    }

    #header_wrap{
        width: 1200px;
        display: flex;
        align-items: center;
        justify-content: space-evenly;
    }

    #logo{
        width: 45px;
        height: 45px;
    }

    #logo_name{
        width: 400px;
    }

    #top_menu{
        width: 450px;
    }

    #login_serch{
        width: 400px;
        display: flex;
        justify-content: flex-end;
    }
</style>
</head>
<body>
	<header id="site_header">
        <div id="header_wrap">
            <div id="logo_name">
                <a href="<%=request.getContextPath()%>">
                    <img id="logo" src="<%=path %>/resources/img/free-icon-giving-5017478.png" alt="홈페이지 로고">
                    <span id="siteName"><span class="greenBold selected_bg">기부 앤 테이크</span><span id="siteName_small" class="greenBold">Gibu n Take</span></span>
                </a>
            </div>
            <div id="top_menu" class="">
                <nav>
                    <span>
                        <a href="<%=path %>/introduce/site" class="top_menu_click">소개</a>
                        <a href="<%=path %>/view/gibu" class="top_menu_click">기부</a>
                        <a href="<%=path %>/view/funding" class="top_menu_click">펀딩</a>
                        <a href="<%=path %>/view/campaign" class="top_menu_click">캠페인</a>
                        <a href="<%=request.getContextPath()%>/story" class="top_menu_click">스토리</a>
                    </span>
                </nav>
            </div>
            <div id="login_serch" class="">
            	<c:choose>
            		<c:when test="${!empty memberVo }">
            			<a href="<%=path %>/member/MyPage"><span id="login">${memberVo.name}님</span></a>
                		<a href="<%=path %>/search"><img id="serch_icon" src="<%=path %>/resources/img/free-icon-search-149309.png" alt="검색아이콘"></a>
            		</c:when>
            		<c:otherwise>
        	    		<%if(loginMember != null){%>
							<a href="/gibuAndTakePrj/manager/logout">로그아웃</a>
						<%}else{%>
							<a href="/gibuAndTakePrj/manager/login">로그인</a>
						<%}%>&nbsp&nbsp
		                <a href="<%=path %>/search"><img id="serch_icon" src="<%=path %>/resources/img/free-icon-search-149309.png" alt="검색아이콘"></a>	
            		</c:otherwise>
            	</c:choose>
            </div>
        </div>
    </header>
	
    <div id="header">공지사항 작성</div>
    <div id="gap"></div>
    
    <form action="/gibuAndTakePrj/notice/write" method="post">
    	<input type="hidden" name="no" value="<%=loginMember.getNo() %>">
    	<label id="cate">카테고리</label>
    		<select id="select" name="cate">
                <%for(CategoryVo c : list){ %>
                 <option value="<%=c.getCategoryName()%>"><%=c.getCategoryName()%></option>
                <%} %>
            </select>
        <br><br>    
    	<label id="title">제목</label>
	    <input id="input1" type="text" name="title" required>
	    <br><br>
	    <label id="content">내용</label> 
	    <textarea id="input2" name="content"></textarea>
	    
	    <div>
            <input id="btn" type="submit" value="공지사항 등록">
        </div>
	    
    </form>
    	
    
    <div id="last"></div>

    <%@include file="/views/common/footer.jsp" %>
</body>
</html>