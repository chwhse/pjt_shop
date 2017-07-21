<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

							<form:form commandName="OrdersVO" name="dataForm" id="dataForm" >
							<input type="text" name="ordersVOList[i].ocode" >
							<input type="text" name="ordersVOList[i].ono" >
							<input type="text" name="ordersVOList[i].uid" >
							<input type="text" name="ordersVOList[i].goods" >
							<input type="text" name="ordersVOList[i].oquantity" >
							<input type="text" name="ordersVOList[i].ototalprice" >
							</form:form>
</body>
</html>