<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>숙소 결제 완료</title>
</head>
<body>

<script>
	function questionGoResYnF() {
		
		let confirmYnF = confirm("예약현황으로 가시겠습니까?\n(아니오 하시면 메인페이지로 이동합니다.)");
		
		if(confirmYnF == true) {
			location.href = "getReservationList.do";
		} else {
			location.href = "main.do";
		}
		
	}
	
	questionGoResYnF();
</script>
	
</body>
</html>