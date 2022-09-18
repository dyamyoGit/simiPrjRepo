<%@page import="java.util.ArrayList"%>
<%@page import="com.gnt.pay.vo.PaymentVo"%>
<%@page import="java.util.List"%>
<%@page import="com.gnt.funding.vo.FundingVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	FundingVo vo = (FundingVo)request.getAttribute("fundingvo");
	request.getSession().setAttribute("fundingvo", vo);
	List<PaymentVo> pVo = (ArrayList<PaymentVo>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기부앤테이크</title>

<style>

    section>*{
        display: flex;
        flex-direction: column;
        align-items: center;
        box-sizing: border-box;
    }

    #pay_title{
        display: flex;
        flex-direction: column;
        align-items: center;
        margin-top: 30px;
        margin-bottom: 30px;
    }

    .pay_div_title_mini{
        font-size: 20px;
    }

    .pay_div_title{
        font-size: 35px;
        margin-right: 10px;
    }

    #pay_body{
        width: 1162px;
    }

    .pay_border{
        border: 1px solid #5c5c5c6c;
        padding: 10px;
    }

    .donate_money{
        height: 53px;
        box-sizing: border-box;
        color: #14AE5C;
        font-size: 47px;
        text-align: right;
    }

    .donate_won{
        font-size: 35px;
    }

    .pay_select_name{
        font-size: 20px;
        
    }

    #pay_body_money{
        padding-top: 50px;
        padding-bottom: 50px;
    }

    #pay_body_money>*{
        display: flex;
        align-items: center;
        justify-content: space-between;
    }

    #pay_btn_div{
        margin-top: 40px;
        margin-bottom: 40px;
    }

    #pay_btn{
        width: 150px;
        height: 70px;
        font-size: 30px;
        text-align: center;
        border: 1px solid #5c5c5c;
        background-color: #E4F4D2;
        border-radius: 50px;
    }

    #pay_body_send{
        padding-top: 50px;
        padding-bottom: 50px;
        margin-top: 20px;
        display: flex;
        flex-direction: column;
    }

    #pay_send_addr>*>*>*{
        padding: 10px;
    }
    
    #pay_body_select{
    	margin-top : 20px;
        padding-top: 50px;
        padding-bottom: 50px;
    }

</style>

</head>
<body>
<%@include file="/views/common/header.jsp" %>

    <section>
        <form action="<%=path %>/funding/pay" method="post">
        	<input type="hidden" name="num" value="<%= vo.getRegno() %>">
        	<input type="hidden" name="mno" value="<%= memberVo.getNo()%>">
        	<input type="hidden" name="addmoney" value="<%=vo.getRewmoney() %>">
            <div id="pay_title">
                <strong class="pay_div_title"><%= vo.getRegname() %></strong>
                <span class="pay_div_title_mini"><%= vo.getMnick() %></span>
            </div>
            
            <div id="pay_body">
                <div id="pay_body_title" class="pay_border">
                    <span class="pay_div_title_mini">펀딩내역</span>
                </div>
                <div id="pay_body_money" class="pay_border">
                    <span>
                        <span class="pay_div_title"><%= vo.getRewname() %></span>
                        <span class="donate_money donate_won"><%=vo.getRewmoney() %> (<%=vo.getRewcnt() %> 개) 원</span>
                    </span>
                </div>
                
                <div id="pay_body_select" class="pay_border">
                    <span class="pay_div_title">결제 수단</span>
                    <div>
                    
            		<c:if test="${!empty loginMember }">
                       	<c:forEach items="${list}" var="p">
                       	<c:set var="i" value="${i+1}"/>
                        	<input type="radio" name="pNo" id="${i}" class="pay_select_name" value="${p.pNo}" checked>
                        	<label for="${i}" class="pay_select_name">${p.pName} : ${p.pNumber}</label>
						</c:forEach>
            		</c:if>
            		<c:if test="${!empty loginCorp }">
                       	<c:forEach items="${pVo}" var="p">
                       	<c:set var="i" value="${i+1}"/>
                        	<input type="radio" name="pNo" id="${i}" class="pay_select_name" ${p.pNo} checked>
                        	<label for="${i}" class="pay_select_name">${p.pName} : ${p.pNumber}</label>
						</c:forEach>
            		</c:if>
            	
                    </div>
                </div>
                
                <div id="pay_body_send" class="pay_border">
                    <span class="pay_div_title_mini">배송지</span>
                    <table id="pay_send_addr">
                        <tr>
                            <td>이름</td>
                            <td><input type="text" name="" id=""></td>
                        </tr>
                        <tr>
                            <td>연락처</td>
                            <td><input type="text" name="" id=""></td>
                        </tr>
                        <tr>
                            <td>배송지</td>
                            <td><input type="text" name="" id="" style="width: 300px;"></td>
                        </tr>
                    </table>
                </div>
            </div>

            <div id="pay_btn_div">
                <input type="submit" value="결제하기" id="pay_btn">
            </div>

        </form>
    </section>


<%@include file="/views/common/footer.jsp" %>
</body>
</html>