<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.CustomerDao"%>
<%@page import="dao.GoodsDao"%>
<%@page import="vo.Goods"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>마이페이지</title>
	<link rel="icon" href="img/Fevicon.png" type="image/png">
  <link rel="stylesheet" href="vendors/bootstrap/bootstrap.min.css">
  <link rel="stylesheet" href="vendors/fontawesome/css/all.min.css">
	<link rel="stylesheet" href="vendors/themify-icons/themify-icons.css">
	<link rel="stylesheet" href="vendors/linericon/style.css">
  <link rel="stylesheet" href="vendors/owl-carousel/owl.theme.default.min.css">
  <link rel="stylesheet" href="vendors/owl-carousel/owl.carousel.min.css">
  <link rel="stylesheet" href="vendors/nice-select/nice-select.css">
  <link rel="stylesheet" href="vendors/nouislider/nouislider.min.css">

  <link rel="stylesheet" href="css/style.css">
  
  <!--구글폰트 -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="css/font.css">
</head>
<body>
<%
	int customerNo = (Integer) session.getAttribute("customerNo");

	CustomerDao customerDao = new CustomerDao();
	ArrayList<HashMap<String,Object>> list = customerDao.customerOne(customerNo);
	
	String msg = request.getParameter("msg");
%>

	<!--================ Start Header Menu Area ===============-->
	  <%
	  	if(session.getAttribute("customerNo") != null) {
	  %>
	  		<jsp:include page="/inc/customerLoginMenu.jsp"></jsp:include>
	  <% 	
	  	} else {
	  %>
	  		<jsp:include page="/inc/customerLogoutMenu.jsp"></jsp:include>
	  <% 	
	  	}
	  %>
  <!--================ End Header Menu Area =================-->
  
  <!--================Login Box Area =================-->
	<section class="login_box_area section-margin">
		<div class="container">
			<div class="login_form_inner register_form_inner mx-auto" style="width:500px;">
				<h3>마이페이지</h3>
				
			<% 
				for(HashMap<String,Object> map : list) {
			%>				
				<form class="row login_form" action="<%=request.getContextPath()%>/updateCustomerOneAction.jsp">
		            <div class="col-md-12 form-group">
		            	<div>ID : <input type="text" value="<%=map.get("customerId")%>" readonly></div>
		            </div>
		            <div class="col-md-12 form-group">
		            	<div>이름 : <input type="text" value="<%=map.get("customerName")%>" name="customerName"></div>
		            </div>
		            <div class="col-md-12 form-group">
		            	<div>현재 비밀번호 : <input type="password" name="oldPw"></div>
		            </div>
		            <div class="col-md-12 form-group">
		            	<div>수정할 비밀번호 : <input type="password" name="newPw"></div>
		            </div>
		            <div class="col-md-12 form-group">
		            	<div>휴대폰 번호 : <input type="text" value="<%=map.get("customerPhone")%>" name="customerPhone"></div>
		            </div>      
        	        <div class="col-md-12 form-group">
		            	<div>주소 : <input type="text" value="<%=map.get("address")%>" name="address"></div>
		            </div>       
		            <div class="form-group container" style="width:400px;">
						<button style="font-size:15px; margin:10px;" class="btn btn-light">수정완료</button>
					</div>         
				</form>
			<%
				}
			%>
				
			</div>		
		</div>
	</section>
	<!--================End Login Box Area =================-->


  <script src="vendors/jquery/jquery-3.2.1.min.js"></script>
  <script src="vendors/bootstrap/bootstrap.bundle.min.js"></script>
  <script src="vendors/skrollr.min.js"></script>
  <script src="vendors/owl-carousel/owl.carousel.min.js"></script>
  <script src="vendors/nice-select/jquery.nice-select.min.js"></script>
  <script src="vendors/jquery.ajaxchimp.min.js"></script>
  <script src="vendors/mail-script.js"></script>
  <script src="js/main.js"></script>
</body>
</html>