<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="header.jsp"%>

</head>
<body>
<br>
<div class="container mt-3">
  <h2>좋아요 누른 목록</h2>
  <br>
  <!-- Nav tabs -->
  <ul class="nav nav-tabs">
  
    <li class="nav-item">
      <a class="nav-link" data-toggle="tab" href="#menu1">숙소</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" data-toggle="tab" href="#menu2">플래너</a>
    </li>
  </ul>

  <!-- Tab panes -->
  <div class="tab-content">
   
    <div id="menu1" class="container tab-pane fade"><br>
      <h3>내가 좋아요 누른 숙소</h3>
      
    </div>
    <div id="menu2" class="container tab-pane fade"><br>
      <h3>내가 좋아요 누른 플래너</h3>
    </div>
  </div>
</div>

</body>
</body>
</html>